local sunil = workspace:WaitForChild("Sunil") -- Get the Sunil model
local bulletModel = game.ReplicatedStorage.BulletCaptain
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("RemoteEvent123")
local stageInfoEvent = ReplicatedStorage:WaitForChild("StageInfoEvent")
local bullet1CFrame = sunil["Meshes/선일맨_Shape_3"].CFrame
local bullet2CFrame = sunil["Meshes/선일맨_Shape_8"].CFrame
local bullet1Prim
local bullet2Prim

local bulletList={}
bulletList[1]=game.ReplicatedStorage.BulletCaptain
bulletList[2]=game.ReplicatedStorage.BulletIron
bulletList[3]=game.ReplicatedStorage.BulletAvengers
bulletList[4]=game.ReplicatedStorage.BulletFinal

local bulletDamage = 20
local bulletCaptainDamage = 30
local bulletIronDamage = 100
local bulletAvengersDamage = 50
local bulletFinalDamage = 60
local DamageList={}
DamageList[1]=bulletCaptainDamage
DamageList[2]=bulletIronDamage
DamageList[3]=bulletAvengersDamage
DamageList[4]=bulletFinalDamage

local coolTimeBullet = 0.15
local coolTimeBulletCaptain = 0.2
local coolTimeBulletIron = 0.25
local coolTimeBulletAvengers = 0.4
local cooltimeBulletFinal = 0.4
local coolTimeList={}
coolTimeList[1]=coolTimeBulletCaptain
coolTimeList[2]=coolTimeBulletIron
coolTimeList[3]=coolTimeBulletAvengers
coolTimeList[4]=cooltimeBulletFinal


local SoundService = game:GetService("SoundService")

local soundObject = Instance.new("Sound")
soundObject.SoundId = "rbxassetid://2868331684"
soundObject.Volume = 0.3
soundObject.Parent = SoundService

local isMobile = game:GetService("UserInputService").TouchEnabled

function onModelTouched(part)
	if(part.Parent.Name == "Spaceship" and part.Parent.Name == "Spaceship2") then
		part.Parent.mob.Health -= bulletDamage
	end
end

-- 모델의 각 파트에 Touched 이벤트 핸들러를 추가하는 함수
local function AddEventHandler(part)
	local children = part:GetChildren()
	for i=1, #children do
		if children[i]:IsA("BasePart") then
			children[i].Touched:Connect(function(otherPart)
				if otherPart.Parent ~= nil then
					if(otherPart.Parent.Name == "Spaceship" or otherPart.Parent.Name == "Spaceship2" or otherPart.Parent.Name == "Boss") then
						otherPart.Parent.mob.Health -= bulletDamage
						soundObject:Play()
						if(otherPart.Parent.mob.Health <= 0) then
							print("monster down")
							if otherPart.Parent.Name == "Boss" then
								print("boss down")
								workspace.BossDown.Value = true
								workspace.InBossStage.Value = false
							end
							otherPart.Parent:Destroy() -- 잔여물 안남게 부셔버리기
							workspace.BulletCount.Value += 1
						end 
						part:Destroy()
					end
				end
			end)
		end
	end
end

local function SetPrimaryPart()
	local PrimaryPart = bulletModel.PrimaryPart
	if not PrimaryPart or not PrimaryPart:IsA("BasePart") then
		for _, Part in ipairs(bulletModel:GetDescendants()) do
			if Part:IsA("BasePart") then
				bulletModel.PrimaryPart = Part
				break
			end
		end
	end
end

