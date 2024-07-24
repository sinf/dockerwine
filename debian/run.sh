#!/usr/bin/env sh

IMAGE_NAME="localhost/dockerwine"
HOME_VOLUME="wine_volume"
COMMAND_LINE="/bin/bash"

#chmod u+rwx "$HOME/.local/share/containers/storage/volumes/$HOME_VOLUME/_data"

LOCAL_UID=$(id -u)

xhost +local:

podman volume create -d local --ignore wine_volume

podman run \
    --mount type=volume,source="$HOME_VOLUME",target="/home/wine" \
    --network host \
    --volume /etc/localtime:/etc/localtime:ro \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --volume "$HOME/virtualbox-share:/share" \
    --volume /run/user/$LOCAL_UID/bus:/run/user/$LOCAL_UID/bus \
    --volume /run/user/$LOCAL_UID/pipewire-0:/run/user/$LOCAL_UID/pipewire-0 \
    --volume /run/user/$LOCAL_UID/pulse:/run/user/$LOCAL_UID/pulse \
    --volume /run/user/$LOCAL_UID/wayland-0:/run/user/$LOCAL_UID/wayland-0 \
    --volume ./setup:/setup \
    --volume /dev/dri:/dev/dri \
    --env WINEPREFIX=/home/wine \
    --env WINEDEBUG=fixme-all \
    --env DXVK_LOG_LEVEL=warn \
    --env XDG_RUNTIME_DIR=/run/user/$LOCAL_UID \
    --env DISPLAY="$DISPLAY" \
    --env WAYLAND_DISPLAY="$WAYLAND_DISPLAY" \
    --env PULSE_SERVER=/run/user/$LOCAL_UID/pulse/native \
    --security-opt label=type:container_runtime_t \
    --rm \
    --hostname dockerwine \
    --volume="$HOME/.Xauthority:/root/.Xauthority:ro" \
    -ti \
    "$IMAGE_NAME" \
    $COMMAND_LINE

#   --user nobody:nobody \

#wine steam.exe -no-cef-sandbox -no-browser steam://minigameslist 

#   --env DXVK_LOG_LEVEL=warn \
