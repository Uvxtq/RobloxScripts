getgenv().fence = {
    Enabled = true,
    sets = {
        ["MaxWait"] = 10,
        ["MinWait"]= 1,
    },
    Keys = {
        ['A'] = 0x41,
        ['B'] = 0x42,
        ['C'] = 0x43,
        ['D'] = 0x44,
        ['E'] = 0x45,
        ['F'] = 0x46,
        ['G'] = 0x47,
        ['H'] = 0x48,
        ['I'] = 0x49,
        ['J'] = 0x4A,
        ['K'] = 0x4B,
        ['L'] = 0x4C,
        ['M'] = 0x4D,
        ['N'] = 0x4E,
        ['O'] = 0x4F,
        ['P'] = 0x50,
        ['Q'] = 0x51,
        ['R'] = 0x52,
        ['S'] = 0x53,
        ['T'] = 0x54,
        ['U'] = 0x55,
        ['V'] = 0x56,
        ['W'] = 0x57,
        ['X'] = 0x58,
        ['Y'] = 0x59,
        ['Z'] = 0x5A,
        [' '] = 0x20,
    },
}

local LocalPlayer = game:GetService("Players").LocalPlayer
local NewRepeat = 0

function Type(Text)
    local Key = fence.Keys[Text]
    keyclick(Key)
    task.wait(0.14)
end

function GetLetters()
    for _, object in next, getgc() do
        if type(object) == 'function' and getfenv(object).script == LocalPlayer.PlayerGui.LocalMain then
            local Constants = debug.getconstants(object)
            if Constants[8] == 'idXTO3JVlV0CBTmiSbaQ' then
                return debug.getupvalue(object, 4)
            end
        end
    end
end

while true do task.wait()
    local Letters = GetLetters()

    if Letters then
        for _, Letter in next, Letters do
            Type(Letter)
        end
    end
end
