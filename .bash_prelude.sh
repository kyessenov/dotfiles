# Git prompt
. ~/Documents/dotfiles/scripts/git-completion.bash
. ~/Documents/dotfiles/scripts/git-prompt.sh

# Prompt
red=$(tput setaf 1)
green=$(tput setaf 2)
reset=$(tput sgr0)
bold=$(tput bold)
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1=$bold'\h:'$reset$green'`echo "${PWD%/*}" | sed -e "s;\(/.\)[^/]*;\1;g"`/${PWD##*/}'$reset'$(__git_ps1 ":%s") '$reset


