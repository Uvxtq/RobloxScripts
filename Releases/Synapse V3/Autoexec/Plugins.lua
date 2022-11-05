repeat task.wait() until game:IsLoaded()
if RenderWindow then
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/CandyWirus/scripts/master/UniverseViewerV3.lua')))('Andy_Wirus#5999');
end

local getasset = getsynasset or getcustomasset
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
local function getcustomassetfunc(path)
    makefolder("engo")
    makefolder("engo/assets")
	if not isfile(path) then
		local req = requestfunc({
			Url = "https://raw.githubusercontent.com/joeengo/roblox/main/"..path:gsub("engo/assets", "assets"),
			Method = "GET"
		})
		writefile(path, req.Body)
	end
	return getasset(path) 
end

-- // Insert Rejoin Button
local RejoinGameButtonButton = Instance.new("ImageButton")
local ResetGameButtonTextLabel = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local ResetGameButtonHint = Instance.new("ImageLabel")

if type(gethui) == 'function' then
    gethui(RejoinGameButtonButton)
    gethui(ResetGameButtonTextLabel)
    gethui(UITextSizeConstraint)
    gethui(ResetGameButtonHint)
end


RejoinGameButtonButton.Name = "RejoinGameButtonButton"
RejoinGameButtonButton.Parent = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("SettingsShield"):WaitForChild("SettingsShield"):WaitForChild("MenuContainer"):WaitForChild("BottomButtonFrame")
RejoinGameButtonButton.BackgroundTransparency = 1.000
RejoinGameButtonButton.Position = UDim2.new(0.5, -130, 0.5, 50)
RejoinGameButtonButton.Size = UDim2.new(0, 260, 0, 70)
RejoinGameButtonButton.ZIndex = 2
RejoinGameButtonButton.AutoButtonColor = false
RejoinGameButtonButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
RejoinGameButtonButton.ScaleType = Enum.ScaleType.Slice
RejoinGameButtonButton.SliceCenter = Rect.new(8, 6, 46, 44)

ResetGameButtonTextLabel.Name = "ResetGameButtonTextLabel"
ResetGameButtonTextLabel.Parent = RejoinGameButtonButton
ResetGameButtonTextLabel.BackgroundTransparency = 1.000
ResetGameButtonTextLabel.BorderSizePixel = 0
ResetGameButtonTextLabel.Position = UDim2.new(0.25, 0, 0, 0)
ResetGameButtonTextLabel.Size = UDim2.new(0.75, 0, 0.899999976, 0)
ResetGameButtonTextLabel.ZIndex = 2
ResetGameButtonTextLabel.Font = Enum.Font.SourceSansBold
ResetGameButtonTextLabel.Text = "Rejoin"
ResetGameButtonTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ResetGameButtonTextLabel.TextScaled = true
ResetGameButtonTextLabel.TextSize = 24.000
ResetGameButtonTextLabel.TextWrapped = true

UITextSizeConstraint.Parent = ResetGameButtonTextLabel
UITextSizeConstraint.MaxTextSize = 24

ResetGameButtonHint.Name = "ResetGameButtonHint"
ResetGameButtonHint.Parent = RejoinGameButtonButton
ResetGameButtonHint.AnchorPoint = Vector2.new(0.5, 0.5)
ResetGameButtonHint.BackgroundTransparency = 1.000
ResetGameButtonHint.Position = UDim2.new(0.150000006, 0, 0.474999994, 0)
ResetGameButtonHint.Size = UDim2.new(0, 55, 0, 60)
ResetGameButtonHint.ZIndex = 4
ResetGameButtonHint.Image = getcustomassetfunc("engo/assets/RejoinIcon.png")
xpcall(function()
    if game:GetService("CoreGui").RobloxGui.SettingsShield.SettingsShield.MenuContainer.BottomButtonFrame.MuteButtonButtonButton then
        RejoinGameButtonButton.Position = UDim2.new(0.5, -157, 0.5, 50)
        RejoinGameButtonButton.Size = UDim2.new(0, 235, 0, 70)
    end
end, function()
    return
end)
RejoinGameButtonButton.MouseEnter:Connect(function() 
	RejoinGameButtonButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
end)

