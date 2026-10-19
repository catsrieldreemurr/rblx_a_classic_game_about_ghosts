local CollectionService = game:GetService("CollectionService")

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
for _, part:Tool in CollectionService:GetTagged("flashlight") do 
    part.Activated:Connect(function()
        flashlightToggle(part)
    end)
end

CollectionService:GetInstanceAddedSignal("flashlight"):Connect(function(part:Tool)
    part.Activated:Connect(function()
        flashlightToggle(part)   
    end)
end)
