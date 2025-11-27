export PATH=/opt/homebrew/bin:$HOME/bin:/usr/local/bin:$PATH
export NVM_DIR="$HOME/.nvm"
export FZF_CTRL_T_COMMAND='ag -l --nocolor --hidden  -g ""'
export FZF_DEFAULT_COMMAND='ag -l --nocolor --hidden  -g ""'

# Lazy-load NVM for faster shell startup
# NVM is slow (~400ms), so we only load it when you actually use node/npm/npx/nvm
_load_nvm() {
    unset -f nvm node npm npx _load_nvm
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
}
nvm() { _load_nvm && nvm "$@"; }
node() { _load_nvm && node "$@"; }
npm() { _load_nvm && npm "$@"; }
npx() { _load_nvm && npx "$@"; }
export TZ=America/New_York
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'
