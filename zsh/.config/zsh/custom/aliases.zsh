# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias apifix="sed -i '' 's/\.95/\.65/g' src/lib/product-combination.js; sed -i '' 's/1\.05/1\.25/g' src/lib/product-combination.js;"
alias apiunfix="sed -i '' 's/\.65/\.95/g' src/lib/product-combination.js; sed -i '' 's/1\.25/1\.05/g' src/lib/product-combination.js"
alias bsrestart="brew services restart"
alias bsstart="brew services start"
alias bsstop="brew services stop"
alias gafz="git ls-files -m -o --exclude-standard | fzf --print0 -m | xargs -0 -t -o git add"
alias l=ls -la
alias reload_db="~/reload_db.sh"
alias restart_nodemon="lsof -it tcp:9229 | xargs kill -9"
alias rz=". ~/.zshrc"
alias t="tmux"
alias ta="t a -t"
alias test_stripe_webhooks="~/test_stripe_webhooks.sh"
alias tls="t ls"
alias tn="t new -t"
alias tx="tmuxinator"
alias vim=nvim
alias vimc="nvim ~/.config/nvim/init.vim"
alias vimgolf="docker run --rm -it -e "key=YOUR_VIMGOLF_KEY" hettomei/vimgolf"
alias ry="yabaictl update-spaces && yabai --restart-service"
alias chromedebug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 --user-data-dir=/tmp/chrome-debug"
alias rmnm="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"
