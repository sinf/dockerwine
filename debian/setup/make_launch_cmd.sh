set -e

# usage: make_launch_cmd.sh 'some steam title'
# creates setup/steam/program_name.sh

if ! grep -iq "\"$*\"" SteamCMD-AppID-List/steamcmd_appid.json
then
  echo "Not found"
  exit 1
fi

appid=$(grep "\"$*\"" -i -B1 SteamCMD-AppID-List/steamcmd_appid.json | sed -n 's/.*appid": \([0-9]\+\).*/\1/p')
mkdir -pv setup/steam
title=$(echo "$*" | tr 'A-Z' 'a-z' | tr -c '[:alnum:]\n' '_')
script="setup/steam/$title.sh"

echo "#/bin/sh" > "$script"
echo "sh /setup/launch_steam.sh -applaunch $appid" >> "$script"
chmod +x "$script"

echo "created file: $script"
cat "$script"
echo

