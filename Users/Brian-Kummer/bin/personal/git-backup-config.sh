#!/bin/sh

# Copy files to local repo
cp "/c/Program Files/ConEmu/ConEmu/ConEmu.xml" "/c/users/brian-kummer/personal/code/git/windows-configuration/Program Files/ConEmu/ConEmu/"

cp "/c/Program Files/Git/etc/profile.d/git-prompt.sh" "/c/users/brian-kummer/personal/code/git/windows-configuration/Program Files/Git/etc/profile.d/"
cp "/c/Users/Brian-Kummer/.bashrc" "/c/users/brian-kummer/personal/code/git/windows-configuration/Users/Brian-Kummer/"
cp "/c/Users/Brian-Kummer/.gitconfig" "/c/users/brian-kummer/personal/code/git/windows-configuration/Users/Brian-Kummer/"
cp "/c/Users/Brian-Kummer/.gitconfig-personal" "/c/users/brian-kummer/personal/code/git/windows-configuration/Users/Brian-Kummer/"
cp "/c/Users/Brian-Kummer/.gitconfig-teletracking" "/c/users/brian-kummer/personal/code/git/windows-configuration/Users/Brian-Kummer/"
cp "/c/Users/Brian-Kummer/bin/git-export.sh" "/c/users/brian-kummer/personal/code/git/windows-configuration/Users/Brian-Kummer/bin/"
cp "/c/Users/Brian-Kummer/bin/git-backup-config.sh" "/c/users/brian-kummer/personal/code/git/windows-configuration/Users/Brian-Kummer/bin/"

cp "/c/Users/Brian-Kummer/AppData/Roaming/Typora/themes\pixyll.user.css" "/c/users/brian-kummer/personal/code/git/windows-configuration/Users/Brian-Kummer/AppData/Roaming/Typora/themes/"


# Commit any changes, and if there are any, then push to GitHub
cd /c/users/brian-kummer/personal/code/git/windows-configuration
DA=`date +"%F"`
git add .
if git commit -m "Backup $DA" ; then
  git push origin
fi