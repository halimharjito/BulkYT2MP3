# BulkYT2MP3 (Windows)

Simple .bat scripts that download YouTube playlists or single videos
as MP3 files with cover art and metadata, using yt-dlp and ffmpeg.

## Features
- Playlist mode: one folder per playlist, album and track number tags
- Single video mode: saved to a separate folder
- Highest MP3 quality (VBR 0), embedded cover art, title/artist metadata
- Skips already downloaded playlist items on re-runs

## Setup (one time)
1. Download this repository (green **Code** button, then **Download ZIP**)
   and extract it.
2. Double-click `run_this_first.bat`. It installs yt-dlp, ffmpeg and Deno
   using winget (built into Windows 10/11).
3. Close the window.

Manual alternative: open Command Prompt and run

    winget install yt-dlp.yt-dlp

## Usage
1. Double-click `download_playlist.bat`.
2. Press **P** for a playlist or **S** for a single video.
3. Paste the URL and press Enter.

Output locations:
- Playlists: `Music\YouTube Playlists\<playlist name>\`
- Singles: `Music\YouTube Singles\`

## Troubleshooting
- "yt-dlp not found": close all CMD windows and reopen, or restart the PC.
- Download or HTTP 403 errors: run `yt-dlp -U` or `winget upgrade yt-dlp.yt-dlp`.
- Install timeout (504): GitHub was busy, run `run_this_first.bat` again.

## Disclaimer
For personal use only. Download only content you own or have permission
to download, and respect YouTube's Terms of Service and copyright law.
This project is not affiliated with YouTube, yt-dlp, or FFmpeg.

## License
MIT
