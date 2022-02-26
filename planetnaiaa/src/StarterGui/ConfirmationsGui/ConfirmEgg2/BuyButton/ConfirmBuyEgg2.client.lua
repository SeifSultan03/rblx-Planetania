local player = game.Players.LocalPlayer
local ThisFrame = script.Parent.Parent
local Egg2 = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Pets"):WaitForChild("Egg2")
local EggStuff = game.Workspace:WaitForChild("EggStuff")
local particles = EggStuff:WaitForChild("Particles")
local Camera = game.Workspace.CurrentCamera
local MarketPlaceService = game:GetService("MarketplaceService")

local ScreenGui = player.PlayerGui:WaitForChild("ScreenGui")
local CodeGui = player.PlayerGui:WaitForChild("CodeButton")

local TweenService = game:GetService("TweenService")
local crackleSound = game.ReplicatedStorage:WaitForChild("Sounds"):WaitForChild("Crackle")
local RarityLabel = script.Parent.Parent.Parent:WaitForChild("RarityLabel")

local Info = TweenInfo.new(1)
local Info2 = TweenInfo.new(0.5)
local Info3 = TweenInfo.new(0.2)
local backPack10ID = 26670032

local Colors = {
	["Common"] = Color3.new(0.266667, 1, 0),
	["Rare"] = Color3.new(0, 0.768627, 1),
	["Epic"] = Color3.new(0.933333, 0, 1),
	["Legendary"] = Color3.new(1, 0.835294, 0),
	["Mythical"] = Color3.new(1, 0, 0.0156863)
}

local debounce = false
script.Parent.MouseButton1Down:Connect(function()
	if debounce then return end
	debounce = true
	
	local pet = Egg2:InvokeServer()
	if pet then
		script.Parent.Parent.Visible = false
		Camera.CameraType = Enum.CameraType.Scriptable
		Camera.CFrame = EggStuff:WaitForChild("Cam").CFrame
		local egg = EggStuff.Egg2.Egg -- CHANGE TO WHATEVER EGG NUMBER
		local eggClone = egg:Clone()
		eggClone.Parent = game.Workspace
		eggClone.CFrame = EggStuff.EggPos.CFrame
		local GoalsRight = {}
		GoalsRight.CFrame = eggClone.CFrame * CFrame.Angles(0, 0, math.rad(45))
		local GoalsLeft = {}
		GoalsLeft.CFrame = eggClone.CFrame * CFrame.Angles(0, 0, math.rad(-45))
		TweenService:Create(eggClone, Info, GoalsRight):play()
		wait(1)
		crackleSound.PlaybackSpeed = 1
		crackleSound:Play()
		TweenService:Create(eggClone, Info, GoalsLeft):Play()
		wait(1)
		crackleSound:Play()
		TweenService:Create(eggClone, Info2, GoalsRight):Play()
		wait(0.5)
		crackleSound.PlaybackSpeed = 2
		crackleSound:Play()
		TweenService:Create(eggClone, Info2, GoalsLeft):Play()
		wait(0.5)
		crackleSound:Play()
		TweenService:Create(eggClone, Info3, GoalsRight):Play()
		wait(0.2)
		crackleSound.PlaybackSpeed = 3
		crackleSound:Play()
		TweenService:Create(eggClone, Info3, GoalsLeft):Play()
		wait(0.2)
		crackleSound:Play()
		eggClone:Destroy()
		RarityLabel.Visible = true
		RarityLabel.Rarity.Text = pet:GetAttribute("Rarity")
		RarityLabel.Rarity.TextColor3 = Colors[pet:GetAttribute("Rarity")]

		local petClone = pet:Clone()
		for i, v in pairs(petClone:GetChildren()) do
			if v:IsA("Part") or v:IsA("MeshPart") then
				v.Anchored = true
			end
		end
		petClone.Parent = game.Workspace
		petClone:MoveTo(EggStuff.EggPos.Position)
		petClone:PivotTo(petClone:GetPivot() * CFrame.Angles(0, math.rad(-90), 0))
		for i, v in pairs(particles:GetChildren()) do
			v.Enabled = true
		end
		wait(2.7)
		for i, v in pairs(particles:GetChildren()) do
			v.Enabled = false
		end
		wait(0.3)
		Camera.CameraType = Enum.CameraType.Custom
		petClone:Destroy()
		RarityLabel.Visible = false
		ScreenGui.Enabled = true
		CodeGui.Enabled = true
			
	elseif pet == false then
		script.Parent.Text = "Full Backpack"
		script.Parent.BackgroundColor3 = Color3.new(1, 0, 0)
		wait(1)
		-- prompt upgrade
		MarketPlaceService:PromptGamePassPurchase(player, backPack10ID)
		script.Parent.Text = "Buy!"
		script.Parent.BackgroundColor3 = Color3.new(0.317647, 1, 0)
	else
		script.Parent.Text = "Not Enough Buckies"
		script.Parent.BackgroundColor3 = Color3.new(1, 0, 0)
		wait(1)
		script.Parent.Text = "Buy!"
		script.Parent.BackgroundColor3 = Color3.new(0.317647, 1, 0)
	end
		
	
	debounce = false
end)