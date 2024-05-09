local plr = game.Players.LocalPlayer
script.Parent.Parent.Parent.Parent = plr.PlayerGui

local char = plr.Character or plr.CharacterAdded:Wait()

local Menu = script.Parent.Parent.Parent:WaitForChild("PauseMenu")
local HpBar = script.Parent.Parent.Parent.Parent:WaitForChild("Health")
local Ingame = script.Parent.Parent.Parent:WaitForChild("Ingame")

local parts = workspace:GetDescendants()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local pauseEvent = ReplicatedStorage:WaitForChild("PauseEvent")

-- Connect the script to the button's Click event
script.Parent.MouseButton1Click:Connect(function()
	workspace.Pause.Value = true
	pauseEvent:FireServer("t")
	Menu.Visible = true
end)
