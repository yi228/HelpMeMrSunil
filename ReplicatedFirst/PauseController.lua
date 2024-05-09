local function movePause(value)
	for i, v in pairs(game.Workspace:GetChildren()) do
		if v.Name == "Spaceship" or v.Name == "Spaceship2" then
			v.HumanoidRootPart.Anchored = value
		end
	end
end

game:GetService("RunService").Heartbeat:Connect(function()
	if workspace.Pause.Value==true then
		movePause(true)
	else
		movePause(false)
	end	
end)
