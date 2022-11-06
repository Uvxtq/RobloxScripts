getgenv().fence = {
    Toggles = {
        enabled = false,
        legit = false,
        rage = false,
        autoCollectLoot = false,
        stop = false,
    },
    Settings = {
        npcToAttack = 'Goblin',
        lastAttack = 0,
        minLevel = 10,
        maxLevel = 20,
        attackSpeed = 0.14,
    },
}

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

function GetNumberInString(String)
    local Number = ''
    for i = 1, #String do
        local Char = String:sub(i, i)
        if tonumber(Char) then
            Number = Number .. Char
        end
    end
    return tonumber(Number)
end

function GetLoot()
    local LootTable = {}
    for _, Loot in workspace.Projectiles:GetChildren() do
        if Loot:IsA('Part') and Loot:FindFirstChild('ProximityPrompt') then
            table.insert(LootTable, Loot)
        end
    end
    return LootTable
end

function LevelCheck(string)
    if GetNumberInString(string) >= fence.Settings.minLevel and GetNumberInString(string) <= fence.Settings.maxLevel then
        return true
    end
end

function GetEnemys()
    local Enemys = {}
    for _, Enemy in next, workspace.NPCs:GetChildren() do
        if fence.Settings.npcToAttack == 'All' then
            if Enemy:FindFirstChild("HumanoidRootPart") then
                table.insert(Enemys, Enemy)
            end
        elseif fence.Settings.npcToAttack ~= 'All' then
            if Enemy:FindFirstChild("HumanoidRootPart") and Enemy.Name:match(fence.Settings.npcToAttack) then
                table.insert(Enemys, Enemy)
            end
        end
    end
    return Enemys
end

function GetClosestEnemy()
    local Enemys = GetEnemys()
    local ClosestEnemy = nil
    local ClosestDistance = math.huge
    for _, Enemy in next, Enemys do
        local Distance = (RootPart.Position - Enemy.HumanoidRootPart.Position).Magnitude
        if Distance < ClosestDistance then
            ClosestDistance = Distance
            ClosestEnemy = Enemy
        end
    end
    return ClosestEnemy
end

function TeleportToEnemy(Enemy)
    local HumanoidRootPart = Enemy:FindFirstChild("HumanoidRootPart")
    if HumanoidRootPart then
        RootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(0, 0, 2.5) * CFrame.Angles(0, math.rad(360), 0)
    end
end

function Attack()
    if tick() - (fence.Settings.lastAttack or 0) >= 0.14 then
        fence.Settings.lastAttack = tick()
        mouse1click()
    end
end

local Window = Rayfield:CreateWindow({
    Name = "Shadovis RPG",
    LoadingTitle = "Shadovis RPG",
    LoadingSubtitle = "By: Kaoru~#6438",
    ConfigurationSaving = {
		Enabled = true,
		FolderName = "Shadovis-RPG-Kaoru",
		FileName = "reddyhub"
	},
    Discord = {
        Enabled = true,
        Invite = "reddyhub",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Shadovis RPG",
        Subtitle = "Key System",
        Note = "The Key is in the discord server.",
        FileName = "reddyhub",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = "Z2Q&6z74e@z8UzUbGpG4O@H2e&"
    }
})
local MainWindow = Window:CreateTab('Main')
local MiscWindow = Window:CreateTab('Misc')

MainWindow:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Callback = function(Value)
        fence.Toggles.enabled = Value
    end,
})

MainWindow:CreateDropdown({
    Name = 'Attack Mode',
    Options = {
        'Legit',
        'Rage'
    },
    CurrentOption = 'Rage',
    Callback = function(Value)
        if Value == 'Legit' then
            fence.Toggles.legit = true
            fence.Toggles.rage = false
        elseif Value == 'Rage' then
            fence.Toggles.legit = false
            fence.Toggles.rage = true
        end
    end,
})

MiscWindow:CreateToggle({
    Name = "Auto Collect Loot",
    CurrentValue = false,
    Callback = function(Value)
        fence.Toggles.autoCollectLoot = Value
    end,
})

task.spawn(function()
    while true do task.wait()
        if fence.Toggles.enabled then
            local Loot = GetLoot()
            if fence.Toggles.autoCollectLoot and #Loot > 0 then
                fence.Toggles.stop = true
                for i = 1, #Loot do
                    local LootPart = Loot[i]
                    if LootPart then
                        RootPart.CFrame = LootPart.CFrame
                        fireproximityprompt(LootPart.ProximityPrompt, 0)
                    end
                end
            elseif fence.Toggles.autoCollectLoot and #Loot == 0 then
                fence.Toggles.stop = false
            end

            if fence.Toggles.rage and fence.Toggles.stop == false then
                local Enemy = GetClosestEnemy()
                if Enemy then
                    TeleportToEnemy(Enemy)
                    Attack()
                end
            elseif fence.Toggles.legit and fence.Toggles.stop == false then
                local Enemy = GetClosestEnemy()
                if Enemy then
                    local Distance = (RootPart.Position - Enemy.HumanoidRootPart.Position).Magnitude
                    Humanoid:MoveTo(Enemy.HumanoidRootPart.Position)
                    if Distance <= 5 then
                        Attack()
                    end
                end
            end
        end
    end
end)
