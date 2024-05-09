local plr = game.Players.LocalPlayer
script.Parent.Parent.Parent.Parent = plr.PlayerGui

local char = plr.Character or plr.CharacterAdded:Wait()
local HpBar = script.Parent.Parent.Parent.Parent:WaitForChild("Health")
local Ingame = script.Parent.Parent.Parent:WaitForChild("Ingame")
local safeUnlock = script.Parent.Parent:WaitForChild("SafeUnlock")

script.Parent.MouseButton1Click:Connect(function()
	game.Lighting.Blur.Size = 0
	HpBar.Frame.Visible = true
	Ingame.Visible = true
	script.Parent.Parent:WaitForChild("SafeList").Visible = true
	script.Parent.Parent.Visible = false
	
	workspace.Pause.Value = false
	
	plr.Character.Humanoid.Health = 100
	
	if workspace.curStage.Value == 6 then
		workspace.BossSpawn.Value = not workspace.BossSpawn.Value
		workspace.InBossStage.Value = true
	end
end)

wait(3)