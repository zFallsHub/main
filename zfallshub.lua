local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "zFalls Hub - Get Key", HidePremium = false, SaveConfig = true, ConfigFolder = "keys", IntroText="Loading..."})

local OrionLib = {
	Elements = {},
	ThemeObjects = {},
	Connections = {},
	Flags = {},
	Themes = {
		Default = {
			Main = Color3.fromRGB(30, 30, 30),
			Second = Color3.fromRGB(32, 32, 32),
			Stroke = Color3.fromRGB(0, 140, 255),
			Divider = Color3.fromRGB(60, 60, 60),
			Text = Color3.fromRGB(240, 240, 240),
			TextDark = Color3.fromRGB(150, 150, 150)
		}
	},
	SelectedTheme = "Default",
	Folder = nil,
	SaveCfg = truec
}

local Tab = Window:MakeTab({
	Name = "About Us",
	Icon = "rbxassetid://7733746980",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Welcome! Join Discord To get Your Key"
})
local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local Camera = require(game.ReplicatedStorage.Util.CameraShaker)
Camera:Stop()

local fastAttackEnabled = false
local autoAttackEnabled = false

coroutine.wrap(function()
    game:GetService("RunService").Stepped:Connect(function()
        if fastAttackEnabled then
            if getupvalues(CombatFramework)[2]['activeController'].timeToNextAttack then
                getupvalues(CombatFramework)[2]['activeController'].timeToNextAttack = 0
            end
        end
        
        if autoAttackEnabled then
            if getupvalues(CombatFramework)[2]['activeController'].timeToNextAttack == 0 then
                getupvalues(CombatFramework)[2]['activeController']:attack()
            end
        end
    end)
end)()

Tab:AddToggle({
	Name = "Fast Attack",
	Default = false,
	Callback = function(Value)
		fastAttackEnabled = Value
	end    
})

Tab:AddToggle({
	Name = "Auto Click",
	Default = false,
	Callback = function(Value)
		autoAttackEnabled = Value
	end    
})



