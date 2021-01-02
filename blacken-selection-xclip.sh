#! /bin/sh
xclip -o | blacken-selection "$@" | tee /dev/stderr | xsel -i -b

