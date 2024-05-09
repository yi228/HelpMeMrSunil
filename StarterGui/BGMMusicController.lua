local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui

-- PlayGui UI 확인
local playGui = playerGui:FindFirstChild("PlayGui")
local inGameFrame = playGui.Ingame

local button = script.Parent
local on = script.Parent:WaitForChild("on")
local off = script.Parent:WaitForChild("off")

local Sound = Instance.new("Sound", script)

Sound.Volume = 0.3 -- 볼륨

musics = {"rbxassetid://9048375035",
	"rbxassetid://1848090337"
}

function playLobbyMusic()
	Sound:Stop()
	Sound.SoundId = musics[1]
	Sound:Play()
end

function playGameMusic()
	Sound:Stop()
	Sound.SoundId = musics[2]
	Sound:Play()
end

button.MouseButton1Click:Connect(function(plr)
	if on.Visible == true then -- 음악 켜져있었음
		off.Visible = true
		on.Visible = false
		Sound:Pause() -- 일시정지
	else -- 음악 꺼져있었음
		off.Visible = false
		on.Visible = true
		Sound:Resume() -- 다시 재생
	end
end)

-- 소리 끝나도 다시 재생
Sound.Ended:Connect(function()
	if on.Visible == true and inGameFrame.Visible == true then
		playGameMusic()
	else if on.Visible == true and inGameFrame.Visible == false then
			playLobbyMusic()
		end
	end
end)

local function onVisibleChanged()
	if inGameFrame.Visible == true then
		playGameMusic()
	else if inGameFrame.Visible == false then
			playLobbyMusic()
		end
	end
end

inGameFrame:GetPropertyChangedSignal("Visible"):Connect(onVisibleChanged)

playLobbyMusic()