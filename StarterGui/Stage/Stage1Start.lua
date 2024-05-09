local plr = game.Players.LocalPlayer
script.Parent.Parent.Parent.Parent.Parent = plr.PlayerGui

local char = plr.Character or plr.CharacterAdded:Wait()

local HpBar = script.Parent.Parent.Parent.Parent.Parent:WaitForChild("Health")

local Ingame = script.Parent.Parent.Parent.Parent:WaitForChild("Ingame")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

function SpawnScoreTextLabel()-- ScreenGui 생성
	local screenGui = Instance.new("ScreenGui")
	screenGui.Parent.Parent = game.Players.LocalPlayer.PlayerGui

	-- TextLabel 생성
	local textLabel = Instance.new("TextLabel")
	textLabel.Parent.Parent = screenGui
	textLabel.Position = UDim2.new(1, -210, 1, -60) -- 우측 하단으로 위치 조정
	textLabel.Size = UDim2.new(0, 100, 0, 50)
	textLabel.Text = "Score: " .. workspace.BulletCount.Value
	textLabel.TextSize = 15

	-- 값이 변경될 때마다 TextLabel 업데이트
	workspace.BulletCount.Changed:Connect(function(newScore)
		textLabel.Text = "Score: " .. workspace.BulletCount.Value
	end)

end

--local spaceshipSpawnEvent = ReplicatedStorage:WaitForChild("SpaceshipSpawnEvent")
local pauseEvent = ReplicatedStorage:WaitForChild("PauseEvent")

script.Parent.MouseButton1Click:Connect(function()
	-- 플레이어 투명화
	for _, part in pairs(char:GetDescendants()) do
		if part:IsA("BasePart") then
			part.Transparency = 1
		end
	end

	wait(0.5)
	game.Lighting.Blur.Size = 0
	HpBar.Frame.Visible = true
	Ingame.Visible = true
	script.Parent.Parent.Parent.Visible = false

	plr.Character.Humanoid.Health = 100
	
	---- 점수 텍스트 활성화
	--SpawnScoreTextLabel()
	-- 스테이지에 들어왔다는 flag 값 활성화
	workspace.IsInStage.Value = true
	workspace.Pause.Value = false
	workspace.curStage.Value = 1
	--while workspace.Pause.Value == false do
	--	pauseEvent:FireServer("f")
	--	wait(5)
	--end
end)

wait(3)