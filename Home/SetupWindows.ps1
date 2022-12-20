# Install software:

$SoftwareIDs = 'Microsoft.VisualStudioCode','Discord.Discord','Plex.Plexamp','Google.Chrome','Mozilla.Firefox','JanDeDobbeleer.OhMyPosh','Microsoft.PowerShell','Microsoft.WindowsTerminal''GitHub.cli','EpicGames.EpicGamesLauncher','VideoLAN.VLC','ParadoxInteractive.ParadoxLauncher','Sonos.Controller','7zip.7zip','Microsoft.PowerToys','Microsoft.AzureCLI','GOG.Galaxy','ElectronicArts.EADesktop','Plex.PlexMediaPlayer','HandBrake.HandBrake','Obsidian.Obsidian','PrivateInternetAccess.PrivateInternetAccess','Starship.Starship','Ubisoft.Connect','GuinpinSoft.MakeMKV','MKVToolNix.MKVToolNix','Notion.Notion','Balena.Etcher','Foundry376.Mailspring','GitHub.GitHubDesktop','XSplit.VCam','ScummVM.ScummVM','Mp3tag.Mp3tag','Git.Git','Docker.DockerDesktop','Piriform.Speccy','Valve.Steam','LogMeIn.LastPass','Automattic.Simplenote'

foreach ($SoftwareID in $SoftwareIDs) {
    winget install -e --id $SoftwareID --Silent
}

# Install WSL
wsl --install -d Ubuntu


# Beamdog Client http://client.beamdog.com/files/BeamdogClientSetup2.1.11-ia32.exe
# Synergy https://api2.prod.symless.com/aws-downloads/synergy/v1-core-standard/1.14.6-snapshot.88fdd263/synergy_1.14.6-snapshot.88fdd263_windows_x64.msi
# Tuneskit https://www.viwizard.com/download/AudioConverter.exe
# Battle.Net :(

# Install Chockolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-WebRequest -Uri https://community.chocolatey.org/install.ps1 -UseBasicParsing |
    Invoke-Expression

# Install Python
choco install python