-- StarterGui > SpeedTestGui > LocalScript

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local gui = script.Parent
local frame = gui:WaitForChild("Frame")

local speedUp = frame:WaitForChild("SpeedUp")
local speedDown = frame:WaitForChild("SpeedDown")
local speedLabel = frame:WaitForChild("SpeedLabel")

local MIN_SPEED = 8
local MAX_SPEED = 50
local STEP = 4

humanoid.WalkSpeed = 16

local function updateLabel()
	speedLabel.Text = "Speed: " .. humanoid.WalkSpeed
end

speedUp.MouseButton1Click:Connect(function()
	humanoid.WalkSpeed = math.clamp(
		humanoid.WalkSpeed + STEP,
		MIN_SPEED,
		MAX_SPEED
	)
	updateLabel()
end)

speedDown.MouseButton1Click:Connect(function()
	humanoid.WalkSpeed = math.clamp(
		humanoid.WalkSpeed - STEP,
		MIN_SPEED,
		MAX_SPEED
	)
	updateLabel()
end)

updateLabel()
