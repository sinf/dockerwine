
#winetricks steam
wine reg.exe ADD "HKEY_CURRENT_USER\Software\Wine\AppDefaults\Steam.exe" /v "Version" /t "REG_SZ" /d "winxp64" /f
wine reg.exe ADD "HKEY_CURRENT_USER\Software\Wine\AppDefaults\steamwebhelper.exe" /v "Version" /t "REG_SZ" /d "winxp64" /f 

wine reg.exe DELETE "HKEY_CURRENT_USER\Software\Wine\AppDefaults\Steam.exe" /v "Version"  /f
wine reg.exe DELETE "HKEY_CURRENT_USER\Software\Wine\AppDefaults\steamwebhelper.exe" /v "Version" /f

