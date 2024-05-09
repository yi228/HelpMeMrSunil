local plr = game.Players.LocalPlayer
script.Parent.Parent.Parent.Parent = plr.PlayerGui

local char = plr.Character or plr.CharacterAdded:Wait()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local pauseEvent = ReplicatedStorage:WaitForChild("PauseEvent")

-- 이미지 버튼을 클릭할 때 실행되는 함수를 정의합니다.
local function onPauseButtonClick()
	script.Parent.Parent.Visible = false
	workspace.Pause.Value = false
	pauseEvent:FireServer("f")
end

-- 이미지 버튼을 만듭니다.
local pauseButton = script.Parent
pauseButton.MouseButton1Click:Connect(onPauseButtonClick)