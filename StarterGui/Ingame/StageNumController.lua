workspace.curStage.Changed:Connect(function()
	script.Parent.Text = workspace.curStage.Value
end)