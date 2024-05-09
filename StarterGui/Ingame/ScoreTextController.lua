script.Parent.Text = workspace.BulletCount.Value

local stageClear = script.Parent.Parent.Parent:WaitForChild("StageClear")
local gameClear = script.Parent.Parent.Parent:WaitForChild("GameClear")
local HpBar = script.Parent.Parent.Parent.Parent:WaitForChild("Health")
local Ingame = script.Parent.Parent.Parent:WaitForChild("Ingame")
local safeUnlock = script.Parent.Parent.Parent:WaitForChild("StageClear"):WaitForChild("SafeUnlock")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local pauseEvent = ReplicatedStorage:WaitForChild("PauseEvent")
local dataManagerRemote = ReplicatedStorage:WaitForChild("DataManagerRemote")
local player = game.Players.LocalPlayer


-- 값이 변경될 때마다 TextLabel 업데이트
workspace.BulletCount.Changed:Connect(function(newScore)
	script.Parent.Text = workspace.BulletCount.Value
	
	--stage clear 화면 띄우기 용 테스트 코드
	if workspace.BulletCount.Value>0 and ((workspace.curStage.Value<=3 and workspace.BulletCount.Value % 10 ==0) or (workspace.curStage.Value>=4 and workspace.BulletCount.Value % 20 ==0) or (workspace.curStage.Value == 6 and workspace.BossDown.Value == true)) then
		workspace.Pause.Value = true
		workspace.Stage.Value += 1
		workspace.curStage.Value += 1
		
		-- 데이터 베이스에 정보 저장 하는 부분
		local stageInfo = game.Workspace:FindFirstChild(player.Name .. "'s StageClearInfo")
		if stageInfo.Value < 6 then
			stageInfo.Value += 1
		else
			stageInfo.Value = 6
		end
		print(stageInfo.Value .. "저장")
		dataManagerRemote:FireServer(stageInfo.Value)
		-- 여기까지 데이터 베이스 저장 부분
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "Spaceship" or v.Name == "Spaceship2" or v.Name == "Boss" then
				v:Destroy()
			end
		end
		
		
		if workspace.curStage.Value % 2 == 0 then
			safeUnlock.Visible = true

			if workspace.curStage.Value == 2 then
				safeUnlock["SafeImage 1"].Visible = true
				safeUnlock["SafeName 1"].Visible = true

				safeUnlock["SafeImage 2"].Visible = false
				safeUnlock["SafeName 2"].Visible = false
				safeUnlock["SafeImage 3"].Visible = false
				safeUnlock["SafeName 3"].Visible = false
			elseif workspace.curStage.Value==4 then
				safeUnlock["SafeImage 2"].Visible = true
				safeUnlock["SafeName 2"].Visible = true

				safeUnlock["SafeImage 1"].Visible = false
				safeUnlock["SafeName 1"].Visible = false
				safeUnlock["SafeImage 3"].Visible = false
				safeUnlock["SafeName 3"].Visible = false
			elseif workspace.curStage.Value==6 then
				safeUnlock["SafeImage 3"].Visible = true
				safeUnlock["SafeName 3"].Visible = true

				safeUnlock["SafeImage 2"].Visible = false
				safeUnlock["SafeName 2"].Visible = false
				safeUnlock["SafeImage 1"].Visible = false
				safeUnlock["SafeName 1"].Visible = false
			end
		end
		
		game.Lighting.Blur.Size = 20
		HpBar.Frame.Visible = false
		Ingame.Visible = false
		if workspace.BossDown.Value == false then
			stageClear.Visible = true
		else
			gameClear.Visible = true
		end
	end
end)