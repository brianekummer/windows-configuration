REM *********************************************************
REM *  This batch file installs Chocolatey and most of the 
REM *  software I use on a weekly basis
REM *
REM *  This *MUST* be run as an administrator
REM *
REM *  Sometimes I've seen some of these packages fail, and
REM *  rerunning that install works
REM *********************************************************

REM ***** Install Chocolatey *****
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

REM ***** TeleTracking *****
choco install chocolateygui -y
choco install visualstudio2017enterprise -y
choco install microsoft-office-deployment -y --params="'/64bit'"
choco install git -y
choco install git-credential-manager-for-windows -y
choco install 7zip.install -y
choco install agentransack -y
choco install winmerge -y
choco install robo3t.install -y
choco install firefox -y
choco install googlechrome -y
choco install linqpad -y
choco install postman -y
choco install slack -y
choco install sql-server-management-studio -y
choco install sql-server-2017 -y
choco install sysinternals -y
choco install paint.net -y
choco install treesizefree -y

REM ***** VS Code and some extensions *****
choco install vscode -y
"C:\Program Files\Microsoft VS Code\code.exe" --install-extension slevesque.vscode-autohotkey
"C:\Program Files\Microsoft VS Code\code.exe" --install-extension mauve.terraform
"C:\Program Files\Microsoft VS Code\code.exe" --install-extension sunjw.jstool 
"C:\Program Files\Microsoft VS Code\code.exe" --install-extension dotjoshjohnson.xml
"C:\Program Files\Microsoft VS Code\code.exe" --install-extension ms-mssql.mssql
REM ***** EVALUATING THESE EXTENSIONS
REM esbenp.prettier-vscode OR hookyqr.beautify
REM coenraads.bracket-pair-colorizer OR 2gua.rainbow-brackets
REM shan.code-settings-sync
REM gruntfuggly.todo-tree
REM rogalmic.bash-debug
REM foxundermoon.shell-format OR shakram02.bash-beautify
REM mikestead.dotenv
REM ryu1kn.text-marker
REM formulahendry.auto-close-tag
REM One Dark Pro: zhuangtongfa.material-theme 

REM ***** Cloud tools *****
choco install terraform --version 0.11.7 -y
choco install azure-cli -y
choco install awscli -y

REM ***** Microservices *****
choco install docker-desktop -y
choco install eclipse -y
choco install maven -y
choco install mongodb -y
choco install openssl.light -y
choco install make

REM ***** Personal *****
choco install conemu -y
choco install typora -y
choco install autohotkey -y
choco install nextcloud-client -y
choco install vlc -y 
choco install gpmdp -y
choco install stardock-fences -y
choco install keepass -y
choco install keepass-plugin-keetheme -y
choco install keepass-plugin-webautotype -y
choco install filezilla -y
choco install putty -y
choco install sdformatter -y
choco install win32diskimager -y
choco install partitionwizard -y

REM ***** Personal- Doesn't Exist *****
REM Zeta Resource Editor

REM ***** Trying to Avoid This *****
REM choco install notepadplusplus.install -y
