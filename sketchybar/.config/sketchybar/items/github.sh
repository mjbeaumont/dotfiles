#!/usr/bin/env sh

sketchybar --add       event              brew_upgrade                             \
           --add       event              git_push                                 \
                                                                                   \
           --add       item               github.prs right                      \
           --set       github.prs         associated_space=4                       \
                                          update_freq=1000                         \
                                          icon.color=0xaaffffff                    \
                                          icon.highlight_color=0xff9dd274          \
                                          icon.font="$FONT:Bold:16.0"              \
                                          icon=􀈧                                   \
                                          label=$LOADING                           \
                                          click_script="open https://github.com/pulls/review-requested"  \
                                          script="$PLUGIN_DIR/githubIndicator.sh"  \
                                                                                   \
           --add       bracket            github                                   \
                                          github.prs                           \
                                                                                   \
           --set       github             background.drawing=on
