local replicatedStorage = game:GetService("ReplicatedStorage")
local shoot = replicatedStorage:WaitForChild("ShootBullet")
local isMobilePlatform = game:GetService("UserInputService").TouchEnabled
--if isMobilePlatform then
--	script.Parent.Visible=true
--else
--	script.Parent.Visible=false
--end

script.Parent.MouseButton1Down:Connect(function()
	shoot.Value=1

end)
script.Parent.MouseLeave:Connect(function()
	shoot.Value=0

end)
script.Parent.MouseLeave:Connect(function()
	shoot.Value=0
end)