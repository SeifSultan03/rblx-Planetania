local TweenService = game:GetService("TweenService")

local goalsBig = {}
goalsBig.Size = UDim2.new(1.5, 0, 3, 0)

local goalsSmall = {}
goalsSmall.Size = UDim2.new(0.022, 0, 0.044, 0)

local part = script.Parent

local info = TweenInfo.new(1)

local SmallTween = TweenService:Create(part, info, goalsSmall)
local BigTween = TweenService:Create(part, info, goalsBig)

local AnimEvent = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("TeleportAnim")

AnimEvent.OnClientEvent:Connect(function()
	part.Visible = true
	BigTween:Play()
	wait(1)
	SmallTween:Play()
	wait(1)
	part.Visible = false
end)