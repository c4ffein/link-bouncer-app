#!/usr/bin/env sh

set -e

cd "$(dirname "$0")" || (echo "Can't cd to the script directory" >&2 && exit 1)
rm -r LinkBouncer.app || echo "- No LinkBouncer.app found, skipped deletion"
osacompile -o LinkBouncer.app -e stay-open files/base-script.applescript
lines=$(wc -l < "LinkBouncer.app/Contents/Info.plist")
keep=$((lines - 2))
head -n "$keep" "LinkBouncer.app/Contents/Info.plist" > "LinkBouncer.app/temp"
mv "LinkBouncer.app/temp" "LinkBouncer.app/Contents/Info.plist"
cat files/info-plist-missing-keys.plist >> "LinkBouncer.app/Contents/Info.plist"
echo "</dict>\n</plist>" >> "LinkBouncer.app/Contents/Info.plist"
echo "- Built LinkBouncer.app"
echo "- Now try registering so we don't keep references to a previous .plist..."
echo "- WARNING: MacOS may cache the previous Info.plist - clean cache by deleting the app and opening a link"
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -v -f LinkBouncer.app
echo "- Registered"
