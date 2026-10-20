local ReplicatedStorage=  game:GetService("ReplicatedStorage")
local toolModule = require(ReplicatedStorage.Shared.modules.tool)

function CameraToolSnap(part:Tool)
    print("Camera")
end

toolModule.setupTool("camera_tool", CameraToolSnap)
