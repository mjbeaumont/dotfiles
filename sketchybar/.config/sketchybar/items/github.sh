#!/usr/bin/env sh

sketchybar --add       event              brew_upgrade                             \
           --add       event              git_push                                 \
                                                                                   \
           --add       item               github.commits right                      \
           --set       github.commits     associated_space=4                       \
                                          update_freq=1000                         \
                                          icon.color=0xaaffffff                    \
                                          icon.highlight_color=0xff9dd274          \
                                          icon.font="$FONT:Bold:16.0"              \
                                          icon=􀂓                                   \
                                          label=$LOADING                           \
                                          click_script="open https://github.com"   \
                                          script="$PLUGIN_DIR/githubIndicator.sh"  \
           --subscribe github.commits     git_push                                 \
                                                                                   \
           --add       item               packages right                            \
           --set       packages           update_freq=18000                        \
                                          script="$PLUGIN_DIR/package_monitor.sh"  \
                                          label=$LOADING                           \
                                          icon=􀐛                                   \
                                          associated_space=4                       \
           --subscribe packages           brew_upgrade mouse.clicked               \
                                                                                   \
           --add       bracket            github                                   \
                                          github.commits                           \
                                          packages                                 \
                                                                                   \
           --set       github             background.drawing=on
