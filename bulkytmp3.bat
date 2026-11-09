@echo off
setlocal EnableExtensions
chcp 65001 >nul
title YouTube to MP3 Downloader

:: ---------- Settings ----------
set "BASE_DIR=%USERPROFILE%\Music\YouTube Playlists"
set "SINGLES_DIR=%USERPROFILE%\Music\YouTube Singles"

:: Options shared by both modes
set "COMMON=--ignore-errors --format bestaudio/best --extract-audio --audio-format mp3 --audio-quality 0 --embed-thumbnail --convert-thumbnails jpg --add-metadata --windows-filenames"

:: ---------- Check that the tools are installed ----------
where yt-dlp >nul 2>&1
if errorlevel 1 goto :missing_ytdlp
where ffmpeg >nul 2>&1
if errorlevel 1 goto :missing_ffmpeg

:: ---------- Choose mode ----------
echo.
choice /c PS /n /m "Download a [P]laylist or a [S]ingle video? (press P or S): "
if errorlevel 2 goto :single
goto :playlist

:: ---------- Playlist mode ----------
:playlist
echo.
set "URL="
set /p "URL=Paste the YouTube playlist URL and press Enter: "
if not defined URL goto :playlist
set "URL=%URL:"=%"
if not exist "%BASE_DIR%" mkdir "%BASE_DIR%"
echo.
echo Downloading playlist to: %BASE_DIR%
echo.
yt-dlp %COMMON% ^
 --yes-playlist ^
 --parse-metadata "playlist_title:%%(album)s" ^
 --parse-metadata "playlist_index:%%(track_number)s" ^
 -P "%BASE_DIR%" ^
 -o "%%(playlist_title)s/%%(title)s.%%(ext)s" ^
 "%URL%"
set "OPEN_DIR=%BASE_DIR%"
goto :done

:: ---------- Single video mode ----------
:single
echo.
set "URL="
set /p "URL=Paste the YouTube video URL and press Enter: "
if not defined URL goto :single
set "URL=%URL:"=%"
if not exist "%SINGLES_DIR%" mkdir "%SINGLES_DIR%"
echo.
echo Downloading video to: %SINGLES_DIR%
echo.
yt-dlp %COMMON% ^
 --no-playlist ^
 -P "%SINGLES_DIR%" ^
 -o "%%(title)s.%%(ext)s" ^
 "%URL%"
set "OPEN_DIR=%SINGLES_DIR%"
goto :done

:done
echo.
echo ================= Finished =================
echo Check the messages above for any videos that failed.
start "" "%OPEN_DIR%"
pause
exit /b 0

:missing_ytdlp
echo.
echo ERROR: yt-dlp was not found. Install it with:
echo   winget install yt-dlp.yt-dlp
pause
exit /b 1

:missing_ffmpeg
echo.
echo ERROR: ffmpeg was not found. Install it with:
echo   winget install Gyan.FFmpeg
pause
exit /b 1