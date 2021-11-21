DISABLE_MAGIC_FUNCTIONS=true
ZSH_THEME="avit"
ZSH_DISABLE_COMPFIX="true"
ZSH_CUSTOM=$HOME/.config/zsh/custom
EDITOR=nvim
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
KEYTIMEOUT=1

plugins=(
    ag
    docker  
    docker-compose
    frontend-search
    git 
    vi-mode
)

source $ZSH/oh-my-zsh.sh

source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# shortcut to accept zsh autosuggest
bindkey "^ " autosuggest-accept

# User configuration

# intialize zoxide
eval "$(zoxide init zsh --cmd j)"

# initialize fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
