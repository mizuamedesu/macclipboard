hs.hotkey.bind({"cmd", "shift"}, "V", function()
    -- マクロ実行開始時に1秒待機
    hs.timer.usleep(1000000) -- 1秒 = 1,000,000マイクロ秒

    -- クリップボードの内容を取得
    local clipboard = hs.pasteboard.getContents()
    if clipboard then
        -- 日本語IMEをオフにする（英数キーを押す）
        hs.eventtap.keyStroke({}, 0x66) -- 0x66 is the key code for 英数

        -- クリップボードの内容を行ごとに処理
        for line in clipboard:gmatch("[^\r\n]+") do
            -- 行の各文字を処理
            for char in line:gmatch(".") do
                if char == " " then
                    hs.eventtap.keyStroke({}, "space")
                elseif char == "-" then
                    hs.eventtap.keyStroke({}, "-")
                elseif char == "." then
                    hs.eventtap.keyStroke({}, ".")
                elseif char == "/" then
                    hs.eventtap.keyStroke({}, "/")
                elseif char == ":" then
                    hs.eventtap.keyStroke({}, ":")
                elseif char == ";" then
                    hs.eventtap.keyStroke({}, ";")
                elseif char == "&" then
                    hs.eventtap.keyStroke({"shift"}, "6") -- 日本語キーボードでの & の入力（修正）
                elseif char == "+" then
                    hs.eventtap.keyStroke({"shift"}, ";")
                elseif char == "*" then
                    hs.eventtap.keyStroke({"shift"}, ":")
                else
                    if char:match("%u") then
                        local lowerChar = char:lower()
                        hs.eventtap.keyStroke({"shift"}, lowerChar)
                    else
                        hs.eventtap.keyStroke({}, char)
                    end
                end
                -- 各文字入力後に短い遅延を入れる
                hs.timer.usleep(50000) -- 50ミリ秒
            end
            -- 行の終わりにEnterキーを押す
            hs.eventtap.keyStroke({}, "return")
            -- 行の間に少し長めの遅延を入れる
            hs.timer.usleep(200000) -- 200ミリ秒
        end
    end
end)
