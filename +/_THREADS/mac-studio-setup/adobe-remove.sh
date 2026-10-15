#!/bin/bash
# adobe-remove.sh - remove Adobe Creative Cloud and every app it installed from this Mac.
#
# Dry run by default: lists what it finds and what it would do, and changes nothing.
#   ./adobe-remove.sh              dry run
#   sudo ./adobe-remove.sh --apply remove
#
# Uses Adobe's own command-line tools (HDBox Setup, then the Creative Cloud Uninstaller),
# never the Creative Cloud app or an Adobe sign-in. Where those fail, it removes the app
# bundles and Adobe's launch agents, launch daemons and privileged helpers, unloading each
# first. User data stays: caches, preferences, presets, Lightroom catalogues and photos are
# left for ADOBE-DATA. Ends with what is left and its sizes, and writes a log beside itself.

set -uo pipefail

usage() {
  sed -n '2,7p' "$0" | sed 's/^# \{0,1\}//'
}

apply=0
case "${1:-}" in
  '') ;;
  --apply) apply=1 ;;
  -h | --help) usage; exit 0 ;;
  *) usage >&2; exit 2 ;;
esac
[ $# -le 1 ] || { usage >&2; exit 2; }

if [ "$apply" -eq 1 ]; then
  if [ "$(id -u)" -ne 0 ]; then
    echo "--apply needs sudo: sudo $0 --apply" >&2
    exit 1
  fi
  if [ -z "${SUDO_USER:-}" ] || [ "$SUDO_USER" = root ]; then
    echo "Run --apply with sudo from your own account, not as root." >&2
    exit 1
  fi
  target_user=$SUDO_USER
  mode=apply
else
  target_user=${SUDO_USER:-$(id -un)}
  mode=dry-run
fi
target_uid=$(id -u "$target_user")
user_home=$(dscl . -read "/Users/$target_user" NFSHomeDirectory | awk '{print $2}')

script_dir=$(cd "$(dirname "$0")" && pwd)
log="$script_dir/adobe-remove.$(hostname -s).$(date +%Y%m%d-%H%M%S).$mode.log"
exec > >(tee -a "$log") 2>&1
finish() {
  if [ "$(id -u)" -eq 0 ]; then chown "$target_user" "$log"; fi
}
trap finish EXIT

hdbox_setup="/Library/Application Support/Adobe/Adobe Desktop Common/HDBox/Setup"
cc_uninstaller="/Applications/Utilities/Adobe Creative Cloud/Utils/Creative Cloud Uninstaller.app/Contents/MacOS/Creative Cloud Uninstaller"
hdpim_db="/Library/Application Support/Adobe/Caps/hdpim.db"

# Creative Cloud's own bundles, removed by the fallback if its uninstaller leaves them.
cc_bundles=(
  "/Applications/Adobe Creative Cloud"
  "/Applications/Utilities/Adobe Creative Cloud"
  "/Applications/Utilities/Adobe Creative Cloud Experience"
  "/Applications/Utilities/Adobe Application Manager"
  "/Applications/Utilities/Adobe Genuine Service"
  "/Applications/Utilities/Adobe Installers"
  "/Applications/Utilities/Adobe Sync"
)

failures=0

section() { printf '\n== %s\n' "$*"; }

# Run a command under --apply, or say what would run.
run() {
  if [ "$apply" -eq 1 ]; then
    printf '+ %s\n' "$(printf '%q ' "$@")"
    "$@"
    local rc=$?
    [ "$rc" -eq 0 ] || printf '  exit %s\n' "$rc"
    return "$rc"
  fi
  printf 'would run: %s\n' "$(printf '%q ' "$@")"
}

# Delete one Adobe path, refusing anything outside the places the fallback may touch.
remove_path() {
  local path=$1
  case "$path" in
    "/Applications/Adobe "* | "/Applications/Utilities/Adobe "* | \
      /Library/LaunchAgents/com.adobe.* | /Library/LaunchDaemons/com.adobe.* | \
      "$user_home"/Library/LaunchAgents/com.adobe.* | /Library/PrivilegedHelperTools/com.adobe.*) ;;
    *)
      echo "refusing to remove $path: outside the fallback's paths"
      failures=$((failures + 1))
      return 1
      ;;
  esac
  [ -e "$path" ] || [ -L "$path" ] || return 0
  run rm -rf -- "$path" || failures=$((failures + 1))
}

# PIDs of running Adobe processes, matched on the executable's path so nothing that only
# mentions Adobe in its arguments is caught.
adobe_pids() {
  ps -axo pid=,comm= | awk '
    { pid = $1; sub(/^ *[0-9]+ /, "") }
    index($0, "/Applications/Adobe ") == 1 ||
    index($0, "/Applications/Utilities/Adobe ") == 1 ||
    index($0, "/Library/Application Support/Adobe/") == 1 ||
    index($0, "/Library/PrivilegedHelperTools/com.adobe.") == 1 { print pid }'
}

