local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "zFalls Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "zfalls"})

local Tab = Window:MakeTab({
	Name = "MISC",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local CombatFramework = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
local Camera = require(game.ReplicatedStorage.Util.CameraShaker)
Camera:Stop()

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local heightAboveEnemies = 20
local searchRadius = 1000
local autoCatchEnabled = false
local fastAttackEnabled = false

-- Função para manter o player no ar
local function keepPlayerInAir()
    humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, humanoidRootPart.Position.Y + heightAboveEnemies, humanoidRootPart.Position.Z)
end

-- Função para pegar todos os humanoides com o nome "Bandit [Lv. 5]"
local function getBandits()
    local bandits = {}
    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("Model") and object:FindFirstChild("Humanoid") and object.Name == "Bandit [Lv. 5]" then
            local humanoidRootPart = object:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local distance = (humanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if distance <= searchRadius then
                    table.insert(bandits, humanoidRootPart)
                end
            end
        end
    end
    return bandits
end

-- Função para mover os bandits para debaixo do player e impedir movimento
local function moveAndFreezeBandits()
    local bandits = getBandits()
    for _, banditRootPart in ipairs(bandits) do
        banditRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -heightAboveEnemies, 0)
        local banditHumanoid = banditRootPart.Parent:FindFirstChild("Humanoid")
        if banditHumanoid then
            banditHumanoid.PlatformStand = true
            banditHumanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
            banditHumanoid:ChangeState(Enum.HumanoidStateType.Physics)
        end
    end
end

-- Loop para manter o player no ar e mover os bandits
coroutine.wrap(function()
    while true do
        if autoCatchEnabled then
            keepPlayerInAir()
            moveAndFreezeBandits()
        end
        wait(0.5) -- Ajuste o tempo conforme necessário
    end
end)()

-- Toggle para auto catch
Tab:AddToggle({
    Name = "Auto Catch Bandits",
    Default = false,
    Callback = function(Value)
        autoCatchEnabled = Value
        print("Auto Catch Bandits is now " .. (autoCatchEnabled and "enabled" or "disabled"))
    end    
})

-- Função para fast attack
coroutine.wrap(function()
    game:GetService("RunService").Stepped:Connect(function()
        if fastAttackEnabled then
            if getupvalues(CombatFramework)[2]['activeController'].timeToNextAttack then
                getupvalues(CombatFramework)[2]['activeController'].timeToNextAttack = 0
            if getupvalues(CombatFramework)[2]['activeController'].timeToNextAttack == 0 then
                getupvalues(CombatFramework)[2]['activeController']:attack()
            end
        end
    end)
end)()

-- Toggle para fast attack
Tab:AddToggle({
    Name = "Fast Attack",
    Default = false,
    Callback = function(Value)
        fastAttackEnabled = Value
        print("Fast Attack is now " .. (fastAttackEnabled and "enabled" or "disabled"))
    end    
})
