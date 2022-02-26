local player = game.Players.LocalPlayer
local char = player.Character or player.ChildAdded:Wait()
local camera = Instance.new("Camera")
camera.Parent = script.Parent
local BindableEvent = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlayerScreenBindable")
local function CharacterViewChanged()
	script.Parent.Character:ClearAllChildren()
	for i, v in pairs(char:GetChildren()) do
		local vClone = v:Clone()
		if vClone:IsA("Script") or vClone:IsA("LocalScript") or vClone:IsA("ModuleScript") then
			vClone:Destroy()
		else
		vClone.Parent = script.Parent.Character	
		if vClone:IsA("Humanoid") then
			vClone.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			end
		end
	end
	script.Parent.CurrentCamera = camera
	camera.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, 2.5, -5) * CFrame.Angles(math.rad(0), math.rad(180),0)
end
wait(5)
CharacterViewChanged()
BindableEvent.Event:Connect(function()
	wait(1)
	CharacterViewChanged()
end)

char.ChildAdded:Connect(function()
	wait(5)
	CharacterViewChanged()
end)
