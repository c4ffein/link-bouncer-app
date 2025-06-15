#!/usr/bin/osascript

# Set your browser command here
set browser_command to "\"$HOME\"\"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome\" --new-window "

on run argv
    do shell script browser_command & "https://github.com/c4ffein/link-bouncer-app"
end run

on open location unsafe_url
    # `quoted form of` => https://stackoverflow.com/a/9114512
    set safe_url to quoted form of unsafe_url
    do shell script browser_command --new-window " & safe_url
    return true
end open location
