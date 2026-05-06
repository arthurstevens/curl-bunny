#!/usr/bin/env bash

# escape helper to move cursor
move() {
    printf "\033[%dA" "$1";
    printf "\033[%dB" "$2";
    printf "\033[%dD" "$3";
    printf "\033[%dC" "$4";
}

# typewriter with delay
typewrite() {
    local text="$1" delay="${2:-0.05}"
    for ((i=0; i<${#text}; i++)); do
        printf "%s" "${text:$i:1}"
        sleep "$delay"
    done
}

# update face given a relative position
set_face() {
    local up="$1" down="$2" left="$3" right="$4"
    local text="$5"
    local len_text="${#text}"
    
    move $up $down $left $right
    printf "%s" "$text"
    move $((down)) $((up)) $((right)) $((left-len_text))
}

readonly TALKING_FACE="^,^"
readonly SILENT_FACE="-.-"

# draw bunny's dialouge box :O
cat << "EOF"

        '               +           '       +
 +                ^             .
     .                   *          ₍^. ̫.^₎Ⳋ    *
    +---------------------------------------+       '
    |                                       |    x
 '  |                                       |
    |                                       |
    +---------------------------------------+          "
      /    ,                   "        ^
(\_/)                   .          ~          x
( ^,^)           +              .
(")_(")     *

EOF

# writing
move 9 -1 -1 10
typewrite "weird thing to curl"
set_face -1 6 27 -1 $SILENT_FACE

typewrite "..." 0.4
sleep 0.5

set_face -1 6 30 -1 $TALKING_FACE
typewrite " hi."
set_face -1 6 34 -1 $SILENT_FACE
sleep 0.4

set_face -1 6 34 -1 $TALKING_FACE
move -1 1 29 -1
typewrite "go look at it properly?  •‿•"
set_face -1 5 33 -1 $SILENT_FACE
sleep 0.2

set_face -1 5 33 -1 $TALKING_FACE
move -1 1 22 -1
typewrite "⤷ https://arthurstevens.dev"
set_face -1 4 38 -1 $SILENT_FACE

# overwrite with link
move -1 -1 25 -1
echo -e "\033[32m\033]8;;https://arthurstevens.dev\007https://arthurstevens.dev\033]8;;\007\033[0m"

# return cursor
move -1 7 -1 -1

