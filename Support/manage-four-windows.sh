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
    set yOffset to 11
    
    if numberOfWindows > 4 then
        display alert "Sorry, this mini tool can handle maximum 4 windows." as critical
        return
    end if
    
    set blockSize to desktopWidth / 3
    set blockSizeWidth to desktopWidth / 2
    set blockSizeHeight to desktopHeight / 2
    
    if numberOfWindows = 1 then
        set the bounds of the first window to {0, 0, desktopWidth, desktopHeight}
    end if
    
    if numberOfWindows = 2 then
        set the bounds of the first window to {0, 0, blockSizeWidth, desktopHeight}
        set the bounds of the second window to {blockSizeWidth, 0, desktopWidth, desktopHeight}
    end if
    
    if numberOfWindows = 3 then
        set the bounds of the first window to {0, 0, blockSize, desktopHeight}
        set the bounds of the second window to {blockSize, 0, (blockSize * 2), desktopHeight}
        set the bounds of the third window to {(blockSize * 2), 0, desktopWidth, desktopHeight}
    end if
    
    if numberOfWindows = 4 then
        set the bounds of the first window to {0, 0, blockSizeWidth, blockSizeHeight - yOffset}
        set the bounds of the second window to {blockSizeWidth, 0, desktopWidth, blockSizeHeight - yOffset}
        set the bounds of the third window to {0, blockSizeHeight + yOffset, blockSizeWidth, desktopHeight}
        set the bounds of the fourth window to {blockSizeWidth, blockSizeHeight + yOffset, desktopWidth, desktopHeight}
    end
end tell