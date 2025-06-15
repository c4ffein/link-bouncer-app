# LinkBouncer

A lightweight macOS application that acts as a customizable link and file handler. LinkBouncer intercepts URLs and file openings, allowing you to redirect them to your preferred browser or application.

## What it does

LinkBouncer is an AppleScript app that registers itself as a handler for:
- **Web URLs** (http/https) 
- **File types**: HTML, JSON, PDF, SVG, text files, images (JPEG, PNG, GIF), and media files (OGG, WebM)
- **Local files** (file:// URLs)

When you click a link or open a supported file type, LinkBouncer can redirect it to your chosen browser instead of the system default. You can set LinkBouncer as your default macOS browser to open all links through this app.

## Customization

**Limitation**: Currently only supports a hardcoded Google Chrome path.  
I'm keeping this quick and dirty for my uses, if anyone thinks it could be nice to have an UI to select the target browser I may build one, just create an issue.
Edit `files/base-script.applescript` to change the target browser (preserve the trailing space in the command):

```applescript
set browser_command to "\"$HOME\"\"/Applications/Google Chrome.app/Contents/macOS/Google Chrome\" --new-window "
```

## Building

Run the build script to compile the app:

```bash
./build.sh
```

This will:
- Compile the AppleScript into `LinkBouncer.app`
- Configure the app's Info.plist with proper file associations
- Register the app with macOS Launch Services

After launching the app for the first time, it should appear in your default browser list in System Settings where you can select it.

## Installation Notes

- macOS may cache data linked to the previous entry for the default browsers section
- If changes don't take effect, delete the app and try opening a link to clear the cache

## License

This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
