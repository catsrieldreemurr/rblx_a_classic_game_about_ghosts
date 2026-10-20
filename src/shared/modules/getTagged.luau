local CollectionService = game:GetService("CollectionService")

local taggedModule = {}

function taggedModule.attachFunctionToTag(tag:string, func)
    for _, part:Tool in CollectionService:GetTagged(tag) do 
        func(part)
    end

    CollectionService:GetInstanceAddedSignal(tag):Connect(function(part:Tool)
        func(part)
    end)
    
end

return taggedModule