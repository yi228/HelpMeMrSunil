game:GetService("RunService").Heartbeat:Connect(function()
	script.Parent.Text = workspace.curStage.Value -1
end)