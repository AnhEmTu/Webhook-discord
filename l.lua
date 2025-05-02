local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.Position = UDim2.new(0.5, 0, -0.025, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "SCRIPT BY: R2LX HUB UPDATE"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 20.00

UIGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(131.00000739097595, 181.0000044107437, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(224.000001847744, 162.00000554323196, 255))
}
UIGradient.Parent = TextLabel

local bindable = Instance.new("BindableFunction")

function bindable.OnInvoke(response)
	if response == "Có" then
		print("Người dùng chọn Có")
	elseif response == "Không" then
		print("Người dùng chọn Không")
	end
end

local success, err = pcall(function()
	game.StarterGui:SetCore("SendNotification", {
		Title = "Tự Động Lụm Chest",
		Text = "Tìm Chest",
		Icon = "rbxassetid://126213825699259",
		Duration = math.huge,
		Callback = bindable,
		Button1 = "Có",
		Button2 = "Không"
	})
end)

if not success then
	warn("Không thể gửi thông báo: " .. err)
end