RejoinGameButtonButton.MouseLeave:Connect(function()
	RejoinGameButtonButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
end)

RejoinGameButtonButton.MouseButton1Click:Connect(function()
	game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.J and RejoinGameButtonButton.Parent.Parent.Parent.Visible then 
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId,game.JobId,game:GetService'Players'.LocalPlayer)
	end
end)
HttpService = game:GetService("HttpService")
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
TeleportService = game:GetService("TeleportService")

repeat task.wait() until game:IsLoaded()
local getasset = getsynasset or getcustomasset
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
local function getcustomassetfunc(path)
    makefolder("kaoru")
    makefolder("kaoru/assets")
    if not isfile(path) then
        local req = requestfunc({
            Url = "https://raw.githubusercontent.com/Uvxtq/ServerhopPNG/main/"..path:gsub("kaoru/assets", "assets"),
            Method = "GET"
        })
        writefile(path, req.Body)
    end
    return getasset(path) 
end

-- // Insert New Server Button
local NewServerGameButtonButton = Instance.new("ImageButton")
local ResetGameButtonTextLabel = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local ResetGameButtonHint = Instance.new("ImageLabel")

if type(gethui) == 'function' then
    gethui(NewServerGameButtonButton)
    gethui(ResetGameButtonTextLabel)
    gethui(UITextSizeConstraint)
    gethui(ResetGameButtonHint)
end

NewServerGameButtonButton.Name = "NewServerGameButtonButton"
NewServerGameButtonButton.Parent = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("SettingsShield"):WaitForChild("SettingsShield"):WaitForChild("MenuContainer"):WaitForChild("BottomButtonFrame")
NewServerGameButtonButton.BackgroundTransparency = 1.000
NewServerGameButtonButton.Position = UDim2.new(0.5, -400, 0.5, 50)
NewServerGameButtonButton.Size = UDim2.new(0, 260, 0, 70)
NewServerGameButtonButton.ZIndex = 2
NewServerGameButtonButton.AutoButtonColor = false
NewServerGameButtonButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
NewServerGameButtonButton.ScaleType = Enum.ScaleType.Slice
NewServerGameButtonButton.SliceCenter = Rect.new(8, 6, 46, 44)

ResetGameButtonTextLabel.Name = "ResetGameButtonTextLabel"
ResetGameButtonTextLabel.Parent = NewServerGameButtonButton
ResetGameButtonTextLabel.BackgroundTransparency = 1.000
ResetGameButtonTextLabel.BorderSizePixel = 0
ResetGameButtonTextLabel.Position = UDim2.new(0.25, 0, 0, 0)
ResetGameButtonTextLabel.Size = UDim2.new(0.75, 0, 0.899999976, 0)
ResetGameButtonTextLabel.ZIndex = 2
ResetGameButtonTextLabel.Font = Enum.Font.SourceSansBold
ResetGameButtonTextLabel.Text = "Serverhop"
ResetGameButtonTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ResetGameButtonTextLabel.TextScaled = true
ResetGameButtonTextLabel.TextSize = 24.000
ResetGameButtonTextLabel.TextWrapped = true

UITextSizeConstraint.Parent = ResetGameButtonTextLabel
UITextSizeConstraint.MaxTextSize = 24

ResetGameButtonHint.Name = "ResetGameButtonHint"
ResetGameButtonHint.Parent = NewServerGameButtonButton
ResetGameButtonHint.AnchorPoint = Vector2.new(0.5, 0.5)
ResetGameButtonHint.BackgroundTransparency = 1.000
ResetGameButtonHint.Position = UDim2.new(0.150000006, 0, 0.474999994, 0)
ResetGameButtonHint.Size = UDim2.new(0, 55, 0, 60)
ResetGameButtonHint.ZIndex = 4
ResetGameButtonHint.Image = getcustomassetfunc("kaoru/assets/ServerHop.png")
xpcall(function()
    if game:GetService("CoreGui").RobloxGui.SettingsShield.SettingsShield.MenuContainer.BottomButtonFrame.MuteButtonButtonButton then
        NewServerGameButtonButton.Size = UDim2.new(0, 235, 0, 70)
    end
end, function()
    return
end)

