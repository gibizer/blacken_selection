#! /bin/sh
xclip -o | blacken-selection "$@" | tee /dev/stderr | xclip -i -selection CLIPBOARD

