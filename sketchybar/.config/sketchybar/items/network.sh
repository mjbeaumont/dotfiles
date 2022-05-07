#!/usr/bin/env sh

sketchybar --add       item               network.up left                               \
           --set       network.up         label.font="$FONT:Heavy:9"                    \
                                          icon.font="$FONT:Heavy:9"                     \
                                          icon=􀅃                                        \
                                          icon.highlight_color=0xff8b0a0d               \
                                          width=0                                       \
                                          y_offset=5                                    \
                                          update_freq=2                                 \
                                          script="$PLUGIN_DIR/network.sh"               \
                                          lazy=on                                       \
                                                                                        \
           --add       item               network.down left                             \
           --set       network.down       label.font="$FONT:Heavy:9"                    \
                                          icon.font="$FONT:Heavy:9"                     \
                                          icon=􀅄                                        \
                                          icon.highlight_color=0xff10528c               \
                                          y_offset=-5                                   \
                                                                                        \
           --add       bracket            network                                       \
                                          network.up                                    \
                                          network.down                                  \
                                                                                        \
           --set       network            background.drawing=on
