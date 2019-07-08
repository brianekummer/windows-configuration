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
choco install microsoft-office-deployment -y --params="'/64bit'"
choco install git -y
choco install git-credential-manager-for-windows -y
choco install 7zip.install -y
choco install agentransack -y
choco install winmerge -y
choco install firefox -y
choco install googlechrome -y
choco install linqpad -y
choco install postman -y
choco install slack -y
choco install sysinternals -y
choco install paint.net -y
choco install treesizefree -y

REM ***** IQ Platform. Developer script may do several of these *****
REM choco install visualstudio2017enterprise -y
REM choco install visualstudio2017buildtools -y
choco install sql-server-management-studio -y
choco install sql-server-2017 -y
choco install nant -y

REM ***** VS Code and some extensions *****
choco install vscode -y
"C:\Program Files\Microsoft VS Code\code.exe" --install-extension slevesque.vscode-autohotkey
"C:\Program Files\Microsoft VS Code\code.exe" --install-extension mauve.terraform
"C:\Program Files\Microsoft VS Code\code.exe" --install-extension sunjw.jstool 
"C:\Program Files\Microsoft VS Code\code.exe" --install-extension dotjoshjohnson.xml
"C:\Program Files\Microsoft VS Code\code.exe" --install-extension ms-mssql.mssql
REM ***** EVALUATING THESE EXTENSIONS
REM coenraads.bracket-pair-colorizer OR 2gua.rainbow-brackets
REM shan.code-settings-sync
REM gruntfuggly.todo-tree
REM rogalmic.bash-debug
REM foxundermoon.shell-format OR shakram02.bash-beautify
REM mikestead.dotenv
REM ryu1kn.text-marker
REM formulahendry.auto-close-tag

REM ***** Cloud tools *****
choco install terraform --version 0.11.7 -y
choco install azure-cli -y
choco install awscli -y

REM ***** Microservices *****
choco install docker-desktop -y
choco install jdk8 -y -params "source=false"
choco install eclipse -y
choco install maven -y
choco install openssl.light -y
choco install make -y
choco install mongodb -y
choco install robo3t.install -y

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

REM ***** These Apps Don't Yet Have Chocolatey Packages *****
REM Zeta Resource Editor

REM ***** I'm Trying to Avoid This *****
REM choco install notepadplusplus.install -y


REM ***** Add Chrome Extensions *****
REM Note: If user uninstalls an extension added through the registrym the extension
REM       will be blacklisted, and automated installs will fail to re-add it. "However,
REM       if you (the developer) accidentally uninstalled your extension through the 
REM       UI, you can remove the blocklist tag by installing the extension normally
REM       through the UI, and then uninstalling it."
reg add "HKLM\Software\Wow6432Node\Google"
reg add "HKLM\Software\Wow6432Node\Google\Chrome"
reg add "HKLM\Software\Wow6432Node\Google\Chrome\Extensions"
CALL :AddChromeExtension "ffmdedmghpoipeldijkdlcckdpempkdi", "Bookmarks Menu"
CALL :AddChromeExtension "jlhmfgmfgeifomenelglieieghnjghma", "Cisco Webex Extension"
CALL :AddChromeExtension "eimadpbcbfnmbkopoojfekhnkhdbieeh", "Dark Reader"
CALL :AddChromeExtension "bfogiafebfohielmmehodmfbbebbbpei", "Keeper Password Manager..."
CALL :AddChromeExtension "cjpalhdlnbpafiamejdnhcphjbkeiagm", "uBlock Origin"
CALL :AddChromeExtension "nenlahapcbofgnanklpelkaejcehkggg", "Wikibuy from Capital One"
CALL :AddChromeExtension "cppjkneekbjaeellbfkmgnhonkkjfpdn", "Clear Cache"
CALL :AddChromeExtension "kkelicaakdanhinjdeammmilcgefonfh", "Window Resizer"


REM ***** Add Windows Store Apps *****
REM These installs cannot be automated
CALL :OpenWindowsStore "9WZDNCRFJ223", "iHeartRadio"
@PAUSE
CALL :OpenWindowsStore "9WZDNCRDFS44", "White Noise"
@PAUSE
CALL :OpenWindowsStore "9WZDNCRDRK77", "gTasks HD Pro"
@PAUSE
CALL :OpenWindowsStore "9NBLGGH5KRJX", "JOIN by joaoapps"
@PAUSE


REM ***** All Done *****
EXIT /b 0


REM ***** Install a Chrome Extension *****
REM   - Parameter #2 isn't used, is for documentation purposes
:AddChromeExtension
reg add "HKLM\Software\Wow6432Node\Google\Chrome\Extensions\%~1" /v update_url /d "https://clients2.google.com/service/update2/crx" /f
EXIT /b 0


REM ***** Open the Windows Store to a Specific App *****
REM   - Parameter #2 isn't used, is for documentation purposes
:OpenWindowsStore
START "" ms-windows-store://pdp/?ProductId=%~1
EXIT /b 0