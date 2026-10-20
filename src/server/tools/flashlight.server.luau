
local ReplicatedStorage=  game:GetService("ReplicatedStorage")
local toolModule = require(ReplicatedStorage.Shared.modules.tool)

-- Helper Functions
function setIsEnabled(part:Tool, bool:boolean)
    part:SetAttribute("enabled", bool)
end

-- Tool Function
function flashlightToggle(part:Tool)
    local state = part:GetAttribute("enabled")
    print(state)
    local Handle = part:FindFirstChild("Handle")
    local lightPart:SpotLight

    if Handle ~= nil then
        lightPart = Handle:FindFirstChild("SpotLight")
    end

    local newState = not state
    lightPart.Enabled = newState
    setIsEnabled(part, newState)

    Handle:FindFirstChildWhichIsA("Sound"):Play()
end

-- Collection Service stuff 
toolModule.setupTool("flashlight", flashlightToggle)