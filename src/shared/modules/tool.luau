local CollectionService = game:GetService("CollectionService")

local toolModule = {}

function toolModule.setupTool(tag:string, func)
    for _, part:Tool in CollectionService:GetTagged(tag) do 
        part.Activated:Connect(function()
            func(part)
        end)
    end

    CollectionService:GetInstanceAddedSignal(tag):Connect(function(part:Tool)
        part.Activated:Connect(function()
            func(part)  
        end)
    end)
    
end

return toolModule