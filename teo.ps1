if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Write-Output("Installation de Chocolatey...")
# Run your code that needs to be elevated here...
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

choco feature enable -n=allowGlobalConfirmation

Write-Output("Telechargement de LoL...")
Invoke-WebRequest -Uri "https://lol.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.euw.exe" -OutFile "$HOME\Downloads\lol_install_euw.exe"

Write-Output("Installation de LoL...")
Start-Process -Filepath "$HOME\Downloads\lol_install_euw.exe"

Write-Output("Installation des drivers NVIDIA")
choco install nvidia-display-driver --params "'/DCH'"

Write-Output("Installation du reste avec Chocolatey...")
choco install thunderbird discord spotify googlechrome steam bitwarden termius 7zip.install vlc vscode gimp winscp dropbox eartrumpet icue mattermost-desktop gitkraken microsoft-windows-terminal greenshot telegram.install signal choco install amd-ryzen-chipset

Write-Output("Coup de karscher sur le PC...")
iwr -useb https://raw.githubusercontent.com/Sycnex/Windows10Debloater/master/Windows10Debloater.ps1|iex