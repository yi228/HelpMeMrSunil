game:GetService("RunService").Heartbeat:Connect(function()
	script.Parent.Text = workspace.BulletCount.Value
end)