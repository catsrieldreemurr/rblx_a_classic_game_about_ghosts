local ReplicatedStorage=  game:GetService("ReplicatedStorage")
local toolModule = require(ReplicatedStorage.Shared.modules.tool)

-- Helper Functions 
function SetupProxmimityPrompt(partToAttach:Model)
    local newProximityPrompt = Instance.new('ProximityPrompt')

    newProximityPrompt:AddTag("ghostbook_trigger")
    newProximityPrompt.Parent = partToAttach.PrimaryPart
    newProximityPrompt.ObjectText = "Ghost Book"
    newProximityPrompt.ActionText = "Pick up Ghost Book"
    newProximityPrompt.MaxActivationDistance = 5;
    newProximityPrompt.RequiresLineOfSight = false
end

function GhostBookTool(part:Tool)
    local BookClone = ReplicatedStorage.Models.Book:Clone()
    local Handle = part:FindFirstChild("Handle")
    
    BookClone.Parent = workspace
    SetupProxmimityPrompt(BookClone)

    BookClone:MoveTo(Handle.Position)
    part:Destroy()
end

toolModule.setupTool("ghostbook_tool", GhostBookTool)