SetPrimaryPart()
-- Check if Sunil exists
if sunil then
	-- Create a function to fire a bullet
	local lastFired = 0 -- track the time since the last bullet was fired
	
	function SpawnBullet (player)

		local currentTime = tick()
		if currentTime - lastFired < coolTimeBullet then -- check if the cooldown period has passed
			return
		end

		lastFired = currentTime -- update the time since the last bullet was fired

		SetPrimaryPart(bulletModel)
		local bulletSpeed = 200
		local bulletGroup = Instance.new("Model")
		local bullet1 = bulletModel:Clone()
		bullet1Prim = bullet1.PrimaryPart
		-- 개별 발사
		bullet1.Parent = workspace
		--bullet1.Parent = bulletGroup
		bullet1:SetPrimaryPartCFrame(bullet1CFrame)
		AddEventHandler(bullet1)
		local bullet2 = bulletModel:Clone()
		bullet2Prim = bullet2.PrimaryPart
		--bullet2.Parent = bulletGroup
		--bulletGroup.Parent = game.Workspace
		-- 개별 발사
		bullet2.Parent = workspace
		bullet2:SetPrimaryPartCFrame(bullet2CFrame)
		AddEventHandler(bullet2)

		local distance = 100
		local traveled = 0
		while traveled < distance do
			if(bullet1.PrimaryPart ~= nil and bullet2.PrimaryPart ~= nil) then
				local direction1 = sunil:GetPrimaryPartCFrame().LookVector * bulletSpeed * 0.016
				local direction2 = sunil:GetPrimaryPartCFrame().LookVector * bulletSpeed * 0.016

				local rotation1 = CFrame.new(Vector3.new(0,1,0), direction1) -- create a rotation CFrame for bullet1
				local rotation2 = CFrame.new(Vector3.new(0,1,0), direction2) -- create a rotation CFrame for bullet2

				bullet1:SetPrimaryPartCFrame(bullet1:GetPrimaryPartCFrame() ) -- 괄호안에서 rotation1 값 곱해주면 회전됨
				bullet2:SetPrimaryPartCFrame(bullet2:GetPrimaryPartCFrame() ) -- 괄호안에서 rotation2 값 곱해주면 회전됨

				bullet1:MoveTo(bullet1.PrimaryPart.Position + direction1)
				bullet2:MoveTo(bullet2.PrimaryPart.Position + direction2)

				traveled = traveled + bulletSpeed * 0.016
				wait(0.016)
			else
				break
			end
		end

		bullet1:Destroy()
		bullet2:Destroy()
	end
	
	function RollingBullet (player)

		local currentTime = tick()
		if currentTime - lastFired < coolTimeBullet then -- check if the cooldown period has passed
			return
		end

		lastFired = currentTime -- update the time since the last bullet was fired

		SetPrimaryPart(bulletModel)
		local bulletSpeed = 200
		local bulletGroup = Instance.new("Model")
		local bullet1 = bulletModel:Clone()
		bullet1Prim = bullet1.PrimaryPart
		-- 개별 발사
		bullet1.Parent = workspace
		--bullet1.Parent = bulletGroup
		bullet1:SetPrimaryPartCFrame(bullet1CFrame)
		AddEventHandler(bullet1)
		local bullet2 = bulletModel:Clone()
		bullet2Prim = bullet2.PrimaryPart
		--bullet2.Parent = bulletGroup
		--bulletGroup.Parent = game.Workspace
		-- 개별 발사
		bullet2.Parent = workspace
		bullet2:SetPrimaryPartCFrame(bullet2CFrame)
		AddEventHandler(bullet2)

		local distance = 100
		local traveled = 0
		while traveled < distance do
			if(bullet1.PrimaryPart ~= nil and bullet2.PrimaryPart ~= nil) then
				local direction1 = sunil:GetPrimaryPartCFrame().LookVector * bulletSpeed * 0.016
				local direction2 = sunil:GetPrimaryPartCFrame().LookVector * bulletSpeed * 0.016

				local rotation1 = CFrame.new(Vector3.new(0,0.75,0), direction1) -- 회전값 설정
				local rotation2 = CFrame.new(Vector3.new(0,0.75,0), direction2) -- 회전값 설정

				bullet1:SetPrimaryPartCFrame(bullet1:GetPrimaryPartCFrame() *rotation1) --rotation1 값 곱해주면 회전됨
				bullet2:SetPrimaryPartCFrame(bullet2:GetPrimaryPartCFrame() *rotation2) --rotation2 값 곱해주면 회전됨

				bullet1:MoveTo(bullet1.PrimaryPart.Position + direction1)
				bullet2:MoveTo(bullet2.PrimaryPart.Position + direction2)

				traveled = traveled + bulletSpeed * 0.016
				wait(0.016)
			else
				break
			end
		end

		bullet1:Destroy()
		bullet2:Destroy()
	end
	function RollingBullet2 (player)

		local currentTime = tick()
		if currentTime - lastFired < coolTimeBullet then -- check if the cooldown period has passed
			return
		end

		lastFired = currentTime -- update the time since the last bullet was fired

		SetPrimaryPart(bulletModel)
		local bulletSpeed = 200
		local bulletGroup = Instance.new("Model")
		local bullet1 = bulletModel:Clone()
		bullet1Prim = bullet1.PrimaryPart
		-- 개별 발사
		bullet1.Parent = workspace
		--bullet1.Parent = bulletGroup
		bullet1:SetPrimaryPartCFrame(bullet1CFrame)
		AddEventHandler(bullet1)
		local bullet2 = bulletModel:Clone()
		bullet2Prim = bullet2.PrimaryPart
		--bullet2.Parent = bulletGroup
		--bulletGroup.Parent = game.Workspace
		-- 개별 발사
		bullet2.Parent = workspace
		bullet2:SetPrimaryPartCFrame(bullet2CFrame)
		AddEventHandler(bullet2)

		local distance = 100
		local traveled = 0
		while traveled < distance do
			if(bullet1.PrimaryPart ~= nil and bullet2.PrimaryPart ~= nil) then
				local direction1 = sunil:GetPrimaryPartCFrame().LookVector * bulletSpeed * 0.016
				local direction2 = sunil:GetPrimaryPartCFrame().LookVector * bulletSpeed * 0.016

				local rotation1 = CFrame.new(Vector3.new(-1,0,0), direction1) -- create a rotation CFrame for bullet1
				local rotation2 = CFrame.new(Vector3.new(1,0,0), direction2) -- create a rotation CFrame for bullet2

				bullet1:SetPrimaryPartCFrame(bullet1:GetPrimaryPartCFrame() *rotation1) -- 괄호안에서 rotation1 값 곱해주면 회전됨
				bullet2:SetPrimaryPartCFrame(bullet2:GetPrimaryPartCFrame() *rotation2) -- 괄호안에서 rotation2 값 곱해주면 회전됨

				bullet1:MoveTo(bullet1.PrimaryPart.Position + direction1)
				bullet2:MoveTo(bullet2.PrimaryPart.Position + direction2)

				traveled = traveled + bulletSpeed * 0.016
				wait(0.016)
			else
				break
			end
		end

		bullet1:Destroy()
		bullet2:Destroy()
	end
	function RotationBullet (player)

		local currentTime = tick()
		if currentTime - lastFired < coolTimeBullet then -- check if the cooldown period has passed
			return
		end

		lastFired = currentTime -- update the time since the last bullet was fired

		SetPrimaryPart(bulletModel)
		local bulletSpeed = 200
		local bulletGroup = Instance.new("Model")
		local bullet1 = bulletModel:Clone()
		bullet1Prim = bullet1.PrimaryPart
		-- 개별 발사
		bullet1.Parent = workspace
		--bullet1.Parent = bulletGroup
		bullet1:SetPrimaryPartCFrame(bullet1CFrame)
		AddEventHandler(bullet1)
		

		local distance = 100
		local traveled = 0
		while traveled < distance do
			if(bullet1.PrimaryPart ~= nil ) then
				
				local radius = 20 -- 등속원의 반지름
				local angleSpeed = 0.1 -- 등속원의 각속도
				local angle = 0 -- 초기 각도
				local traveled = 0 -- 이동한 거리
				while true do
					local rotationCenter = sunil.PrimaryPart.Position -- 회전 중심
					-- 등속원의 위치 계산
					local offsetX = math.cos(angle) * radius
					local offsetZ = math.sin(angle) * radius
					local targetPosition = rotationCenter + Vector3.new(offsetX, 0, offsetZ)

					-- 방향과 이동 거리 계산
					local direction = (targetPosition - bullet1.PrimaryPart.Position).Unit
					local distance = (targetPosition - bullet1.PrimaryPart.Position).Magnitude

					-- 이동
					local moveDistance = math.min(bulletSpeed * 0.016, distance)
					bullet1:MoveTo(bullet1.PrimaryPart.Position + direction * moveDistance)

					-- 회전
					bullet1:SetPrimaryPartCFrame(bullet1:GetPrimaryPartCFrame() * CFrame.Angles(0, angleSpeed, 0))

					-- 각도 및 이동한 거리 업데이트
					angle = angle + angleSpeed
					traveled = traveled + moveDistance

					-- 등속원을 한 바퀴 돌았을 경우 초기화
					if traveled >= 2 * math.pi * radius then
						traveled = 0
					end

					wait(0.016)
				end

			else
				break
			end
		end

		bullet1:Destroy()
	end

	local function UpdateBulletPos()
		
		bullet1CFrame = sunil["Meshes/선일맨_Shape_3"].CFrame
		bullet2CFrame = sunil["Meshes/선일맨_Shape_8"].CFrame
		

	end
	local index =1
	local function mobileShoot()
		local shootVal=game:GetService("ReplicatedStorage").ShootBullet.Value
		local bulletVal=game:GetService("Workspace"):WaitForChild("BulletModel").Value
		
			if shootVal==1 then
				if bulletVal ==0 then
					bulletModel = game.ReplicatedStorage.BulletCaptain
					bulletDamage = bulletCaptainDamage
					coolTimeBullet = coolTimeBulletCaptain
					UpdateBulletPos()
					SpawnBullet()
				elseif bulletVal==1 then
					bulletModel = game.ReplicatedStorage.BulletIron
					bulletDamage = bulletIronDamage
					coolTimeBullet = coolTimeBulletIron
					UpdateBulletPos()
					RotationBullet()	
				elseif bulletVal==2 then
					bulletModel = game.ReplicatedStorage.BulletAvengers
					bulletDamage = bulletAvengersDamage
					coolTimeBullet = coolTimeBulletAvengers
					UpdateBulletPos()
					RollingBullet()	
				elseif bulletVal==3 then
					bulletModel = game.ReplicatedStorage.BulletFinal
					bulletDamage = bulletFinalDamage
					coolTimeBullet = cooltimeBulletFinal
					UpdateBulletPos()
					RollingBullet2()	
				end	
				
			elseif shootVal==0 then
			end
		
	end
	
	game:GetService("RunService").RenderStepped:Connect(mobileShoot)
	
	game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
		if input.KeyCode == Enum.KeyCode.Q and workspace.Pause.Value == false and not gameProcessed then
			bulletModel = game.ReplicatedStorage.BulletCaptain
			bulletDamage = bulletCaptainDamage
			coolTimeBullet = coolTimeBulletCaptain
		end
		if workspace.Stage.Value>1 and input.KeyCode == Enum.KeyCode.W and workspace.Pause.Value == false and not gameProcessed then
			bulletModel = game.ReplicatedStorage.BulletIron
			bulletDamage = bulletIronDamage
			coolTimeBullet = coolTimeBulletIron
		end
		if workspace.Stage.Value>3 and input.KeyCode == Enum.KeyCode.E and workspace.Pause.Value == false and not gameProcessed then
			bulletModel = game.ReplicatedStorage.BulletAvengers
			bulletDamage = bulletAvengersDamage
			coolTimeBullet = coolTimeBulletAvengers
		end
		if workspace.Stage.Value>5 and input.KeyCode == Enum.KeyCode.R and workspace.Pause.Value == false and not gameProcessed then
			bulletModel = game.ReplicatedStorage.BulletFinal
			bulletDamage = bulletFinalDamage
			coolTimeBullet = cooltimeBulletFinal
		end			
		
		if  input.KeyCode == Enum.KeyCode.X and workspace.Pause.Value == false and not gameProcessed then
			if(bulletModel==game.ReplicatedStorage.BulletCaptain) then
				UpdateBulletPos()
				SpawnBullet()	
			end
			if(bulletModel==game.ReplicatedStorage.BulletIron) then
				UpdateBulletPos()
				RotationBullet()	
			end
			if(bulletModel==game.ReplicatedStorage.BulletAvengers) then
				UpdateBulletPos()
				RollingBullet()	
			end
			if(bulletModel==game.ReplicatedStorage.BulletFinal) then
				UpdateBulletPos()
				RollingBullet2()	
			end

		end

	end)
else
	warn("Sunil model not found")
end