REM **************************************************************************
REM *  This batch file installs Chocolatey and most of the software I 
REM *  routinely use
REM *
REM *  This *MUST* be run as an administrator
REM *
REM *  Sometimes I've seen some of these packages fail, and rerunning that 
REM *  install works
REM **************************************************************************

REM ***** Install Chocolatey *****
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

REM ***** TeleTracking Software *****
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
choco install citrix-workspace -y

REM ***** IQ Platform *****
REM Our developer script may install several of these
REM choco install visualstudio2017enterprise -y
REM choco install visualstudio2017buildtools -y
choco install sql-server-management-studio -y
choco install sql-server-2017 -y
choco install nant -y

REM ***** VS Code and Extensions *****
choco install vscode -y
"C:\Program Files\Microsoft VS Code\code.exe" --install-extension slevesque.vscode-autohotkey
"C:\Program Files\Microsoft VS Code\code.exe" --install-extension mauve.terraform
"C:\Program Files\Microsoft VS Code\code.exe" --install-extension sunjw.jstool 
"C:\Program Files\Microsoft VS Code\code.exe" --install-extension dotjoshjohnson.xml
"C:\Program Files\Microsoft VS Code\code.exe" --install-extension ms-mssql.mssql
"C:\Program Files\Microsoft VS Code\code.exe" --install-extension ms-azuretools.vscode-docker
REM ***** STILL EVALUATING THESE EXTENSIONS
REM coenraads.bracket-pair-colorizer OR 2gua.rainbow-brackets
REM shan.code-settings-sync
REM gruntfuggly.todo-tree
REM rogalmic.bash-debug
REM foxundermoon.shell-format OR shakram02.bash-beautify
REM mikestead.dotenv
REM ryu1kn.text-marker
REM formulahendry.auto-close-tag

REM ***** Cloud Tools *****
choco install terraform --version 0.11.7 -y
choco install azure-cli -y
choco install awscli -y

REM ***** Microservices *****
REM There are comments in #pittsburgh-accessteam Slack channel on 7/9/2019 if have problems w/Java
REM I use ConEmu instead of Cmder because Cmder doesn't let me change the window title, which I use for AHK. And Cmder uses ConEmu, so not big loss to me.
choco install curl -y
choco install docker-desktop -y
choco install openjdk -y
choco install intellijidea-community -y
choco install maven -y
choco install openssl.light -y
choco install make -y
choco install conemu -y
choco install python -y
choco install robo3t.install -y


REM ***** Old Stuff *****
REM choco install eclipse -y


REM ***** Personal *****
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


REM ***** I'm Trying to Avoid This *****
REM choco install notepadplusplus.install -y




REM **************************************************************************
REM *  Manually Installed Items
REM *
REM *  These have no automated process available. Each of these should be
REM *  followed by a @PAUSE.
REM **************************************************************************

REM ***** Fonts *****
START chrome.exe "https://input.fontbureau.com/download/""
@PAUSE
START chrome.exe "https://github.com/microsoft/cascadia-code/releases"
@PAUSE

REM ***** Applications *****
START chrome.exe "https://www.zeta-resource-editor.com/index.html"
@PAUSE
START chrome.exe "https://www.nec-display.com/dl/en/soft/multipresenter/select_country_win_e.html"
@PAUSE
START chrome.exe "https://www.mongodb.com/download-center/compass" @REM Download Community Edition
@PAUSE

REM ***** Chrome Extensions *****
CALL :AddChromeExtension "ffmdedmghpoipeldijkdlcckdpempkdi", "bookmarks-menu"
@PAUSE
CALL :AddChromeExtension "jlhmfgmfgeifomenelglieieghnjghma", "cisco-webex-extension"
@PAUSE
CALL :AddChromeExtension "eimadpbcbfnmbkopoojfekhnkhdbieeh", "dark-reader"
@PAUSE
CALL :AddChromeExtension "bfogiafebfohielmmehodmfbbebbbpei", "keeper-password-manager"
@PAUSE
CALL :AddChromeExtension "cjpalhdlnbpafiamejdnhcphjbkeiagm", "ublock-origin"
@PAUSE
CALL :AddChromeExtension "nenlahapcbofgnanklpelkaejcehkggg", "wikibuy-from-capital-one"
@PAUSE
CALL :AddChromeExtension "cppjkneekbjaeellbfkmgnhonkkjfpdn", "clear-cache"
@PAUSE
CALL :AddChromeExtension "kkelicaakdanhinjdeammmilcgefonfh", "window-resizer"
@PAUSE

REM ***** Windows Store Apps *****
CALL :OpenWindowsStore "9WZDNCRFJ223", "iHeartRadio"
@PAUSE
CALL :OpenWindowsStore "9WZDNCRDFS44", "White Noise"
@PAUSE
CALL :OpenWindowsStore "9WZDNCRDRK77", "gTasks HD Pro"
@PAUSE
CALL :OpenWindowsStore "9NBLGGH5KRJX", "JOIN by joaoapps"
@PAUSE


REM **************************************************************************
REM *  All done
REM **************************************************************************
EXIT /b 0



REM **************************************************************************
REM *  Install a Chrome Extension
REM *
REM *  If a user uninstalls an extension added through the registry, the 
REM *  extension will be blacklisted, and automated installs will fail to
REM *  re-add it. "However, if you (the developer) accidentally uninstalled 
REM *  your extension through the UI, you can remove the blocklist tag by
REM *  installing the extension normally through the UI, and then uninstalling
REM *  it."
REM **************************************************************************
:AddChromeExtension
REM Code to add extension using the registry:
REM    reg add "HKLM\Software\Wow6432Node\Google"
REM    reg add "HKLM\Software\Wow6432Node\Google\Chrome"
REM    reg add "HKLM\Software\Wow6432Node\Google\Chrome\Extensions"
REM    reg add "HKLM\Software\Wow6432Node\Google\Chrome\Extensions\%~1" /v update_url /d "https://clients2.google.com/service/update2/crx" /f
REM 
REM Code to add extension by opening Chrome to the store page for the add in
REM so I can manually add the extension:
START chrome.exe "https://chrome.google.com/webstore/detail/%~1/%~2?hl=en"
EXIT /b 0


REM **************************************************************************
REM *  Open the Windows Store to a Specific App
REM *
REM *  Parameter #2 isn't used, and is only for documentation purposes
REM **************************************************************************
:OpenWindowsStore
START "" ms-windows-store://pdp/?ProductId=%~1
EXIT /b 0