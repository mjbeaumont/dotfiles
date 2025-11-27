# History size (oh-my-zsh sets options, but not sizes)
HISTSIZE=50000
SAVEHIST=50000

# Completion improvements
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # case-insensitive
zstyle ':completion:*' menu select                          # arrow key menu
