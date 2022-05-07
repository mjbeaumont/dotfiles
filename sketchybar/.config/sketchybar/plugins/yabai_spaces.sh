#!/usr/bin/env bash
sketchybar --add       space              space_template left                \
           --set       space_template     icon.highlight_color=0xff9dd274    \
                                          label.drawing=off                  \
                                          drawing=off                        \
                                          updates=on                         \
                                          label.font="$FONT:Black:13.0"      \
                                          icon.font="$FONT:Bold:17.0"        \
                                          script="$PLUGIN_DIR/space.sh"      \
                                          click_script="$SPACE_CLICK_SCRIPT" \
                                                                             \
           --clone     spaces_1.label     label_template                     \
           --set       spaces_1.label     label=spc                          \
                                          label.width=52                     \
                                          label.align=left                 \
                                          associated_display=1               \
                                          position=left                      \
                                          drawing=on                         \

icons=("􀃉" "􀽎" "􀼺" "􀓕" "􀤙" "􀃓" "􀃕" "􀃗" "􀃙" "􀃛" "􀕒" "􀕓" "􀕔" "􀕕" "􀕖") #0 to 14
highlight_colors=("" "0xff9dd274" "0xfff69c5e" "0xff72cce8" "0xffeacb64" "0xff9dd274" "0xfff69c5e" "0xff72cce8" "0xffeacb64" "0xff9dd274" "0xfff69c5e" "0xff72cce8" "0xffeacb64" "0xff9dd274" "0xfff69c5e")

QUERY="$(yabai -m query --spaces | jq -r '.[] | [.index, .windows[0], .label, .display, .["is-visible"]] | @sh')"

NAMES=""
while read -r index window yabai_name display visible
do
  NAME="$(echo "${yabai_name}" | tr -d "'")"
  if [ "${window}" = "null" ]; then
    label="$NAME"
  else
    label="$NAME*"
  fi
  if [ "$NAME" = "" ] || [ "$NAME" = " " ]; then 
    NAME="${index}"
  fi
  
  NAMES="$NAMES $NAME"
  args+=(--clone "$NAME" space_template after \
    --set "$NAME" label="${label}" \
    icon="${icons[${index}]}" \
    icon.highlight_color="${highlight_colors[${index}]}" \
    associated_space=${index}
    associated_display=${display} \
    icon.highlight=${visible} \
    drawing=on)
done <<< "$QUERY"

args+=(--reorder $NAMES)
sketchybar -m ${args[@]}
