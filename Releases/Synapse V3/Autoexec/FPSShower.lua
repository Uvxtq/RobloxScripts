repeat task.wait() until game:IsLoaded() task.wait(2)
local ScreenGui = Instance.new("ScreenGui")
local Fps = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

gethui(ScreenGui)
gethui(Fps)

Fps.Name = "Fps"
Fps.Parent = ScreenGui
Fps.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Fps.BackgroundTransparency = 1.000
Fps.Position = UDim2.new(0.786138654, 0, 0, 0)
Fps.Size = UDim2.new(0, 125, 0, 25)
Fps.Font = Enum.Font.SourceSans
Fps.TextColor3 = Color3.fromRGB(255, 255, 255)
Fps.TextScaled = true
Fps.TextSize = 14.000
Fps.TextWrapped = true

-- Scripts:

local script = Instance.new('LocalScript', Fps)

gethui(script)

local RunService = game:GetService("RunService")
while true do task.wait(0.1)
    script.Parent.Text = ("FPS: "..tostring(math.floor(1/RunService.RenderStepped:Wait())))
end
