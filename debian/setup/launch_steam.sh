export WINEPREFIX=/home/wine
export DXVK_LOG_LEVEL=warn
export WINEDEBUG=fixme-all
cd "$WINEPREFIX/drive_c/Program Files (x86)/Steam"
setxkbmap us
wine steam.exe $@

