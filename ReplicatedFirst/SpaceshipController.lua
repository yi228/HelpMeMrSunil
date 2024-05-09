local ReplicatedStorage = game:GetService("ReplicatedStorage")
local sunil = game.Workspace:WaitForChild("Sunil")
local spaceship = ReplicatedStorage:WaitForChild("Spaceship")

local spawnTimer = 0 -- initialize the timer to 0

local walkspeed = 40 --몬스터의 속도 
local maxhealth = 100 --몬스터의 최대 HP
local health = 100 --몬스터의 HP

local spawnCool

game:GetService("RunService").Heartbeat:Connect(function()
	if workspace.curStage.Value<=3 then
		spawnCool = 3
	end
	if workspace.curStage.Value==4 then
		spawnCool = 2
	end
	if workspace.curStage.Value==5 then
		spawnCool = 1.5
	end
end)

local damage = 10 --몬스터의 데미지
local damagecool = 1 --플레이어에게 데미지를 입힌 후, 다시 데미지 입히기전 쿨타임

local SoundService = game:GetService("SoundService")

local soundObject = Instance.new("Sound")
soundObject.SoundId = "rbxassetid://175024455"
soundObject.Volume = 0.5
soundObject.Parent = SoundService
--local pos = sunil["Meshes/선일맨_Shape_6"].CFrame.Position

game:GetService("RunService").Heartbeat:Connect(function(deltaTime)	
	if workspace.Pause.Value == false and workspace.curStage.Value~=1 and workspace.curStage.Value<6 then
		spawnTimer = spawnTimer + deltaTime -- add the time since the last heartbeat to the timer
		if spawnTimer >= spawnCool then -- if 5 seconds have elapsed since the last spaceship was spawned
			spawnTimer = 0 -- reset the timer
			local position1 = Vector3.new(math.random(-300, -100), 75, -480)
			local spaceshipInstance1 = spaceship:Clone()
			spaceshipInstance1:SetPrimaryPartCFrame(CFrame.new(position1))
			
			--ChangeColor
			spaceshipInstance1.Ring.Color = Color3.new(math.random(), math.random(), math.random())
			spaceshipInstance1.Sphere.Color = Color3.new(math.random(), math.random(), math.random())
			
			--Monster
			local mob = spaceshipInstance1
			local humanoid = mob.mob
			
			humanoid.WalkSpeed = walkspeed --휴머노이드의 스피드 정하기
			humanoid.MaxHealth = maxhealth --휴머노이드의 MAX HP 정하기
			humanoid.Health = health --휴머노이드의 HP 정하기
			
			spaceshipInstance1.Parent = game.Workspace
			
			--Damage
			for i, v in pairs(spaceshipInstance1:GetChildren()) do --몬스터안에 파트 구하기
				if v.ClassName == "Part" then --파트라면(휴머노이드나 아이템 제외하기 위해)
					v.Touched:Connect(function(hit) --파트에 무언가 닿이면
						if(hit.Parent ~= nil ) then
							if(hit.Parent.Name =="Spaceship") then
								return
							end
						end
						if(hit.Parent ~= nil ) then
							if(hit.Parent.Name ~= "Spaceship") then
							local h = hit.Parent:FindFirstChild("Humanoid") --플레이어인지 확인
								if h and h.Health > 0 then --조건 확인
								soundObject:Play()
								h:TakeDamage(damage) --플레이어에게 데미지 입힘 
								humanoid.Health = 0
								spaceshipInstance1:Destroy()
							end end
						end
					end)
				end
			end
			
		end
	end
end)
