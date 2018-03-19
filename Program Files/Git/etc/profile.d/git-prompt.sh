#C:\Program Files\Git\etc\profile.d\git-prompt.sh
if test -f ~/.config/git/git-prompt.sh
then
	. ~/.config/git/git-prompt.sh
else
  export PROMPT_COMMAND=set_title_and_prompt
fi


set_title_and_prompt() {
  #----------------------------------------------------------------------------#
  # Bash text color specification:  \e[<STYLE>;<COLOR>m
	#    Notes: \e = \033 (oct) = \x1b (hex) = 27 (dec) = "Escape"
	#           It is generally recommended to wrap color commands in \[ and \]
  #   Styles: 0=normal, 1=bold, 2=dimmed, 4=underlined, 7=highlighted
  #   Colors: 31=red, 32=green, 33=yellow, 34=blue, 35=purple, 36=cyan, 37=white
  #----------------------------------------------------------------------------#
	COLOR_CLEAR="\[\e[0;0m\]"
	COLOR_RED="\[\e[0;31m\]"
	COLOR_GREEN="\[\e[0;32m\]"
	COLOR_YELLOW="\[\e[0;33m\]"
	COLOR_BLUE="\[\e[0;34m\]"
	COLOR_MAGENTA="\[\e[0;35m\]"
	COLOR_CYAN="\[\e[0;36m\]"
	COLOR_WHITE="\[\e[0;37m\]"

	branch="$(git rev-parse --abbrev-ref HEAD)"
	
 	title="Git Bash - $PWD"
	cmd_prompt="$COLOR_YELLOW$PWD"
	if [ "$branch" ]; then
	  # Add branch name to window title and command prompt
  	title="$title - $branch"
		cmd_prompt="$cmd_prompt $COLOR_CYAN($branch)"
	fi
	cmd_prompt="$cmd_prompt\n$COLOR_WHITE$ "

	PS1="\[\e]0;$title\007\]\n$cmd_prompt"
}