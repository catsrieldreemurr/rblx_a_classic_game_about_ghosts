local ReplicatedStorage=  game:GetService("ReplicatedStorage")
local taggedModule = require(ReplicatedStorage.Shared.modules.getTagged)

function ghostbook_trigger(part:ProximityPrompt)
    part.Triggered:Connect(function(plr: Player)
        print(plr.Name)

        local partToDelete = part:FindFirstAncestorWhichIsA("Model")
        if partToDelete ~= nil then
            local newTool = ReplicatedStorage.Tools["Ghost Book"]:Clone()
            newTool.Parent = plr.Backpack
            partToDelete:Destroy()
        end 
    end)
end

taggedModule.attachFunctionToTag("ghostbook_trigger", ghostbook_trigger)