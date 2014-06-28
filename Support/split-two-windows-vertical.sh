#!/usr/bin/osascript

tell application "Finder"
    set desktopSize to bounds of window of desktop
    set desktopWidth to item 3 of desktopSize
    set desktopHeight to item 4 of desktopSize
end tell

tell application "TextMate"
    activate
    set windowList to (every window where visible is true)
    set numberOfWindows to count of windowList
    
    if numberOfWindows > 2 then
        display alert "Sorry, I need 2 windows, not more :)" as critical
        return
    end if
    
    set blockSizeWidth to desktopWidth / 2
    set blockSizeHeight to desktopHeight / 2
    
    set the bounds of the first window to {0, 0, blockSizeWidth, desktopHeight}
    set the bounds of the second window to {blockSizeWidth, 0, desktopWidth, desktopHeight}
end tell