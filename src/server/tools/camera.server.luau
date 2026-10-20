local ReplicatedStorage=  game:GetService("ReplicatedStorage")
local toolModule = require(ReplicatedStorage.Shared.modules.tool)

function CameraToolSnap()
    print("snapped a pic lolol hii")
end

toolModule.setupTool("camera_tool", CameraToolSnap)
