# kill port provided as single command-line argument
kill_port() {
  lsof -ti tcp:$1 | xargs kill -9
}

# use FZF to checkout a local branche
gcfz() {
 git checkout $(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf)
}

# use FZF to delete a local branch
gdfz() {
 git branch -D $(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf)
} 

# get a formatted list of your most used commands
zsh-stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl | head -n25
}

# get the approximate startup time for your shell
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

termcolors() {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
    done
}

gf_code() {
   ag -l $1 | fzf | xargs nvim
}

gfh_code() {
   ag -u -l $1 | fzf | xargs nvim
}
