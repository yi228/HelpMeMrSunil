local sunil = workspace:WaitForChild("Sunil")
--sunil.CanCollide = false  -- Sunil 모델의 CanCollide 속성을 false로 설정

local player = game.Players.LocalPlayer


local distance = -10  -- Sunil 오브젝트 앞에 위치시킬 거리
local playerOffset = Vector3.new(-0.5, 1, distance)  -- Player 위치 보정값

-- 매 프레임마다 player 위치 업데이트
local function updatePositions()
	local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if humanoidRootPart then
		local sunilCFrame = sunil["Meshes/선일맨_Shape_5"].CFrame
		local sunilFacingDirection = sunilCFrame.lookVector
		local playerPosition = sunilCFrame.p +  playerOffset
		humanoidRootPart.CFrame = CFrame.new(playerPosition)
	end
end

-- 매 프레임마다 updatePositions 함수를 실행하는 핸들러
game:GetService("RunService").RenderStepped:Connect(updatePositions)
