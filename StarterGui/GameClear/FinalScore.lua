game.Workspace.BulletCount.Changed:Connect(function()
	script.Parent.Text = game.Workspace.BulletCount.Value
end)