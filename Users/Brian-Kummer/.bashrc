# Brian Kummer

#------------------------------------------------------------------------------
# Personal Stuff
#------------------------------------------------------------------------------
alias backup-config="/c/Users/Brian-Kummer/bin/personal/git-backup-config.sh"

# Because I'm always trying to clear the screen with cls, like I can in CMD
alias cls="clear"

alias ..="cd .."
alias c="clear"
alias l="ls -la"
alias h="history"
alias hs="history | grep"
alias k="kubectl"
alias npp="\"/c/Program Files/Notepad++/notepad++.exe\""
alias typora="\"/c/Program Files/Typora/Typora.exe\""


# Open a folder in Windows Explorer
#   e         Opens the current folder
#   e .       Opens the current folder
#   e Tools   Opens the subfolder Tools
e()
{
	new_path=$(echo "$PWD\\$1" | sed -e 's/^\///' -e 's/\//\\/g' -e 's/^./\0:/')
	echo Opening $new_path...
	explorer.exe $new_path
}

# Aliases to build cloud and gateway solutions
alias build-cloud="powershell.exe -file /c/dev/git/cloud-tools/PowershellScripts/migration.ps1"
alias build-gateway="nant -buildfile:Cloud_SP.build 'gateway_build'"
alias build-gw="nant -buildfile:Cloud_SP.build 'gateway_build'"

# Aliases to switch between TeleTracking and personal accounts
# Since my personal SSH key has a passphrase, only add it when 
# I switch to my personal Git
alias git-tele="cd /c/dev/git/cloud-platform"
alias git-personal="cd /c/users/brian-kummer/personal/code/git/autohotkey && ssh-add ~/.ssh/id_rsa_personal"

# Export all modified/added files into a zip file. Note unix pathname!
# SHOULD NOT need this often- should be able to commit and push changes to BitBucket (no pull request to merge into dev!)
# and have someone else 'git merge MY-FEATURE-BRANCH-NAME' to merge my changes into their branch
# https://ranxing.wordpress.com/2016/12/13/add-zip-into-git-bash-on-windows/
# git-export /c/temp/brian.zip
alias git-export="git ls-files --modified --others --exclude-standard | xargs zip "

# Ping all local cloud services, telling chrome to allow insecure content. I
# had issues calling this directly from bash, so I created a batch file to do 
# the dirty work.
alias ping-local-services="/c/Users/Brian-Kummer/bin/tele/ping-local-services.bat"

# Stop and start heartbeat services
alias start-heartbeat="/c/Users/Brian-Kummer/bin/tele/start-heartbeat.bat"
alias stop-heartbeat="/c/Users/Brian-Kummer/bin/tele/stop-heartbeat.bat"
alias start-hb="/c/Users/Brian-Kummer/bin/tele/start-heartbeat.bat"
alias stop-hb="/c/Users/Brian-Kummer/bin/tele/stop-heartbeat.bat"

# Be able to run grunt build from any folder
alias grunt-build="/c/Users/Brian-Kummer/bin/tele/grunt-build.bat"

# Recycle Rabbit service when my local services hang
alias rabbit-recycle="NET STOP RabbitMQ; NET START RabbitMQ"
alias recycle-rabbit="NET STOP RabbitMQ; NET START RabbitMQ"

# Kill ChromeDriver, Chrome, and Visual Studio for automation testing
alias kill-chromedriver="taskkill //F //IM chromedriver.exe"
alias kill-chrome="taskkill //F //IM chrome.exe"
alias kill-vs="taskkill //F //IM devenv.exe"

# Local/fake ADFS
alias local-adfs-on="/c/Users/Brian-Kummer/bin/tele/local-adfs-on.bat"
alias local-adfs-off="/c/Users/Brian-Kummer/bin/tele/local-adfs-off.bat"


#------------------------------------------------------------------------------
# Work Stuff
#------------------------------------------------------------------------------
alias az="az.cmd"
alias terraform="terraform.exe" 
 
# Start SSH agent 
env=~/.ssh/agent.env
agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }
agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }
agent_load_env
# agent_run_state: 0=agent running w/key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi
unset env

ssh-add ~/.ssh/id_rsa_teletracking_bitbucket