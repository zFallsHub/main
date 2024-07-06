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

OrionLib:MakeNotification({
	Name = "Key Sistem!",
	Content = "You Need Place Your Key Get in Discord!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

Tab:AddTextbox({
	Name = "Key Input",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		print(Value)
	end	  
})

Tab:AddButton({
	Name = "Verify Key",
	Callback = function()
      		print("button pressed")
  	end    
})

Tab:AddButton({
	Name = "Copy Discord Link",
	Callback = function()
      	 local copy = “” 
         setclipboard(copy)
  	end    
})



local Section = Tab:AddSection({
	Name = ".Premium Users Login."
})





Tab:AddTextbox({
	Name = "Login: USER ( Bypass The Key System )",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		print(Value)
	end	  
})
Tab:AddTextbox({
	Name = "Login: PASSWORD ( Bypass The Key System )",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		print(Value)
	end	  
})

Tab:AddButton({
	Name = "Join To Hub",
	Callback = function()
      		print("button pressed")
  	end    
})




