#!/bin/sh

# TO DO - Define vars to clean this up
# MyUserFolder               = /C/Users/Brian-Kummer
# MyWindowsConfigRepo        = /c/users/brian-kummer/personal/code/git/windows-configuration
# MyTeleOneDriveBackupFolder = /c/users/brian-kummer/OneDrive - TeleTracking Technologies, Inc/Configuration Backups

#----------------------------------------------------------------------------------------
#- Backup sensitive personal config files to my C:\Users\Brian-Kummer\Personal\Configurations folder
#----------------------------------------------------------------------------------------
rm "C:\Users\Brian-Kummer\Personal\PortableApps\putty\putty.reg"
reg export "HKCU\Software\SimonTatham\PuTTY" "C:\Users\Brian-Kummer\Personal\Configurations\putty.reg"
cp "/C/Users/Brian-Kummer/AppData/Local/Nextcloud/nextcloud.cfg" "/C/Users/Brian-Kummer/Personal/Configurations"

#----------------------------------------------------------------------------------------
#- Backup personal config files to my GitHub account
#----------------------------------------------------------------------------------------
#cp "/c/Program Files/ConEmu/ConEmu/ConEmu.xml" "/C/Users/Brian-Kummer/Personal/Code/git/windows-configuration/Program Files/ConEmu/ConEmu/"
cp "/c/Program Files/Git/etc/profile.d/git-prompt.sh" "/c/users/brian-kummer/personal/code/git/windows-configuration/Program Files/Git/etc/profile.d/"
cp "/c/Users/Brian-Kummer/.bash_profile" "/c/users/brian-kummer/personal/code/git/windows-configuration/Users/Brian-Kummer/"
cp "/c/Users/Brian-Kummer/.bashrc" "/c/users/brian-kummer/personal/code/git/windows-configuration/Users/Brian-Kummer/"
cp "/c/Users/Brian-Kummer/.gitconfig" "/c/users/brian-kummer/personal/code/git/windows-configuration/Users/Brian-Kummer/"
cp "/c/Users/Brian-Kummer/.gitconfig-personal" "/c/users/brian-kummer/personal/code/git/windows-configuration/Users/Brian-Kummer/"
cp "/c/Users/Brian-Kummer/.gitconfig-teletracking" "/c/users/brian-kummer/personal/code/git/windows-configuration/Users/Brian-Kummer/"
cp "/c/Users/Brian-Kummer/bin/personal/"* "/c/users/brian-kummer/personal/code/git/windows-configuration/Users/Brian-Kummer/bin/personal/"
cp "/c/Users/Brian-Kummer/AppData/Roaming/Typora/themes\*.user.css" "/c/users/brian-kummer/personal/code/git/windows-configuration/Users/Brian-Kummer/AppData/Roaming/Typora/themes/"

# Commit any changes, and if there are any, then push to GitHub
cd /c/users/brian-kummer/personal/code/git/windows-configuration
DA=`date +"%F"`
git add .
if git commit -m "Backup $DA" ; then
  git push origin
fi


#----------------------------------------------------------------------------------------
# Backup TeleTracking-specific config files to OneDrive to be synced
#----------------------------------------------------------------------------------------
cp "/c/Users/Brian-Kummer/bin/tele/*" "/c/users/brian-kummer/OneDrive - TeleTracking Technologies, Inc/Configuration Backups/Users/Brian-Kummer/bin/tele"
cp "/c/dev/git/cloud-automation/TeleTracking.Access.Automation/App.config" "/C/Users/Brian-Kummer\OneDrive - TeleTracking Technologies, Inc/Configuration Backups/dev/git/cloud-automation/TeleTracking.Access.Automation/App.config"
cp "/C/dev/git/cloud-automation/TeleTracking.Core.Automation/KeywordFramework/Environments-Platform.xml" "/C/Users/Brian-Kummer/OneDrive - TeleTracking Technologies, Inc/Configuration Backups/dev/git/cloud-automation/TeleTracking.Core.Automation/KeywordFramework/Environments-Platform.xml"
cp "/C/dev/git/cloud-automation/TeleTracking.Core.Automation/KeywordFramework/PlatformUsers.xml" "/C/Users/Brian-Kummer/OneDrive - TeleTracking Technologies, Inc/Configuration Backups/dev/git/cloud-automation/TeleTracking.Core.Automation/KeywordFramework/PlatformUsers.xml"
cp "/C/dev/git/cloud-platform/Gateway/TeleTracking.Gateway.WebService/Web.config" "/C/Users/Brian-Kummer/OneDrive - TeleTracking Technologies, Inc/Configuration Backups/dev/git/cloud-platform/Gateway/TeleTracking.Gateway.WebService/Web.config"
cp "/C/dev/git/cloud-tools/PowershellScripts/migration.ps1" "/C/Users/Brian-Kummer/OneDrive - TeleTracking Technologies, Inc/Configuration Backups/dev/git/cloud-tools/PowershellScripts\migration.ps1"