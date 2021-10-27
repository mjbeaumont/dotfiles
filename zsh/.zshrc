# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin/:/usr/local/bin:$HOME/Library/Python/2.7/bin:$PATH
export NVM_DIR="$HOME/.nvm"
export TZ=UTC
export FZF_CTRL_T_COMMAND='ag -l --nocolor --hidden  -g ""'
export FZF_DEFAULT_COMMAND='ag -l --nocolor --hidden  -g ""'
. "/usr/local/opt/nvm/nvm.sh"

#Path to your oh-my-zsh installation.
export ZSH="/Users/matthewbeaumont/.oh-my-zsh"

DISABLE_MAGIC_FUNCTIONS=true

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="avit"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

ZSH_DISABLE_COMPFIX="true"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
        zsh-autosuggestions
	git 
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

EDITOR=nvim

# intialize zoxide
eval "$(zoxide init zsh --cmd j)"
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

kill_port() {
  lsof -ti tcp:$1 | xargs kill -9
}

gcfz() {
 git checkout $(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf)
}

gdfz() {
 git branch -D $(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf)
}


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim=nvim
alias l=ls -la
alias apifix="sed -i '' 's/\.95/\.65/g' src/lib/product-combination.js; sed -i '' 's/1\.05/1\.25/g' src/lib/product-combination.js;"
alias apiunfix="sed -i '' 's/\.65/\.95/g' src/lib/product-combination.js; sed -i '' 's/1\.25/1\.05/g' src/lib/product-combination.js"
alias reload_db="~/reload_db.sh"
alias test_stripe_webhooks="~/test_stripe_webhooks.sh"
alias restart_nodemon="lsof -it tcp:9229 | xargs kill -9"
alias vimc="nvim ~/.config/nvim/init.vim"
alias bsrestart="brew services restart"
alias bsstart="brew services start"
alias bsstop="brew services stop"
alias gafz="git ls-files -m -o --exclude-standard | fzf --print0 -m | xargs -0 -t -o git add"
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"
alias tx="tmuxinator"

bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
bindkey -s ^f "tmux-sessionizer\n"

bindkey "^ " autosuggest-accept

autoload -U edit-command-line
zle -N edit-command-line
bindkey '\033' edit-command-line

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
