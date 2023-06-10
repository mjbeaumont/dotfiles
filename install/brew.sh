# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

# Install packages

apps=(
   ansible
   awscli
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
   sketchybar
   skhd
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
   yabai
   zoxide
   zsh
)

brew install "${apps[@]}"

# Git comes with diff-highlight, but isn't in the PATH
ln -sf "$(brew --prefix)/share/git-core/contrib/diff-highlight/diff-highlight" /usr/local/bin/diff-highlight
