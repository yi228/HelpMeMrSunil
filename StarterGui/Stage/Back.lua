local plr = game.Players.LocalPlayer
script.Parent.Parent.Parent.Parent = plr.PlayerGui

local char = plr.Character or plr.CharacterAdded:Wait()

local Main = script.Parent.Parent.Parent:WaitForChild("Main")

script.Parent.MouseButton1Click:Connect(function()
		wait(0.5)
		
		Main.Visible = true
		script.Parent.Parent.Visible = false

end)

wait(3)