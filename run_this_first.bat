@echo off
setlocal EnableExtensions
title Setup - YouTube to MP3 Downloader

echo ==========================================
echo  One-time setup: installing required tools
echo ==========================================
echo.

where winget >nul 2>&1
if errorlevel 1 goto :no_winget

echo Installing yt-dlp, ffmpeg and Deno. Please wait...
echo.
winget install -e --id yt-dlp.yt-dlp --accept-source-agreements --accept-package-agreements

echo.
echo ==========================================
echo  Setup finished.
echo ==========================================
echo.
echo IMPORTANT: Close this window, then run download_playlist.bat.
echo If it says yt-dlp or ffmpeg is not found, restart your PC once.
echo.
echo If you saw a download or timeout error above, just run this
echo file again in a few minutes.
echo.
pause
exit /b 0

:no_winget
echo.
echo ERROR: winget was not found on this PC.
echo Install "App Installer" from the Microsoft Store, then run
echo this file again.
pause
exit /b 1