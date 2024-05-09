local replicatedStorage = game:GetService("ReplicatedStorage")
local dataLoadEvent = replicatedStorage:WaitForChild("DataLoadEvent")

local plr = game.Players.LocalPlayer
script.Parent.Parent.Parent.Parent = plr.PlayerGui
script.Parent.Parent.Visible = true

local HpBar = script.Parent.Parent.Parent.Parent:WaitForChild("Health")
HpBar.Frame.Visible = false

local Ingame = script.Parent.Parent.Parent:WaitForChild("Ingame")
Ingame.Visible = false

local Stage = script.Parent.Parent.Parent:WaitForChild("Stage")
Stage.Visible = false

local char = plr.Character or plr.CharacterAdded:Wait()

repeat wait() until game.Lighting.Blur ~= nil
game.Lighting.Blur.Size = 20

script.Parent.MouseButton1Click:Connect(function()
	local player = game:GetService("Players").LocalPlayer
	--local sunil = replicatedStorage.Sunil:Clone()
	--sunil.Parent = workspace
	if player ~= nil then
		local character = player.Character or player.CharacterAdded:Wait() -- get the player's character or wait for it to load
		local newParent = workspace:WaitForChild("Sunil") -- set the new parent object, such as another part or model in the workspace

		character.Parent = newParent -- set the new parent of the character
	end

	wait(0.5)

	--local value = game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "'s StageClearInfo").Value
	--if(value ~= nil) then
	--	workspace.Stage.Value = value
	--else
	--	-- db에 프로필 없어서 만들어주기
	--end
	local name = game.Players.LocalPlayer.Name .. "'s StageClearInfo"
	dataLoadEvent:FireServer(name)
	print("want make!")
	script.Parent.Parent.Visible = false
	Stage.Visible = true
end)

wait(3)