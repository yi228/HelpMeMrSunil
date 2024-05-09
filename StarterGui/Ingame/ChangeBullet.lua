local isMobilePlatform = game:GetService("UserInputService").TouchEnabled
local bulletModel=game:GetService("Workspace"):WaitForChild("BulletModel")

--if isMobilePlatform then
--	script.Parent.Visible=true
--else
--	script.Parent.Visible=false
--end
local max=1
script.Parent.MouseButton1Click	:Connect(function()
	if isMobilePlatform then
	local stage=game:GetService("Workspace"):WaitForChild("Stage")
	local stageVal=stage.Value
	if stageVal==1 then
		max=1
	elseif stageVal<3 then			
		max=2
	elseif stageVal<5 then			
		max=3
	else 			
		max=4
	end 
	print (bulletModel.Value)
	bulletModel.Value=bulletModel.Value+1
	bulletModel.Value=bulletModel.Value%max
	
	
	
	
	
	end
	
	end
)