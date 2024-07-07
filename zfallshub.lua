local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Player = game.Players.LocalPlayer
local Window = OrionLib:MakeWindow({
    Name = "Key System",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "keyslog",
    IntroText = "Loading..."
})

local Section = Tab:AddSection({
    Name = "Welcome to Key System: " .. Player.DisplayName .. " Your Current Version is 1.2"
})

OrionLib:MakeNotification({
    Name = "Welcome to zFalls Hub",
    Content = "You Are Using Version (1.2)",
    Image = "rbxassetid://4483345998",
    Time = 5
})

_G.KeyInput = ""
_G.Key = "good_friday"

Tab:AddTextbox({
    Name = "Input Key",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        _G.KeyInput = Value
    end
})

Tab:AddButton({
    Name = "Verify Key!",
    Callback = function()
        if _G.KeyInput == _G.Key then
            OrionLib:MakeNotification({
                Name = "Key Was Correct",
                Content = "You Are Using Version (1.2)",
                Image = "rbxassetid://4483345998",
                Time = 2
            })
            loadstring(game:HttpGet("https://raw.githubusercontent.com/zFallsHub/main/main/zzFallsHub.lua"))()
            OrionLib:Destroy()
        else
            OrionLib:MakeNotification({
                Name = "Key Was Incorrect",
                Content = "Get Key In Discord.gg/zFallsHub",
                Image = "rbxassetid://4483345998",
                Time = 2
            })
        end
    end
})
