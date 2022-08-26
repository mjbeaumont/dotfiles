#!/usr/bin/env sh
sketchybar --add       item               calendar.time right                           \
           --set       calendar.time      update_freq=2                                 \
                                          icon.drawing=off                              \
                                          script="$PLUGIN_DIR/time.sh"                  \
                                                                                        \
           --clone     calendar.date      label_template                                \
           --set       calendar.date      update_freq=60                                \
                                          position=right                                \
                                          label=cal                                     \
                                          drawing=on                                    \
                                          background.padding_right=0                    \
                                          script="$PLUGIN_DIR/date.sh"                  \
                                                                                        \
           --add       bracket            calendar                                      \
                                          calendar.time                                 \
                                          calendar.date                                 \
                                                                                        \
            --add      alias              MeetingBar right                              \
            --set      MeetingBar         background.padding_right=-8                   \
                                          background.padding_left=-10                   \
                                          update_freq=10                                \
                                                                                        \
                                                                                        \
           --set       calendar           background.drawing=on
