
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local stageInfoEvent = ReplicatedStorage:WaitForChild("StageInfoEvent")

local DataManager = require(game.ServerScriptService.DataManager)

local function UpdateStageInfo(player, stageInfo)
	print(stageInfo)
	local player = game.Players.PlayerAdded:Wait()
	local Data = DataManager:GetData(player)

	while not Data do
		wait(1)
		Data = DataManager:GetData(player)
	end

	DataManager:UpdateData(player, "StageClear", stageInfo)
	DataManager:SaveData(player)
	print("save")

end

stageInfoEvent.OnServerEvent:Connect(UpdateStageInfo)