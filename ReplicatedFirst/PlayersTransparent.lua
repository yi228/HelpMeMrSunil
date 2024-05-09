game:GetService("RunService").Heartbeat:Connect(function()
	for i, v in pairs(game.Players:GetChildren()) do
		if v.character ~= nil then
			for _, part in pairs(v.character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.Transparency = 1
				end
			end
		end
	end
end)
