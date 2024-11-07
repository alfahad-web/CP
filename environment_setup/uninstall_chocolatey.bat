powershell -NoProfile -ExecutionPolicy Bypass -Command "choco uninstall chocolatey -y; Remove-Item -Recurse -Force $env:ChocolateyInstall"
pause
