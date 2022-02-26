local function playVFX(VFXClone)
	local TweenService = game:GetService("TweenService")
	local GoalsSize = {}
	GoalsSize.Size = Vector3.new(10, 20, 10)

	local SizeInfo = TweenInfo.new(5, Enum.EasingStyle.Linear)
	local SizeTween = TweenService:Create(VFXClone, SizeInfo, GoalsSize)
	SizeTween:Play()

	local RotationInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear)
	for count = 0, 1, 0.1 do
		local GoalsRotation = {}
		GoalsRotation.CFrame = VFXClone.CFrame *  CFrame.Angles(0, math.rad(180), 0)

		local RotateTween = TweenService:Create(VFXClone, RotationInfo, GoalsRotation)
		RotateTween:Play()

		VFXClone.Transparency = count
		wait(0.5)
	end
end

local display = script.Parent
local player = game:GetService("Players").LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local rep = game.ReplicatedStorage

local LevelUpText = script.Parent.Parent:WaitForChild("LevelUpText")
local LevelUpVFX = rep:WaitForChild("VFX"):WaitForChild("LevelUpVFX")

wait(3)
display.Text = tostring(player.leaderstats:GetAttribute("Level"))

wait(5)
player.leaderstats:GetAttributeChangedSignal("Level"):Connect(function()
	display.Text = tostring(player.leaderstats:GetAttribute("Level"))
	LevelUpText.Visible = true
	rep.Sounds.LevelUp:Play()
	
	local VFXClone = LevelUpVFX:Clone()
	VFXClone.Parent = game.Workspace
	VFXClone.Position = char.HumanoidRootPart.Position - Vector3.new(0, 2, 0)
	char.Humanoid.WalkSpeed = 0
	playVFX(VFXClone)
	VFXClone:Destroy()
	char.Humanoid.WalkSpeed = 24
	LevelUpText.Visible = false
end)
