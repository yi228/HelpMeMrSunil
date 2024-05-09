local RunService = game:GetService("RunService")

function updateCamera()
	local camera = workspace.CurrentCamera
	camera.CameraType = Enum.CameraType.Scriptable
	camera.CFrame = workspace.TopViewCamera.CFrame
end

RunService.RenderStepped:Connect(updateCamera)

