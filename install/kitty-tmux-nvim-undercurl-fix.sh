#!/bin/bash

# Compiles a custom terminfo entry that adds undercurl and colored underline
# support (Smulx, Setulc) to tmux-256color. This fixes colored undercurl
# rendering in neovim when running inside tmux in Kitty.
#
# Prerequisites:
# - Kitty: set `term xterm-kitty` in kitty.conf
# - tmux: set terminal-overrides for Smulx/Setulc in tmux.conf

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TERMINFO_FILE="$SCRIPT_DIR/../tmux/tmux-256color.terminfo"

if [ -f "$TERMINFO_FILE" ]; then
    tic -x "$TERMINFO_FILE" && echo "Terminfo compiled successfully: undercurl support enabled"
else
    echo "Error: $TERMINFO_FILE not found"
    exit 1
fi
