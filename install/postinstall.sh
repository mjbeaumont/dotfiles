# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# create symlink to zsh
sudo ln -s /opt/homebrew/bin/zsh /usr/local/bin/zsh 

# install neovim dependencies via Packer
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# install git-split-diffs for better command-line diffs
npm install -g git-split-diffs

# install click (dependency for yabai)
pip3 install click

# install fzf keybindings
$(brew --prefix)/opt/fzf/install

# compile terminfo for undercurl support in kitty/tmux/nvim
"$(dirname "$0")/kitty-tmux-nvim-undercurl-fix.sh"

# enable focus follows mouse
defaults write com.apple.Terminal FocusFollowsMouse -bool true

