# start a new tmux session in selected directory (uses FZF) 
bindkey -s ^f "tmux-sessionizer\n"

# command-line version of VIM command mode
bindkey -v

# edit the current command in VIM

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line

