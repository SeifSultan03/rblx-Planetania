local bar = script.Parent
local TweenService = game:GetService("TweenService")
local info = TweenInfo.new(0.2)
local player = game:GetService("Players").LocalPlayer
local XPNumber = script.Parent.Parent:WaitForChild("XPNumber")

player.leaderstats:GetAttributeChangedSignal("XP"):Connect(function()
	local XP = player.leaderstats:GetAttribute("XP")
	local MaxXP = player.leaderstats:GetAttribute("XPNeededForLevelUp")
	local TweenGoals = {}
	TweenGoals.Size = UDim2.new(XP/MaxXP * 1, 0, 1, 0)
	local XPBarTween = TweenService:Create(bar, info, TweenGoals)
	XPNumber.Text = tostring(XP).."/"..tostring(MaxXP)
	XPBarTween:Play()
end)

wait(0.5)
local XP = player.leaderstats:GetAttribute("XP")
local MaxXP = player.leaderstats:GetAttribute("XPNeededForLevelUp")
local TweenGoals = {}
TweenGoals.Size = UDim2.new(XP/MaxXP * 1, 0, 1, 0)
local XPBarTween = TweenService:Create(bar, info, TweenGoals)
XPNumber.Text = tostring(XP).."/"..tostring(MaxXP)
XPBarTween:Play()