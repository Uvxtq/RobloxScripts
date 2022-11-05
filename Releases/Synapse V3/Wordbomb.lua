if not RenderWindow then
    error("Exploit not supported - Get Synapse V3")
end

setclipboard('KaoruIsHot')
local wordcap = 100
local typespeed = .1
local autoTypeOn = false
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
    Name = "Wordbomb",
    LoadingTitle = "Wordbomb",
    LoadingSubtitle = "By: Kaoru~#6438",
    ConfigurationSaving = {
		Enabled = false,
		FolderName = "Wordbomb-Kaoru",
		FileName = "Wordbomb-Config"
	},
    KeySystem = true,
    KeySettings = {
        Title = "Wordbomb",
        Subtitle = "Key System",
        Note = "Key: KaoruIsHot,\nIt is also copied to your clipboard.",
        Key = "KaoruIsHot"
    }
})
local MainWindow = Window:CreateTab("Main")
local MiscWindow = Window:CreateTab("Misc")

local Dictionary = game:HttpGet("https://raw.githubusercontent.com/Uvxtq/WordBomb/main/Dictionary.txt"):split("\n")
local BackUpDictionary = loadstring(game:HttpGet("https://gist.githubusercontent.com/raw/949b26b84a370ab9c041c57a89a9f65a/", true))()
local player = game:GetService("Players").LocalPlayer
getgenv().fence = {
    sigs = {}
}
local JoinGame = game:GetService("ReplicatedStorage").Network.Games.GameEvent
local GameUI = player.PlayerGui.GameUI
local Remotes = game:GetService("ReplicatedStorage").Network.Games

local PromptsFound = {}
function GetWordsWithPrompt(prompt, count)
    prompt = prompt:upper()
    if PromptsFound[prompt] then return PromptsFound[prompt] end

    PromptsFound[prompt] = {}
    for _, word in Dictionary do
        word = word:upper()
        if word:find(prompt) and #word < count then
            table.insert(PromptsFound[prompt], word)
        end
    end

    if #PromptsFound[prompt] == 0 then
        for _, word in BackUpDictionary do
            word = word:upper()
            if word:find(prompt) and #word < count then
                table.insert(PromptsFound[prompt], word)
            end
        end
    end

    return PromptsFound[prompt]
end
local typing = false
function write(tb, prompt, typespeed)
    local typespeed = typespeed or 0.1
    if typing then return end
    typing = true

    local words = GetWordsWithPrompt(prompt, wordcap)
    local text = words[math.random(1, #words)]

    tb.Text = ""
    task.wait(1)
    for _, letter in text:split("") do
        tb.Text = tb.Text .. letter
        task.wait(typespeed)
    end
    task.wait(.1)
    tb:ReleaseFocus(true)
    typing = false
end


table.insert(fence.sigs,Remotes.StartGame.OnClientEvent:Connect(function(...)
    local startArgs = {...}
    if typeof(startArgs[2]) ~= "table" or typeof(startArgs[3]) ~= "table" then return end
    task.wait()

    local gameTable = startArgs[3]
    local myIndex = table.find(gameTable.Players, player.UserId)
    local TextBox = GameUI:FindFirstChild("Typebox",true)

    local currentPrompt;
    local currentPossessor;
    local lastPossessor;

    if myIndex == gameTable.PossessorIndex and autoTypeOn then
        currentPossessor = myIndex
        currentPrompt = gameTable.Prompt
        write(TextBox, currentPrompt, typespeed)
        lastPossessor = myIndex
    end

    table.insert(fence.sigs, Remotes.GameEvent.OnClientEvent:Connect(function(_,type,...)
        local args = {...}
        if type == "ChangePossessor" then
            currentPossessor = args[3]
            currentPrompt = args[4]
            if args[3] ~= lastPossessor and args[3] == myIndex and autoTypeOn then
                TextBox.Focused:Wait()
                write(TextBox, currentPrompt, typespeed)
            end
            lastPossessor = args[3]
        elseif type == "MistakeEvent" then
            if currentPossessor == myIndex and autoTypeOn then
                task.wait(1)
                write(TextBox, currentPrompt, typespeed)
            end
        end
    end))
end))

MainWindow:CreateToggle({
	Name = "Auto Type",
	CurrentValue = false,
	Callback = function(AutoValue)
        autoTypeOn = AutoValue
	end,
})

MainWindow:CreateSlider({
	Name = "Auto type Speed",
	Range = {0, 1},
	Increment = 0.1,
	Suffix = "s",
	CurrentValue = 0.1,
	Callback = function(SpeedValue)
        typespeed = SpeedValue
	end,
})

MainWindow:CreateSlider({
	Name = "Word Cap",
	Range = {1, 100},
	Increment = 1,
	Suffix = "letters",
	CurrentValue = 100,
	Callback = function(WordCapValue)
        wordcap = WordCapValue
	end,
})

-- MiscWindow:CreateToggle({
--     Name = "Auto Rejoin",
--     CurrentValue = false,
--     Callback = function(AutoRejoinValue)
--         AutoRejoin = AutoRejoinValue
--         if AutoRejoinValue then
--             while AutoRejoin do task.wait(1)
--                 if JoinButton then
--                     firesignal(JoinButton.MouseButton1Click)
--                 end
--             end
--         end
--     end,
-- })
