local last = 0
local cur
local targetVec


local function move()
	for i, v in pairs(game.Workspace:GetChildren()) do
		if v.Name == "Spaceship"then
			v.mob:MoveTo(game.Workspace:WaitForChild("Sunil")["Meshes/선일맨_Shape_6"].CFrame.Position)
		end
			
		if v.Name =="Spaceship2" then
			cur = tick()
			v.mob:MoveTo(game.Workspace:WaitForChild("Target").CFrame.Position)
			
			if cur - last>=10 then
				last = cur
				--print("spaceship Destoryed")
				--v:Destroy()
			end
		end
		
		if v.Name == "Boss" then
			targetVec = game.Workspace:WaitForChild("Sunil")["Meshes/선일맨_Shape_5"].CFrame.Position
			--y축 회전 제한
			local part = v:WaitForChild("BossMesh")
			local curOrientation = part.Orientation
			
			part.Orientation = Vector3.new(curOrientation.X, 90, curOrientation.Z)
			
			v.mob:MoveTo(Vector3.new(targetVec.X, 71.7, -470))
		end
	end
end

game:GetService("RunService").Heartbeat:Connect(function()
	move()
end)