list_adobe_processes() {
  local pid
  for pid in $(adobe_pids); do
    printf '  %s %s\n' "$pid" "$(ps -o comm= -p "$pid" | sed 's|.*/||')"
  done
}

stop_adobe_processes() {
  local pids
  pids=$(adobe_pids)
  [ -n "$pids" ] || { echo "No Adobe processes running."; return 0; }
  list_adobe_processes
  # shellcheck disable=SC2086 # one PID per word
  run kill -TERM $pids
  [ "$apply" -eq 1 ] || return 0
  sleep 5
  pids=$(adobe_pids)
  # shellcheck disable=SC2086
  [ -z "$pids" ] || run kill -KILL $pids
}

# Installed products from Adobe's install database, one per line:
# SAPCode, ProductVersion, BaseVersion, Platform, InstallDir and Name, tab-separated.
# "apps" are top-level products; "components" are the ones apps pull in, such as Camera Raw.
products() {
  local kind=$1 filter
  [ -r "$hdpim_db" ] || return 0
  case "$kind" in
    apps) filter="NOT IN" ;;
    components) filter="IN" ;;
  esac
  sqlite3 -readonly -separator $'\t' "$hdpim_db" "
    SELECT p.SAPCode, p.ProductVersion,
      $(meta BaseVersion), $(meta Platform), $(meta InstallDir), $(meta Name)
    FROM product_installation_info p
    WHERE $(meta isVisibleProduct) = 'true'
      AND p.SAPCode $filter (SELECT SAPCode FROM product_reference_info)
    ORDER BY p.SAPCode, p.ProductVersion DESC;"
}

meta() {
  printf "coalesce((SELECT trim(m.Value, char(9, 10, 13, 32)) FROM product_installation_meta_info m
    WHERE m.SAPCode = p.SAPCode AND m.ProductVersion = p.ProductVersion
      AND m.ProcessorFamily = p.ProcessorFamily AND m.Key = '%s'), '')" "$1"
}

hdbox_uninstall() {
  local sap=$1 version=$2 base=$3 platform=$4 dir=$5 name=$6
  echo "$name $version ($sap, base $base, $platform)${dir:+ in $dir}"
  if [ -z "$base" ] || [ -z "$platform" ]; then
    echo "  no base version or platform recorded; leaving it to the fallback"
    return 1
  fi
  run "$hdbox_setup" --uninstall=1 "--sapCode=$sap" "--baseVersion=$base" \
    "--platform=$platform" --deleteUserPreferences=false
}

launchd_items() {
  local dir
  for dir in /Library/LaunchDaemons /Library/LaunchAgents "$user_home/Library/LaunchAgents"; do
    [ -d "$dir" ] && find "$dir" -maxdepth 1 -name 'com.adobe.*' 2>/dev/null
  done
}

leftovers() {
  section "What is left: apps, launchd items, helpers and processes"
  ls -d /Applications/Adobe* /Applications/Utilities/Adobe* 2>/dev/null
  launchd_items
  find /Library/PrivilegedHelperTools -maxdepth 1 -name 'com.adobe.*' 2>/dev/null
  launchctl print system 2>/dev/null | grep -io 'com\.adobe\.[a-z0-9._-]*' | sort -u | sed 's/^/  loaded (system): /'
  launchctl print "gui/$target_uid" 2>/dev/null | grep -io 'com\.adobe\.[a-z0-9._-]*' | sort -u |
    sed 's/^/  loaded (user): /'
  list_adobe_processes
  products apps | cut -f1,2,6 | sed 's/^/  recorded app: /'
  products components | cut -f1,2,6 | sed 's/^/  recorded component: /'

  section "Adobe folders kept for ADOBE-DATA, with sizes"
  find /Library "$user_home/Library" -maxdepth 3 -iname '*adobe*' -prune -exec du -sh {} + 2>/dev/null
  section "Lightroom catalogues kept"
  find "$user_home/Pictures" -maxdepth 4 -name '*.lrcat' 2>/dev/null
}

echo "adobe-remove on $(hostname -s), $(date '+%Y-%m-%d %H:%M %Z'), $mode, for $target_user"
echo "Log: $log"
[ "$apply" -eq 1 ] || echo "Dry run: nothing is changed. Run 'sudo $0 --apply' to remove."

# 1. Inventory.
section "1. Installed Adobe apps (from Adobe's install database)"
apps=$(products apps)
components=$(products components)
if [ -n "$apps" ]; then
  printf '%s\n' "$apps" | awk -F'\t' '{ printf "  %s %s (%s, base %s, %s) in %s\n", $6, $2, $1, $3, $4, $5 }'
else
  echo "  none"
fi
echo "Components they pulled in:"
if [ -n "$components" ]; then
  printf '%s\n' "$components" | awk -F'\t' '{ printf "  %s %s (%s)\n", $6, $2, $1 }'
