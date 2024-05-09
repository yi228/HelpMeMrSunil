local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Sunil = workspace:WaitForChild("Sunil")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("RemoteEvent")


-- Set Sunil's PrimaryPart to a valid part
local function SetPrimaryPart()
	local PrimaryPart = Sunil.PrimaryPart
	if not PrimaryPart or not PrimaryPart:IsA("BasePart") then
		for _, Part in ipairs(Sunil:GetDescendants()) do
			if Part:IsA("BasePart") then
				Sunil.PrimaryPart = Part
				break
			end
		end
	end
end
SetPrimaryPart() -- Call the function to set the PrimaryPart initially

-- Move Sunil based on user input
local moveDirection = Vector3.new(0, 0, 0)

local function UpdateMoveDirection()
	moveDirection = Vector3.new(0, 0, 0)
	local mobileDirection=game:GetService("ReplicatedStorage").Dir.Value
	if UserInputService:IsKeyDown(Enum.KeyCode.Up) or mobileDirection==1 then
		moveDirection = moveDirection + Vector3.new(0, 0, -1)
	end
	if UserInputService:IsKeyDown(Enum.KeyCode.Down) or mobileDirection==2 then
		moveDirection = moveDirection + Vector3.new(0, 0, 1)
	end
	if UserInputService:IsKeyDown(Enum.KeyCode.Left) or mobileDirection==3 then
		moveDirection = moveDirection + Vector3.new(-1, 0, 0)
	end
	if UserInputService:IsKeyDown(Enum.KeyCode.Right) or mobileDirection==4 then
		moveDirection = moveDirection + Vector3.new(1, 0, 0)
	end

	-- remote event 호출
	local pos = Sunil["Meshes/선일맨_Shape_6"].CFrame.Position
	local cfBullet1 = Sunil["Meshes/선일맨_Shape_3"].CFrame
	local cfBullet2 = Sunil["Meshes/선일맨_Shape_8"].CFrame
	if pos ~= nil then
		--remoteEvent:FireServer(pos, cfBullet1, cfBullet2)
	end

end

-- Connect the RunService loop to the MoveSunil function
local speed=50
local lastTick = 0
local function MoveSunil()
	local now = tick()
	local dt = now - lastTick
	lastTick = now
	local velocity = moveDirection * speed -- adjust the speed as needed
	local newPos = Sunil:GetPrimaryPartCFrame().Position + velocity * dt
	Sunil:SetPrimaryPartCFrame(CFrame.new(newPos))
end
RunService.Heartbeat:Connect(function()
	if workspace.Pause.Value == false then
		UpdateMoveDirection()
		MoveSunil()
	end
end)