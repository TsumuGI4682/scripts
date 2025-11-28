local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Conch 本体への参照（場所が違う場合はここを調整）
local Conch = require(game.ReplicatedStorage:WaitForChild("Conch"))

-- GUI作成
local gui = Instance.new("ScreenGui")
gui.Name = "AddMoneyUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 260, 0, 140)
frame.Position = UDim2.new(0.5, -130, 0.5, -70)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Parent = gui
frame.BorderSizePixel = 0

-- タイトル
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "ADD MONEY"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = frame

-- 入力欄
local input = Instance.new("TextBox")
input.Size = UDim2.new(0, 200, 0, 40)
input.Position = UDim2.new(0.5, -100, 0, 40)
input.PlaceholderText = "追加する金額"
input.Text = ""
input.TextScaled = true
input.ClearTextOnFocus = false
input.Parent = frame

-- ADDボタン
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 200, 0, 40)
button.Position = UDim2.new(0.5, -100, 0, 90)
button.Text = "ADD"
button.Font = Enum.Font.GothamBold
button.TextSize = 22
button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
button.TextColor3 = Color3.new(1,1,1)
button.Parent = frame

-- ボタン処理
button.MouseButton1Click:Connect(function()
	local amount = tonumber(input.Text)
	if not amount then
		input.Text = "数字を入力してください"
		return
	end

	-- Conchコマンド実行
	Conch.execute("addmoney " .. amount)
end)
