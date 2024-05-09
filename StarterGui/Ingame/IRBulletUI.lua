game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)

	if input.KeyCode == Enum.KeyCode.Q and workspace.Pause.Value == false and not gameProcessed then
		script.Parent.Visible=false
	end
	if workspace.Stage.Value > 1 and input.KeyCode == Enum.KeyCode.W and workspace.Pause.Value == false and not gameProcessed then
		script.Parent.Visible=true
	end
	if workspace.Stage.Value > 3 and input.KeyCode == Enum.KeyCode.E and workspace.Pause.Value == false and not gameProcessed then
		script.Parent.Visible=false
	end
	if workspace.Stage.Value > 5 and input.KeyCode == Enum.KeyCode.R and workspace.Pause.Value == false and not gameProcessed then
		script.Parent.Visible=false
	end
end)

local isMobilePlatform = game:GetService("UserInputService").TouchEnabled
local function uiChange()
	local bulletVal = game:GetService("Workspace"):WaitForChild("BulletModel")
	if bulletVal.Value==1 then
		script.Parent.Visible=true
	else
		script.Parent.Visible=false
	end	
end

if isMobilePlatform then	
	game:GetService("RunService").RenderStepped:Connect(uiChange)
end