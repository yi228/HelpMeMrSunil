local replicatedStorage = game:GetService("ReplicatedStorage")
local direction = replicatedStorage:WaitForChild("Dir")
local isMobilePlatform = game:GetService("UserInputService").TouchEnabled
--if isMobilePlatform then
--	script.Parent.Visible=true
--else
--	script.Parent.Visible=false
--end
script.Parent.MouseButton1Down:Connect(function()
	direction.Value=3

end)
script.Parent.MouseButton1Up:Connect(function()
	direction.Value=0

end)
script.Parent.MouseEnter:Connect(function()
	direction.Value=3

end)
script.Parent.MouseLeave:Connect(function()
	direction.Value=0
end)
