local Egg2 = game.ReplicatedStorage:WaitForChild("Pets"):WaitForChild("Robux1")
local Template = script.Parent:WaitForChild("ViewportFrame")

local Colors = {
	["Common"] = Color3.new(0.266667, 1, 0),
	["Rare"] = Color3.new(0, 0.768627, 1),
	["Epic"] = Color3.new(0.933333, 0, 1),
	["Legendary"] = Color3.new(1, 0.835294, 0),
	["Mythical"] = Color3.new(1, 0, 0.0156863)
}

local Numbers = {
	["Common"] = 1,
	["Rare"] = 2,
	["Epic"] = 3,
	["Legendary"] = 4,
	["Mythical"] = 5
}

local Percentages = {
	["Mythical"] = 33.33
}

for i, pets in pairs(Egg2:GetChildren()) do
	local VPF = Template:Clone()
	VPF.Parent = Template.Parent
	VPF.Visible = true
	local petsClone = pets:Clone()
	petsClone.Parent = VPF
	
	local VPFCam = Instance.new("Camera")
	VPFCam.Parent = VPF
	VPF.CurrentCamera = VPFCam
	VPF.RarityLabel.Text = petsClone:GetAttribute("Rarity")
	VPF.RarityLabel.TextColor3 = Colors[petsClone:GetAttribute("Rarity")]
	VPF.Name = tostring(Numbers[petsClone:GetAttribute("Rarity")])
	VPF.Percent.TextColor3 = Colors[petsClone:GetAttribute("Rarity")]
	VPF.Percent.Text = tostring(Percentages[petsClone:GetAttribute("Rarity")]).."%"
	
	local tau = 2*math.pi
	local t = 0
	local radius = 4.2
	
	task.spawn(function()
		while wait() do
			t += tau / 100 --// 1/100 of a circle, i.e. 3.6 degrees.
			VPFCam.CFrame = CFrame.lookAt(Vector3.new(math.sin(t)*radius + petsClone.m.Position.X, petsClone.m.Position.Y, math.cos(t)*radius + petsClone.m.Position.Z), petsClone.m.Position)
		end
	end)
	
end