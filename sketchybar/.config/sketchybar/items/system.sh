#!/usr/bin/env sh

sketchybar --clone     system.label       label_template                                \
           --set       system.label       label=sys                                     \
                                          position=left                                 \
                                          drawing=on                                    \
                                          script="$PLUGIN_DIR/window_title.sh"          \
           --subscribe system.label       front_app_switched                            \
                                                                                        \
           --add       alias              "Control Center,Battery" right                 \
           --set "Control Center,Battery" update_freq=2                                 \
                                          drawing=$HAS_BATTERY                          \
                                          icon.padding_left=-5                          \
                                          label.drawing=off                             \
                                          background.padding_left=0                     \
                                          background.padding_right=-3                   \
                                          click_script="sketchybar -m --set \"\$NAME\" popup.drawing=toggle" \
                                                                                        \
           --add       alias              "Control Center,WiFi" right                    \
           --set    "Control Center,WiFi" update_freq=2                                 \
                                          icon.drawing=off                              \
                                          label.drawing=off                             \
                                          background.padding_left=-4                    \
                                          background.padding_right=-4                   \
                                                                                        \
           --add       alias              "Control Center,Sound" right                   \
           --set   "Control Center,Sound" update_freq=2                                 \
                                          icon.drawing=off                              \
                                          label.drawing=off                             \
                                          background.padding_left=-4                    \
                                          background.padding_right=-4                   \
                                                                                        \
                                                                                        \
           --add       item               system.yabai_float right                       \
           --set       system.yabai_float script="$PLUGIN_DIR/yabai_float.sh"           \
                                          icon.font="$FONT:Bold:16.0"                   \
                                          label.drawing=off                             \
                                          updates=on                                    \
           --subscribe system.yabai_float front_app_switched window_focus mouse.clicked \
                                                                                        \
           --add       bracket            system                                        \
                                          system.label                                  \
                                          "Control Center,Battery"                      \
                                          "Control Center,WiFi"                         \
                                          "Control Center,Sound"                        \
                                          system.yabai_float                            \
                                                                                        \
           --set       system             background.drawing=on
