local DataManager = require(game.ServerScriptService.DataManager)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local dataLoadEvent = ReplicatedStorage:WaitForChild("DataLoadEvent")

local function OnPlayerAdded(player, name)
	local Data = DataManager:GetData(player)
	while not Data do
		wait(1)
		Data = DataManager:GetData(player)
	end

	local intValue = Instance.new("IntValue")
	intValue.Value = Data.StageClear
	if intValue.Value==0 then
		intValue.Value = 1
	end
	intValue.Name = player.Name .. "'s StageClearInfo"
	intValue.Parent = game.Workspace
	workspace.Stage.Value = intValue.Value
	--workspace.Stage.Value = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "'s StageClearInfo").Value
end

--print(Data.StageClear)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- 서버 스크립트에서도 같은 이벤트 객체를 생성
local dataManagerRemote = ReplicatedStorage:WaitForChild("DataManagerRemote")

-- 새 블럭(Part) 생성 (서버에서 블럭을 생성)
local function UpdateStageInfo(player, value)
	local stageInfo = game.Workspace:FindFirstChild(player.Name .. "'s StageClearInfo")

	if stageInfo then
		stageInfo.Value = value
		DataManager:UpdateData(player, "StageClear", stageInfo.Value)
		DataManager:SaveData(player)
		print(stageInfo.Value.."db에 저장")
	else
		print("스테이지 클리어 정보를 찾을 수 없습니다.")
	end
end


dataManagerRemote.OnServerEvent:Connect(UpdateStageInfo)
dataLoadEvent.OnServerEvent:Connect(OnPlayerAdded)

