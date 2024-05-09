local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character
local Humanoid = Character:WaitForChild("Humanoid")
local Filler = script.Parent.Frame.Health.Frame
Filler:TweenSize(UDim2.new(Humanoid.Health/Humanoid.MaxHealth, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
Humanoid.HealthChanged:Connect(function()
	Filler:TweenSize(UDim2.new(Humanoid.Health/Humanoid.MaxHealth, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)
end)