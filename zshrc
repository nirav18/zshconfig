# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
plugins=(git virtualenv)

source $ZSH/oh-my-zsh.sh

git_prompt_info(){
    branch_prompt=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
    if [ -n "$branch_prompt"]; then
        status_icon=$(git_status)
        echo $branch_prompt>$status_icon
    fi
}
git_status() {
    if current_git_status=$(git status | grep 'added to commit' 2> /dev/null ); then
        echo ">"
    fi
}

precmd() {
    precmd() {
        echo
    }
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo `basename $VIRTUAL_ENV`•
}

function pwds {
    trun_pwd=$(pwd | sed -E -e "s|^$HOME|~|" -e 's|^([^/]*/[^/]*/).*(/[^/]*)|\1.. \2|')
    echo $trun_pwd
}

autoload -U colors
colors
setopt prompt_subst

PROMPT='%{$fg[yellow]%}$(virtualenv_info)%{$reset_color%}'
PROMPT+='%{$fg[white]%}%1~%F{yellow}☛ '

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
# setopt prompt_subset
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' 🔥'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats 'on (%F{green}%b| %u %c)'
# zstyle ':vcs_info:git:*' formats 'on %F{green}%b'

alias start_env='source ~/.config/prod_env/bin/activate'
source ~/.config/zsh_custom/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh_custom/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
unset FZF_DEFAULT_COMMAND
unset FZF_CTRL_T_COMMAND
unset FZF_CTRL_C_COMMAND
# set &t_ut=''
#
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
