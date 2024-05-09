local player = game.Players.LocalPlayer
game:GetService("RunService").Heartbeat:Connect(function()
	if player.Character:WaitForChild("Humanoid").Health <=0 then
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "Spaceship" or v.Name == "Spaceship2" or v.Name == "Boss" then
				if v.Name == "Boss" then
					workspace.BossDown.Value = true
				end
				v:Destroy()
			end
		end
		player.Character:WaitForChild("Humanoid").Health=100
		workspace.IsInStage.Value = false
		script.Parent.Visible = true
		script.Parent.Parent:WaitForChild("Ingame").Visible = false
		script.Parent.Parent.Parent:WaitForChild("Health"):WaitForChild("Frame").Visible = false
		workspace.Pause.Value = true
	end
end)