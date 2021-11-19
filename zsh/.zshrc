DISABLE_MAGIC_FUNCTIONS=true
ZSH_THEME="avit"
ZSH_DISABLE_COMPFIX="true"
ZSH_CUSTOM=$HOME/.config/zsh/custom
EDITOR=nvim

plugins=(
	git 
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
