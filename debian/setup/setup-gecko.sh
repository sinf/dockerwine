

d=$(mktemp -d)
cd "$d"

export WINEPREFIX=/home/wine
curl -LO http://dl.winehq.org/wine/wine-gecko/${WINE_GECKO_VERSION}/wine_gecko-${WINE_GECKO_VERSION}-x86.msi
curl -LO http://dl.winehq.org/wine/wine-gecko/${WINE_GECKO_VERSION}/wine_gecko-${WINE_GECKO_VERSION}-x86_64.msi

wineboot
wineserver -w
cd /
rm -rf "$d"

