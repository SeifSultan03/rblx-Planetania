local Button = script.Parent
local TweenService = game:GetService("TweenService")
local goalsBigger = {}
goalsBigger.Size = Button.Size + UDim2.new(0, 5, 0, 5)
local goalsSmaller = {}
goalsSmaller.Size = Button.Size
local tweenInfo = TweenInfo.new(0.2)
local TweenBigger = TweenService:Create(Button, tweenInfo, goalsBigger)
local TweenSmaller = TweenService:Create(Button, tweenInfo, goalsSmaller)

local InventoryFrame = Button.Parent
local ExtrasFrame = Button.Parent.Parent

-- player variables
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()


Button.MouseEnter:Connect(function()
	TweenBigger:Play()
end)

Button.MouseLeave:Connect(function()
	TweenSmaller:Play()
end)

local UpdateBindable = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Pets"):WaitForChild("UpdateUI")
local DeleteRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Pets"):WaitForChild("Delete")

Button.MouseButton1Down:Connect(function()
	script.Parent.Parent.Visible = false
	UpdateBindable:Fire()
	DeleteRemote:FireServer(script.Parent.Parent.Parent.PetsInv.Display.Current.ViewportFrame:FindFirstChildOfClass("Model").Name)
end)
