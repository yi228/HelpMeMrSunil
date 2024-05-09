local plr = game.Players.LocalPlayer

local HpBar = script.Parent.Parent.Parent.Parent:WaitForChild("Health")

local Ingame = script.Parent.Parent.Parent:WaitForChild("Ingame")

local char = plr.Character or plr.CharacterAdded:Wait()

script.Parent.MouseButton1Click:Connect(function()
	game.Lighting.Blur.Size = 0

	HpBar.Frame.Visible = true

	Ingame.Visible = true

	script.Parent.Parent.Visible = false

	---- 점수 텍스트 활성화
	--SpawnScoreTextLabel()
	-- 스테이지에 들어왔다는 flag 값 활성화
	workspace.IsInStage.Value = true
	workspace.Pause.Value = false
	workspace.BossDown.Value = false
	workspace.curStage.Value = 1
	--while workspace.Pause.Value == false do
	--	pauseEvent:FireServer("f")
	--	wait(5)
	--end
end)

wait(3)