#!/usr/bin/osascript

on run argv
    do shell script "\"$HOME\"\"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome\" --new-window https://github.com/c4ffein/link-bouncer-app"
end run

on open location unsafe_url
    # `quoted form of` => https://stackoverflow.com/a/9114512
    set safe_url to quoted form of unsafe_url
    do shell script "\"$HOME\"\"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome\" --new-window " & safe_url
    return true
end open location