else
  echo "  none"
fi
echo "Creative Cloud:"
for path in "${cc_bundles[@]}"; do
  [ -e "$path" ] && echo "  $path"
done
[ -x "$cc_uninstaller" ] && echo "  uninstaller: $cc_uninstaller"
echo "Launch agents, launch daemons and helpers:"
launchd_items | sed 's/^/  /'
find /Library/PrivilegedHelperTools -maxdepth 1 -name 'com.adobe.*' 2>/dev/null | sed 's/^/  /'

# Lightroom and Photoshop are quit by hand, so the catalogue closes cleanly and no work is lost.
open_apps=$(ps -axo comm= | awk '/^\/Applications\/Adobe (Photoshop [0-9]+|Lightroom Classic)\//' | sed 's|.*/||' | sort -u)
if [ -n "$open_apps" ]; then
  section "Still open"
  printf '  %s\n' "$open_apps"
  if [ "$apply" -eq 1 ]; then
    echo "Save your work and quit these apps, then run this again. Nothing has been changed."
    exit 1
  fi
  echo "Quit these before running --apply."
fi

# 2. Quit the Adobe background processes.
section "2. Quit Adobe processes"
stop_adobe_processes

# 3. Uninstall each app with HDBox, keeping preferences; then any component left unreferenced.
section "3. Uninstall apps with Adobe's HDBox Setup"
if [ -z "$apps" ]; then
  echo "No apps to uninstall."
elif [ ! -x "$hdbox_setup" ]; then
  echo "HDBox Setup is missing; the fallback in step 5 removes the app folders."
  failures=$((failures + 1))
else
  while IFS=$'\t' read -r sap version base platform dir name; do
    hdbox_uninstall "$sap" "$version" "$base" "$platform" "$dir" "$name" || failures=$((failures + 1))
  done <<<"$apps"
fi

[ "$apply" -eq 1 ] && components=$(products components)
if [ -n "$components" ] && [ -x "$hdbox_setup" ]; then
  echo "Components still recorded$([ "$apply" -eq 1 ] || echo ' (if HDBox leaves them once the apps are gone)'):"
  while IFS=$'\t' read -r sap version base platform dir name; do
    hdbox_uninstall "$sap" "$version" "$base" "$platform" "$dir" "$name" || failures=$((failures + 1))
  done <<<"$components"
fi

# 4. Creative Cloud itself, last.
section "4. Uninstall Creative Cloud with its uninstaller in command-line mode"
if [ -x "$cc_uninstaller" ]; then
  [ "$apply" -eq 0 ] || stop_adobe_processes
  run "$cc_uninstaller" -u || failures=$((failures + 1))
else
  echo "Creative Cloud Uninstaller not found; the fallback in step 5 removes what is left."
fi

# 5. Fallback: unload and remove whatever Adobe's tools left behind.
section "5. Fallback: remove what Adobe's tools left"
if [ "$apply" -eq 1 ]; then
  echo "Removing only what is still present."
else
  echo "Under --apply this runs only for what steps 3 and 4 leave; today it would be:"
fi
while IFS= read -r plist; do
  [ -n "$plist" ] || continue
  label=$(plutil -extract Label raw -o - "$plist" 2>/dev/null || basename "$plist" .plist)
  case "$plist" in
    /Library/LaunchDaemons/*) domain=system ;;
    *) domain=gui/$target_uid ;;
  esac
  # A service that is not loaded makes bootout fail; that is fine, so the plist still goes.
  run launchctl bootout "$domain/$label" || true
  remove_path "$plist"
done <<<"$(launchd_items)"

while IFS= read -r helper; do
  [ -n "$helper" ] && remove_path "$helper"
done <<<"$(find /Library/PrivilegedHelperTools -maxdepth 1 -name 'com.adobe.*' 2>/dev/null)"

[ "$apply" -eq 0 ] || stop_adobe_processes

bundles=("${cc_bundles[@]}")
while IFS=$'\t' read -r _ _ _ _ dir _; do
  [ -n "$dir" ] && bundles+=("$dir")
done <<<"$apps"
for path in "${bundles[@]}"; do
  remove_path "$path"
done

# Anything else named Adobe in Applications is not Creative Cloud's; report it, leave it.
for path in /Applications/Adobe* /Applications/Utilities/Adobe*; do
  [ -e "$path" ] || continue
  known=0
  for b in "${bundles[@]}"; do
    [ "$path" = "$b" ] && known=1
  done
  [ "$known" -eq 1 ] || echo "Not touched, send to the thread: $path"
done

# 6. What is left.
leftovers

section "Result"
if [ "$apply" -eq 1 ]; then
  echo "Done with $failures step(s) that failed or fell back. Send this log to the thread: $log"
else
  echo "Dry run finished. Nothing was changed. Log: $log"
fi
