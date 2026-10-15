---

---

---

# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio setup](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › webcam-compare

**Run report at 22:50 BST · last mark 17:47 BST**

---

## Done

- **Shortlisted 13 webcams with built-in microphones for sol.** Each amazon.co.uk `/dp/` page was fetched read-only on 15 October 2026 between 22:00 and 22:45 BST, and its title was checked against the product. I bought nothing, signed in nothing, added nothing to a basket and posted nothing. This research only covers webcams. It replaces the webcam part of the earlier [desk-resume report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-setup/desk-resume.report.md); the microphone and speaker parts of that report still stand for later.
- **Limitation, Amazon pages:** Amazon blocked desktop page fetches part-way through, so most prices and ratings come from Amazon's mobile product page for the same `/dp/` number. Where a star rating or stock line could not be read reliably, the table says so. All prices are the product page's own buy-box price unless marked otherwise.
- **Limitation, macOS 27:** no maker lists macOS 27 yet. Every camera below is sold as plug-and-play UVC video and UAC audio, which macOS supports with no driver. Only the optional apps depend on the OS version.
- **No commits.** This report and the status file are the only files written.

### UGREEN FineCam Pro (the listing Kris found)

[UGREEN FineCam Pro, B0FX5QMB6K](https://www.amazon.co.uk/dp/B0FX5QMB6K). The page title reads "UGREEN FineCam Pro Webcam, 4K/30fps Ultra HD Webcam for PC with 1/2" Sensor".

- **Price and stock:** £57.78 on the product page (RRP £69.99, -17%), in stock, 15 Oct 2026.
- **Rating:** 3.8 out of 5 from 334 ratings. Amazon's review summary is mixed on image quality, white balance and reliability. Buyers mention autofocus zooming in and out by itself, lag at 1440p and 4K, and the picture coming out rotated.
- **Sensor:** 1/2-inch, 4K30 or 1080p60, PDAF autofocus, f/1.8.
- **Connector:** a USB cable is included. One buyer describes it as a 2 m USB-C cable. The listing does not say whether the host end is USB-C or USB-A. UGREEN's own FAQ asks for a USB 3.0 port for 4K.
- **Microphones:** a dual-mic array with AI noise reduction and 360-degree pickup. The only audio verdict I found is from [Korben](https://korben.info/en/ugreen-finecam-pro-4k-webcam-review.html), which says the mics "work really well". There are no measured or detailed audio tests, and the microphones cannot be adjusted.
- **Privacy:** a built-in sliding lens cover.
- **Mounting:** a magnetic monitor mount and a small extendable tripod. There is no tripod thread on the camera itself, and one buyer found the magnet weak.
- **macOS:** listed as driver-free for Windows, macOS and Linux. One buyer plugged it straight into a Mac with nothing to install.
- **App:** none. Framing, zoom and portrait mode run on the camera and are driven by hand gestures; [OCinside](https://www.ocinside.de/review/ugreen_finecam_pro_4k/) confirms there is no control app. Image tweaks go through Zoom or OBS.

### Comparison

All prices were seen on 15 Oct 2026. "Page" means the amazon.co.uk product page's buy-box price.

| Product | Price and date | Sensor and resolution | Mics | Connector | Privacy cover | App needed for extras | Link |
|---|---|---|---|---|---|---|---|
| UGREEN FineCam Pro | £57.78 page, in stock; 3.8 (334) | 1/2", 4K30 | 2, AI noise reduction; thin review evidence | USB cable, about 2 m; host end not stated | Built-in slider | None: gestures run on the camera | [B0FX5QMB6K](https://www.amazon.co.uk/dp/B0FX5QMB6K) |
| **Insta360 Link 2C Pro** | £199.00 page; 4.5 (249) per search snippet; listed in stock on Amazon's newer-model panel | **1/1.3", 4K30**, HDR, dual native ISO | **2, beamforming**, 4 modes (Standard, Focus, Wide, Original), AI noise reduction | USB-C, USB-A adapter included | Built-in shutter | Insta360 Link Controller: Homebrew cask `insta360-link-controller`; not on the Mac App Store | [B0G3SSQMJQ](https://www.amazon.co.uk/dp/B0G3SSQMJQ) |
| Insta360 Link 2 Pro | £239.00 page (RRP £349), in stock; 4.6 (444) | 1/1.3", 4K30, 2-axis gimbal | 2, beamforming, same 4 modes | USB-C, USB-A adapter | Gimbal turns down; no shutter | Link Controller, as above | [B0G3T1QKWL](https://www.amazon.co.uk/dp/B0G3T1QKWL) |
| Insta360 Link 2 | £199.99 page, in stock; 4.6 (1,558) | 1/2", 4K30, 2-axis gimbal | 1 omni, AI noise modes | USB-C (C-to-C cable plus A adapter) | Gimbal turns down | Link Controller, as above | [B0DDTH3HX8](https://www.amazon.co.uk/dp/B0DDTH3HX8) |
| Insta360 Link 2C | No buy-box price on page; Amazon points to the 2C Pro as newer; PriceSpy search snippet says from £161.49 at Amazon; 4.5 (1,295) | 1/2", 4K30 | 1 omni, AI noise modes | USB-C, A adapter | Built-in slider | Link Controller, as above | [B0DDTGY8FG](https://www.amazon.co.uk/dp/B0DDTGY8FG) |
| Insta360 Link (original, 2022) | No price; page reads currently unavailable; 4.5 (1,453) | 1/2", 4K30, 3-axis gimbal | Noise-cancelling mics; count not verified | USB-C | Gimbal turns down | Link Controller, as above | [B0B826KS4B](https://www.amazon.co.uk/dp/B0B826KS4B) |
| OBSBOT Tiny 3 | £296.00 page (RRP £349); search snippet said only 1 left; 4.3 (240) | 1/1.28", 4K30 or 1080p120, gimbal | **3 MEMS** (1 omni and 2 directional), 24-bit/48 kHz, 5 modes including raw | USB-C, USB-A adapter | Gimbal turns down; sleep mode | OBSBOT Center: direct download only, not on Homebrew or the Mac App Store | [B0G636CXQM](https://www.amazon.co.uk/dp/B0G636CXQM) |
| OBSBOT Tiny 3 Lite | £169.00 page (-15%), in stock; 4.2 (326) | 1/2", 4K30 or 1080p120, gimbal | 3, the same array as Tiny 3 | USB-C | Gimbal turns down | OBSBOT Center, as above | [B0G63LXK6R](https://www.amazon.co.uk/dp/B0G63LXK6R) |
| OBSBOT Tiny 2 | £349.00 page, in stock; 1,046 ratings, stars not read | 1/1.5", 4K30, gimbal | 2 omni, noise reduction rated weak | USB-C | Gimbal turns down | OBSBOT Center, as above | [B0C3B6ZR1V](https://www.amazon.co.uk/dp/B0C3B6ZR1V) |
| OBSBOT Tiny 2 Lite | £179.00 page; 4.3 (1,997) | 1/2", 4K30, gimbal | 2 omni, adjustable noise reduction | USB-C | Gimbal turns down | OBSBOT Center, as above | [B0CZ6XY78Y](https://www.amazon.co.uk/dp/B0CZ6XY78Y) |
| OBSBOT Meet 2 (green) | £99.00 page (RRP £129); stock line unclear; 185 ratings, stars not read | 1/2", 4K30, fixed | 2 omni, adjustable noise reduction | USB-C, A adapter | Stick-on cover in the box | OBSBOT Center, as above | [B0D9W7YLV7](https://www.amazon.co.uk/dp/B0D9W7YLV7) |
| OBSBOT Meet 2 (Space Grey) | Page reads currently unavailable | As above | As above | As above | As above | As above | [B0F48B4FTH](https://www.amazon.co.uk/dp/B0F48B4FTH) |
| Logitech MX Brio | £141.18 page; only 2 left; 4.5 (794) | Sensor size not published (8.5 MP Sony STARVIS), 4K30 | 2, beamforming, noise suppression | USB-C to USB-C, 1.5 m | Built-in twist shutter | Logi Tune (cask `logitune`) or Logi Options+ (cask `logi-options+`); neither on the Mac App Store | [B07W4DHLWV](https://www.amazon.co.uk/dp/B07W4DHLWV) |

Considered and dropped: the Elgato Facecam 4K and Facecam Pro have no microphone, and the Anker PowerConf C200 is 2K only.

### What reviewers say about the built-in mics

- **OBSBOT Tiny 3 and Tiny 3 Lite:** the strongest webcam audio reviews. [PCWorld](https://www.pcworld.com/article/3100131/obsbot-tiny-3-webcam-review.html) says the mics made the reviewer's "voice sound professional" from the top of a monitor, and [Yanko Design](https://www.yankodesign.com/2026/01/28/obsbot-tiny-3-4k-ptz-webcam-review-audio-as-a-first-class-citizen/) says audio is where it "stands apart". The weak points: [PC Gamer](https://www.pcgamer.com/hardware/webcams/obsbot-tiny-3-review/) found it let through more background sound than it would like, PCWorld needed the laptop's own noise filter to cope with music, and when recording or streaming at 1080p or above only Smart Omni mode is available, which picks up the whole room. [Gizmochina](https://www.gizmochina.com/2026/05/03/obsbot-tiny-3-and-tiny-3-lite-full-review/) says the Lite has the same triple-mic system.
- **Insta360 Link 2 Pro and Link 2C Pro:** good and directional. [TechReviewer](https://en.techreviewer.de/insta360-link-2-pro-link-2c-pro-test/) says voices stay clear "even at a greater distance" while keyboard noise is reduced without making the voice sound unnatural. [GearBrain](https://www.gearbrain.com/insta360-link-2-pro-webcam-review-2677788421.html) reports colleagues heard "clean and crisp" audio. [RedShark](https://www.redsharknews.com/insta360-link-2-pro-review-webcam-ai-tracking) says it is "occasionally a little bit metallic". [Basic Tutorials](https://basic-tutorials.com/reviews/peripherals/insta-360-link-2-pro-link-2c-pro-review/) scores audio 93/100 but finds Standard mode clips soft syllables and prefers Wide or Original. Focus mode favours the person in front of the camera.
- **Logitech MX Brio:** "good quality" beamforming mics, according to [Digital Camera World](https://www.digitalcameraworld.com/reviews/logitech-mx-brio-review), but reviewers say they will not replace a USB microphone.
- **OBSBOT Tiny 2, Tiny 2 Lite and Meet 2:** dual omni mics that are fine for calls in a quiet room. [Windows Central](https://www.windowscentral.com/accessories/obsbot-tiny-2-review) calls the mic the Tiny 2's "single largest weakness". Meet 2 audio scores 7 to 7.5 out of 10 at [Tech4Gamers](https://tech4gamers.com/obsbot-meet-2-review/) and [Home Office Research](https://www.homeofficeresearch.com/webcams/obsbot-meet-2-review/).
- **Insta360 Link 2 and Link 2C:** one omni mic each, which is why the Pro models double it.

### Recommendation

- **Recommended: [Insta360 Link 2C Pro](https://www.amazon.co.uk/dp/B0G3SSQMJQ), £199.00.**
  - It has the largest sensor at the price (1/1.3 inch).
  - Its two beamforming mics have a Focus mode aimed at one person at a desk, which suits both calls and dictation.
  - It has a built-in shutter and no motor or gimbal to fuss with, and works as plain UVC/UAC with no driver.
  - Its optional app is a Homebrew cask, so Rig can manage it alongside the rest of sol.
  - The Link 2 Pro adds only gimbal tracking, for £40 more.
- **Cheaper alternative: [OBSBOT Tiny 3 Lite](https://www.amazon.co.uk/dp/B0G63LXK6R), £169.00.**
  - It has the same three-mic array as the £296 Tiny 3, which has the best-reviewed webcam audio, on a 1/2-inch sensor.
  - Against that, there is no lens shutter (the gimbal turns down instead), it is forced into omni mode at 1080p and above while recording, and OBSBOT Center has to be downloaded by hand.
  - For the lowest price, the UGREEN FineCam Pro at £57.78 has the right sensor and a shutter, but its microphones have barely been tested and its buyer reliability reports are the weakest here.

### Built-in mics for dictation compared with a close USB microphone

A webcam on top of a monitor is roughly 60 to 80 cm from your mouth. A close USB microphone is 5 to 15 cm away. Going from about 10 cm to about 70 cm costs something like 15 to 17 dB of voice level against room noise and echo. That figure is my estimate from distance alone, not a measurement.

- **Calls:** any of the beamforming cameras above will be fine in a quiet room.
- **Dictation in a quiet room:** FluidVoice will cope with plain prose. Expect noticeably more errors on quiet speech, names and technical terms, and whenever anything else is making noise. The cameras' noise suppression can also clip soft syllables, so for dictation use Focus or Original mode on the Insta360, or a directional mode on the OBSBOT.
- **Against a close mic:** a close USB microphone will still be clearly better for dictation. The practical course is to start with the camera and add the microphone researched earlier only if FluidVoice's error rate grates.

## In Progress

Nothing is running.

### Outstanding - no action requested now

- None of the makers lists macOS 27 support yet. Plain video and audio rely on macOS's built-in UVC/UAC support, so only the optional apps carry any risk.
- Prices and stock change daily, particularly the Tiny 3, which had only 1 left, the MX Brio with only 2, and the Meet 2, whose stock line was unclear. Recheck the page before buying.

## Queries

### DESK-CAM - which webcam to buy for sol

**Context:** Kris wants one webcam with good built-in microphones for calls first and dictation second, using sol's own speaker. The best fit is the Insta360 Link 2C Pro at £199.00 (B0G3SSQMJQ): 1/1.3-inch sensor, two beamforming mics with a Focus mode, built-in shutter, plain UVC/UAC, and an optional app available as a Homebrew cask. The cheaper alternative with the strongest mic hardware is the OBSBOT Tiny 3 Lite at £169.00 (B0G63LXK6R). The UGREEN FineCam Pro at £57.78 (B0FX5QMB6K) is the budget option, with little audio evidence. All prices were seen on the product pages on 15 Oct 2026. Buying is Kris's decision.

**Query:** Which webcam does Kris want for sol?

**Options:**

a) (recommended) Insta360 Link 2C Pro, £199.00, amazon.co.uk/dp/B0G3SSQMJQ; add the `insta360-link-controller` Homebrew cask to sol's Rig configuration once it arrives

b) OBSBOT Tiny 3 Lite, £169.00, amazon.co.uk/dp/B0G63LXK6R; OBSBOT Center installed by hand

c) OBSBOT Tiny 3, £296.00, amazon.co.uk/dp/B0G636CXQM, for the best-reviewed webcam mics and the largest sensor

d) UGREEN FineCam Pro, £57.78, amazon.co.uk/dp/B0FX5QMB6K, the budget option with no app

```text
DESK-CAM

Kris buys the Insta360 Link 2C Pro (amazon.co.uk/dp/B0G3SSQMJQ, £199.00 on 15 Oct 2026); once it arrives, add the insta360-link-controller Homebrew cask to sol's Rig configuration and set its mic to Focus mode for calls and dictation.
```

```text
╭─ run report · 2026-10-15T21:50:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · research only           │
│  █  █ █▄▄▄ ▄▄▄█   █    · 1 query                 │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] webcam-compare finished; nothing running from this run
- [waiting] DESK-CAM
- [uncommitted] webcam-compare.report.md in the thread folder and the run state folder

```text
Resume Rig: mac-studio-setup under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
