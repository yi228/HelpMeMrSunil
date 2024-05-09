local plr = game.Players.LocalPlayer
script.Parent.Parent.Parent.Parent = plr.PlayerGui

local char = plr.Character or plr.CharacterAdded:Wait()

local Ingame = script.Parent.Parent.Parent:WaitForChild("Ingame")
local HpBar = script.Parent.Parent.Parent.Parent:WaitForChild("Health"):WaitForChild("Frame")
local Main = script.Parent.Parent.Parent:WaitForChild("Main")

-- 이미지 버튼을 클릭할 때 실행되는 함수를 정의합니다.
local function onPauseButtonClick()
	for i, v in pairs(game.Workspace:GetChildren()) do
		if v.Name == "Spaceship" or v.Name == "Spaceship2" or v.Name == "Boss" then
			if v.Name == "Boss" then
				workspace.BossDown.Value = true
			end
			v:Destroy()
		end
	end
	
	plr.Character.Humanoid.Health = 100

	script.Parent.Parent.Visible = false
	Ingame.Visible = false
	HpBar.Visible = false
	Main.Visible = true
	game.Lighting.Blur.Size = 20
end

-- 이미지 버튼을 만듭니다.
local pauseButton = script.Parent
pauseButton.MouseButton1Click:Connect(onPauseButtonClick)