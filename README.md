# Docker container for wine

Simple dockerfile and startup script for running graphical programs in wine in a container. I had to build my own so I know what it does. Documentation is the scripts.  

## Usage

```
cd debian
./build.sh
cp whatever_installer.exe setup/
sh run.sh
```

## Misc notes

Tried to build the container from alpine instead of debian but debian was easier since packages for all wine deps & libs are available (unlike alpine).  
Steam .deb was broken and failed to even start. Native windows version runs perfectly.  
Gecko/mono not included automatically in case you don't need them for a specific app.  

