# Install packages
taps=(
  FelixKratz/formulae
)

apps=(
   ansible
   awscli
   docker-compose
   fontconfig
   freetype
   fzf
   gh
   ghostscript
   gist
   git
   htop
   imagemagick
   jq
   lazydocker
   lazygit
   luajit
   neovim
   node
   nvm
   python
   ripgrep
   koekeishiya/formulae/skhd
   stow
   stylua
   the_silver_searcher
   tldr
   tmux
   tmuxinator
   tree
   tree-sitter
   webp
   wget
   koekeishiya/formulae/yabai
   zoxide
   zsh
   zsh-vi-mode
)

brew tap "${taps[@]}"
brew install "${apps[@]}"

# Git comes with diff-highlight, but isn't in the PATH
ln -sf "$(brew --prefix)/share/git-core/contrib/diff-highlight/diff-highlight" /usr/local/bin/diff-highlight