NewServerGameButtonButton.MouseEnter:Connect(function() 
	NewServerGameButtonButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
end)

NewServerGameButtonButton.MouseLeave:Connect(function()
	NewServerGameButtonButton.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
end)

NewServerGameButtonButton.MouseButton1Click:Connect(function()
	if httprequest then
		local servers = {}
		local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100", game.PlaceId)})
		local body = HttpService:JSONDecode(req.Body)
		if body and body.data then
			for i, v in next, body.data do
				if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
					table.insert(servers, 1, v.id)
				end 
			end
		end
		if #servers > 0 then
			TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
		else
			return notify("Serverhop", "Couldn't find a server.")
		end
	end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.S and NewServerGameButtonButton.Parent.Parent.Parent.Visible then 
		if httprequest then
			local servers = {}
			local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100", game.PlaceId)})
			local body = HttpService:JSONDecode(req.Body)
			if body and body.data then
				for i, v in next, body.data do
					if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
						table.insert(servers, 1, v.id)
					end 
				end
			end
			if #servers > 0 then
				TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], game.Players.LocalPlayer)
			else
				return notify("Serverhop", "Couldn't find a server.")
			end
		end
	end
end)
local spy = {currentTableDepth = 0,maxTableDepth = 10} -- uh, from engospy

local function toUnicode(string)
    local codepoints = "utf8.char("
    
    for _i, v in utf8.codes(string) do
        codepoints = codepoints .. v .. ', '
    end
    
    return codepoints:sub(1, -3) .. ')'
end

