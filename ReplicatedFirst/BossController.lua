local ReplicatedStorage = game:GetService("ReplicatedStorage")
local sunil = game.Workspace:WaitForChild("Sunil")
local boss = ReplicatedStorage:WaitForChild("Boss")
local bullet = ReplicatedStorage.BossBullet

local walkspeed = 20 --몬스터의 속도 
local maxhealth = 1000 --몬스터의 최대 HP
local health = 1000 --몬스터의 HP

local damage
local damageCool = 0.3 --플레이어에게 데미지를 입힌 후, 다시 데미지 입히기전 쿨타임

local lastFired = 0

--local pos = sunil["Meshes/선일맨_Shape_6"].CFrame.Position

local function AddEventHandler(part)
	part.Touched:Connect(function(hit)
		if hit.Parent ~= nil and hit.Parent.Name == "Sunil" then
			local h = hit.Parent:FindFirstChild("Humanoid")
			if h and h.Health > 0 then --조건 확인
				h:TakeDamage(damage)
			end
			part:Destroy()
		end
	end)
end

workspace.BossSpawn.Changed:Connect(function(deltaTime)	
	if workspace.Pause.Value == false then
		local position1 = Vector3.new(math.random(-250, -150), 71.7, -490)
		local bossInstance = boss:Clone()
		bossInstance:SetPrimaryPartCFrame(CFrame.new(position1))

		--Monster
		local mob = bossInstance
		local humanoid = mob.mob

		humanoid.WalkSpeed = walkspeed --휴머노이드의 스피드 정하기
		humanoid.MaxHealth = maxhealth --휴머노이드의 MAX HP 정하기
		humanoid.Health = health --휴머노이드의 HP 정하기

		bossInstance.Parent = game.Workspace
		wait(1.5)
		
		game:GetService("RunService").Heartbeat:Connect(function()
			if workspace.Pause.Value==false and workspace.InBossStage.Value==true and workspace.BossDown.Value == false then
				local currentTime = tick()

				if currentTime - lastFired < damageCool then -- check if the cooldown period has passed
					return
				end
				
				local black = math.random(1, 10)
				
				lastFired = currentTime

				local bulletSpeed = 250
				local bulletInstance = bullet:Clone()
				if bossInstance:WaitForChild("BossMesh") ~= nil then
					bulletInstance.Parent = game.Workspace
					bulletInstance.CFrame = bossInstance:WaitForChild("BossMesh").CFrame
					bulletInstance.Position = Vector3.new(bossInstance:WaitForChild("BossMesh").Position.X, 
						bossInstance:WaitForChild("BossMesh").Position.Y, 
						bossInstance:WaitForChild("BossMesh").Position.Z+15)
					AddEventHandler(bulletInstance)
				end
				
				if black ~= 10 then
					damage = 15
					local distance = 100
					local traveled = 0
					while traveled < distance do
						local direction = Vector3.new(0, 0, 1) * bulletSpeed * 0.016

						bulletInstance.Touched:Connect(function(hit)
							if hit.Parent.Parent.Name == "Sunil" then
								local h = hit.Parent:FindFirstChild("Humanoid")
								if h and h.Health > 0 then --조건 확인
									print("boss hit")
									h:TakeDamage(damage) --플레이어에게 데미지 입힘 
									bulletInstance:Destroy()
								end
							end
						end)

						bulletInstance.Position = bulletInstance.Position + direction

						traveled = traveled + bulletSpeed * 0.016
						wait(0.016)

					end
				end
				
				if black == 10 then
					damage = 90
					bulletInstance.Color = Color3.fromRGB(0, 0, 0)
					local distance = 100
					local traveled = 0
					while traveled < distance do
						local direction = Vector3.new(0, 0, 1) * bulletSpeed * 0.016

						bulletInstance.Touched:Connect(function(hit)
							if hit.Parent.Parent.Name == "Sunil" then
								local h = hit.Parent:FindFirstChild("Humanoid")
								if h and h.Health > 0 then --조건 확인
									h:TakeDamage(damage) --플레이어에게 데미지 입힘 
									bulletInstance:Destroy()
								end
							end
						end)

						bulletInstance.Position = bulletInstance.Position + direction

						traveled = traveled + bulletSpeed * 0.016
						wait(0.016)

					end
				end
				
				bulletInstance:Destroy()
			end
		end)
	end
end)