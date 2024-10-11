hs.hotkey.bind({"cmd", "shift"}, "V", function()
    hs.timer.usleep(1000000) 
    local clipboard = hs.pasteboard.getContents()
    if clipboard then
        for char in clipboard:gmatch(".") do
            if char:match("%u") then
                local lowerChar = char:lower()
                hs.eventtap.keyStroke({"shift"}, lowerChar, 0)
            else
                hs.eventtap.keyStroke({}, char, 0)
            end
            -- キー入力間遅延
            hs.timer.usleep(200000) 
        end
    end
end)