function spy.get_path(instance) -- // Thanks to turtlespy for this code, see https://pastebin.com/raw/BDhSQqUU \\
    local name = instance.Name
    local head = (#name > 0 and '.' .. name) or "['']"
    if not instance.Parent and instance ~= game then
        return head .. " --[[ Parented to nil ]]"
    end
    if instance == game then
        return "game"
    elseif instance == workspace then
        return "workspace"
    else
        local _success, result = pcall(game.GetService, game, instance.ClassName)
        
        if _success and result then
            head = ':GetService("' .. instance.ClassName .. '")'
        elseif instance == lplr then
            head = '.LocalPlayer' 
        else    
            local nonAlphaNum = name:gsub('[%w_]', '')
            local noPunct = nonAlphaNum:gsub('[%s%p]', '')
            
            if tonumber(name:sub(1, 1)) or (#nonAlphaNum ~= 0 and #noPunct == 0) then
                head = '["' .. name:gsub('"', '\\"'):gsub('\\', '\\\\') .. '"]'
            elseif #nonAlphaNum ~= 0 and #noPunct > 0 then
                head = '[' .. toUnicode(name) .. ']'
            end
        end
    end
    return spy.get_path(instance.Parent) .. head
end

function spy.table_to_string(t) 
    spy.currentTableDepth = spy.currentTableDepth + 1
    if spy.currentTableDepth > spy.maxTableDepth+1 then
        spy.currentTableDepth = spy.currentTableDepth - 1
        return "table_over_maxTableDepth (.."..tostring(t)..")"
    end
    local returnStr = "{"
    for i,v in next, t do
        returnStr = returnStr.."\n"..(("    "):rep(spy.currentTableDepth)).."["..spy.get_real_value(i).."] = "..spy.get_real_value(v)..","
    end
    if returnStr:sub(-2) == ", " then returnStr = returnStr:sub(1, -3) end
    spy.currentTableDepth = spy.currentTableDepth - 1
    return returnStr.."\n"..(("    "):rep(spy.currentTableDepth)).."}"
end

function spy.bettergetinfo(func) 
    local info = debug.getinfo(func)
    info.func = nil 
    return info
end

function spy.get_real_value(value, newFunctionMethod)
    local _t = typeof(value)
    if _t == 'Instance' then
        return spy.get_path(value)
    elseif _t == 'string' then
        return '"'..value..'"'
    elseif _t == 'table' then 
        return spy.table_to_string(value)
    elseif _t == 'function' then
        if not islclosure((value)) then 
            return "newcclosure(function() end)"
        end
        if newFunctionMethod then
            return "--[[function -->]] "..spy.table_to_string({upvalues = debug.getupvalues(value), constants = debug.getconstants(value), protos = debug.getprotos(value), info = spy.bettergetinfo(value)})
        end
        return "function() end"
    elseif _t == 'UDim2' or _t == 'UDim' or _t == 'Vector3' or _t == 'Vector2' or _t == 'CFrame' or _t == 'Vector2int16' or _t == 'Vector3int16' or _t == 'BrickColor' or _t == 'Color3' then
        local value = _t == 'BrickColor' and "'"..tostring(value).."'" or value
        return _t..".new("..tostring(value)..")"
    elseif _t == 'TweenInfo' then
        return "TweenInfo.new("..spy.get_real_value(value.Time)..", "..spy.get_real_value(value.EasingStyle)..", "..spy.get_real_value(value.EasingDirection)..", "..spy.get_real_value(value.RepeatCount)..", "..spy.get_real_value(value.Reverses)..", "..spy.get_real_value(value.DelayTime)..")"
    elseif _t == 'Enums' then
        return "Enum"
    elseif _t == 'Enum' then
        return "Enum."..tostring(value)
    elseif _t == 'Axes' or _t == 'Faces' then
        local returnStr = _t..".new("
        local normals = Enum.NormalId:GetEnumItems()
        for i,v in next, normals do
            if value[v.Name] then
                returnStr = returnStr..spy.get_real_value(v)..", "
            end
        end
        return returnStr:sub(1, -3)..")"
    elseif _t == 'ColorSequence' then
        local returnStr = "ColorSequence.new{"
        local keypoints = value.Keypoints
        for i,v in next, keypoints do 
            returnStr = returnStr..spy.get_real_value(v)..", "
        end
        return returnStr:sub(1, -3).."}"
    elseif _t == 'ColorSequenceKeypoint' then
        return "ColorSequenceKeypoint.new("..tostring(value.Time)..", "..spy.get_real_value(value.Value)..")"
    elseif _t == 'DockWidgetPluginGuiInfo' then -- // this was a pain to make \\
        local str = ""
        local split1 = tostring(value):split(":")
        for i,v in next, split1 do 
            str = str..v.." "
        end
        local split2 = str:split(" ") 
        local str = ""
        local reali = 0
        for i,v in next, split2 do
            if math.floor(i/2) == i/2 and v~=" " then
                reali = reali + 1
                local _v = v
                if reali == 1 then 
                    _v = "Enum.InitialDockState."..v
                end
                str = str.._v..", "
            end
        end
        return "DockWidgetPluginGuiInfo.new("..(str:sub(1, -3))..")"
    elseif _t == 'DateTime' then
		if value.UnixTimestampMillis == DateTime.now().UnixTimestampMillis then
            return "DateTime.now()"
        end
        return "DateTime.fromUnixTimestampMillis("..value.UnixTimestampMillis..")"
    elseif _t == 'FloatCurveKey' then
        return "FloatCurveKey.new("..spy.get_real_value(value.Time)..", "..spy.get_real_value(value.Value)..", "..spy.get_real_value(value.Interpolation)..")"
    elseif _t == 'NumberRange' then
        return "NumberRange.new("..spy.get_real_value(value.Min)..", "..spy.get_real_value(value.Max)..")"
    elseif _t == 'NumberSequence' then
        local returnStr = "NumberSequence.new{"
        local keypoints = value.Keypoints
        for i,v in next, keypoints do 
            returnStr = returnStr..spy.get_real_value(v)..", "
        end
        return returnStr:sub(1, -3).."}"
    elseif _t == 'NumberSequenceKeypoint' then
        return "NumberSequenceKeypoint.new("..tostring(value.Time)..", "..spy.get_real_value(value.Value)..(value.Envelope and ", "..value.Envelope or "")..")"
    elseif _t == 'PathWaypoint' then
        return "PathWaypoint.new("..spy.get_real_value(value.Position)..", "..spy.get_real_value(value.Action)..")"
    elseif _t == 'PhysicalProperties' then
        return "PhysicalProperties.new("..spy.get_real_value(value.Density)..", "..spy.get_real_value(value.Friction)..", "..spy.get_real_value(value.Elasticity)..", "..spy.get_real_value(value.FrictionWeight)..", "..spy.get_real_value(value.ElasticityWeight)..")"
    elseif _t == 'Random' then
        return "Random.new()"
    elseif _t == 'Ray' then
        return "Ray.new("..spy.get_real_value(value.Origin)..", "..spy.get_real_value(value.Direction)..")"
    elseif _t == 'RaycastParams' then
        return "--[[typeof: RaycastParams ->]] {FilterDescendantsInstances = "..spy.get_real_value(value.FilterDescendantsInstances)..", FilterType = "..spy.get_real_value(value.FilterType)..", IgnoreWater = "..spy.get_real_value(value.IgnoreWater)..", CollisionGroup = '"..spy.get_real_value(value.CollisionGroup).."'}"
    elseif _t == 'RaycastResult' then
        return "--[[typeof: RaycastResult ->]] {Distance = " ..spy.get_real_value(value.Distance)..", Instance = "..spy.get_real_value(value.Instance)..", Material = "..spy.get_real_value(value.Material)..", Position = "..spy.get_real_value(value.Position)..", Normal = "..spy.get_real_value(value.Normal).."}"
    elseif _t == 'RBXScriptConnection' then
        return "--[[typeof: RBXScriptConnection ->]] {Connected = "..spy.get_real_value(value.Connected).."}"
    elseif _t == 'RBXScriptSignal' then
        return "RBXScriptSignal"
    elseif _t == 'Rect' then
        return "Rect.new("..spy.get_real_value(value.Min)..", "..spy.get_real_value(value.Max)..")"
    elseif _t == 'Region3' then
        local cframe = value.CFrame
        local size = value.Size
        local min = spy.get_real_value((cframe * CFrame.new(-size.X/2, -size.Y/2, -size.Z/2)).p)
        local max = spy.get_real_value((cframe * CFrame.new(size.X/2, size.Y/2, size.Z/2)).p)
        return "Region3.new("..min..", "..max..")"
    elseif _t == 'Region3int16' then
        return "Region3int16.new("..spy.get_real_value(value.Min)..", "..spy.get_real_value(value.Max)..")"
    elseif _t == 'CatalogSearchParams' then
        return "--[[typeof: CatalogSearchParams ->]] {SearchKeyword = "..spy.get_real_value(value.SearchKeyword)..", MinPrice = "..spy.get_real_value(value.MinPrice)..", MaxPrice = "..spy.get_real_value(value.MaxPrice)..", SortType = "..spy.get_real_value(value.SortType)..", CategoryFilter = "..spy.get_real_value(value.CategoryFilter)..", AssetTypes = "..spy.get_real_value(value.AssetTypes).."}"
    elseif _t == 'OverlapParams' then
        return "--[[typeof: OverlapParams ->]] {FilterDescendantsInstances = "..spy.get_real_value(value.FilterDescendantsInstances)..", FilterType = "..spy.get_real_value(value.FilterType)..", MaxParts ="..spy.get_real_value(value.MaxParts)..", CollisionGroup = "..spy.get_real_value(value.CollisionGroup).."}"
    elseif _t == 'userdata' then
        return "newproxy(true)"
    elseif value == nil then
        return "nil"
    end
    return tostring(value)
end
getgenv().tabletostring = spy.get_real_value
getgenv().bettertostring = spy.get_real_value
getgenv().printtable = function(...)
	local args = {...}
    local doThing = args[#args]
    if typeof(doThing) == 'boolean' then
        args[#args] = nil
    end
	for i,v in next, args do 
		print(spy.get_real_value(v, doThing))
	end
end
getgenv().copyid = function(...)
    local ScriptGetter = '**Executor Script:**\n```lua\n game:GetService("TeleportService"):TeleportToPlaceInstance('..tostring(game.PlaceId)..', "'..game.JobId..'")```'
    local args = {...}
    if #args == 0 then
        return setclipboard(ScriptGetter)
    end
end
getgenv().copytable = function(...)
	local args = {...}
    local doThing = args[#args]
    if typeof(doThing) == 'boolean' then
        args[#args] = nil
    end
	for i,v in next, args do 
		setclipboard(spy.get_real_value(v, doThing))
	end
end

-- local CoreGui = game:GetService("CoreGui")

-- if type(gethui) == 'function' then
-- 	CoreGui = gethui()
-- end

-- local RunService = game:GetService("RunService")
-- local UserInputService = game:GetService("UserInputService")

-- local ScreenGui = Instance.new("ScreenGui")
-- ScreenGui.Name = 'CPUSaver'
-- ScreenGui.Enabled = false
-- ScreenGui.Parent = CoreGui

-- local TextLabel = Instance.new("TextLabel")
-- TextLabel.BackgroundColor3 = Color3.new(0, 0, 0)
-- TextLabel.TextColor3 = Color3.new(1, 1, 1)
-- TextLabel.TextStrokeTransparency = 1
-- TextLabel.AnchorPoint = Vector2.new(.5, .5)
-- TextLabel.Position = UDim2.fromScale(.5, .5)
-- TextLabel.Size = UDim2.fromScale(1.5, 1.5)
-- TextLabel.Font = Enum.Font.RobotoMono
-- TextLabel.TextSize = 24
-- TextLabel.Text = "GPU Saver is enabled.\n\nPress any key to disable manually.\nTo disable this entirely, run _G.DisableGPUSaver()"
-- TextLabel.Parent = ScreenGui

-- local Connections = {}
-- local Signals = {RunService.Stepped, RunService.RenderStepped}

-- local cansetfpscap = type(setfpscap) == 'function'
-- local cangetconnections = type(getconnections) == 'function'

-- local function pause()
-- 	if cansetfpscap then
-- 		setfpscap(15)
-- 	end
-- 	ScreenGui.Enabled = true
-- 	RunService:Set3dRenderingEnabled(false)
-- 	if cangetconnections then
-- 		for _, x in pairs(Signals) do
-- 			for _, v in pairs(getconnections(x)) do
-- 				v:Disable()
-- 				table.insert(Connections, v)
-- 			end
-- 		end
-- 	end
-- 	paused = true
-- end

-- local function resume()
-- 	if cansetfpscap then
-- 		setfpscap(1000)
-- 	end
-- 	ScreenGui.Enabled = false
-- 	RunService:Set3dRenderingEnabled(true)
-- 	if cangetconnections then
-- 		for i, v in pairs(Connections) do
-- 			v:Enable()
-- 			Connections[i] = nil
-- 		end
-- 	end
-- 	paused = false
-- end

-- local con0 = UserInputService.WindowFocusReleased:Connect(pause)
-- local con1 = UserInputService.WindowFocused:Connect(resume)
-- local con2 = UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
-- 	if paused and input.UserInputState == Enum.UserInputState.Begin and input.UserInputType == Enum.UserInputType.Keyboard then
-- 		resume()
-- 	end
-- end)

-- --- Disable the GPU saver.
-- --- @type function
-- _G.DisableGPUSaver = function()
-- 	resume()
-- 	con0:Disconnect()
-- 	con1:Disconnect()
-- 	con2:Disconnect()
-- end

-- task.delay(5, function()
--     _G.DisableGPUSaver()
-- end)


