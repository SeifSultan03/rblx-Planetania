local Template = script.Parent
local rep = game:GetService("ReplicatedStorage")
local PaidStarPassItems = rep:WaitForChild("StarPassItems"):WaitForChild("Paid")
local TemplateTier = tonumber(Template.Name) - 100
local VPF = Template:WaitForChild("ViewportFrame")
local RarityTemplate = require(rep.Modules.RarityTemplates)
local player = game:GetService("Players").LocalPlayer

for _, Item in pairs(PaidStarPassItems:GetChildren()) do
	if Item:GetAttribute("Tier") == TemplateTier then
		local ItemAttribute = Item:GetAttribute("Rarity")
		Template.Image = RarityTemplate[ItemAttribute]
		Template:WaitForChild("ItemName").Text = Item.Name
		Template:WaitForChild("Tier").Text = "Level "..tostring(TemplateTier)
		Item.Parent = VPF
		if Item:IsA("Model") or Item:IsA("Accessory") then
			local VPFcam = Instance.new("Camera")
			VPF.CurrentCamera = VPFcam
			VPFcam.Parent = VPF
			local maxLength = math.max(Item:WaitForChild("Handle").Size.X, Item.Handle.Size.Z)/2
			VPFcam.CFrame = CFrame.new(Item.Handle.Position + Vector3.new(0, maxLength/math.tan(math.rad(35)) + Item.Handle.Size.Y, 0), Item.Handle.Position)
			for i, Parts in pairs(Item:GetChildren()) do
				Parts.Parent = VPF
			end
			break
		else
			Item.Parent = VPF
			local VPFcam = Instance.new("Camera")
			VPF.CurrentCamera = VPFcam
			VPFcam.Parent = VPF
			local maxLength = math.max(Item.Size.X, Item.Size.Z)/2
			VPFcam.CFrame = CFrame.new(Item.Position + Vector3.new(0, maxLength/math.tan(math.rad(35)) + 2 * Item.Size.Y, 0), Item.Position)
			break
		end
	end
end

local menu = script.Parent.Parent.Parent.Parent
local StarpassFrame = menu.Parent.Parent.Parent:WaitForChild("Gamepasses"):WaitForChild("StarpassFrame")
local blur = game.Lighting:WaitForChild("Blur")

Template.ClaimButton.MouseButton1Down:Connect(function()
	local StarPassRemote = rep.Remotes.StarPassRemotePaid
	local returnval = StarPassRemote:InvokeServer(TemplateTier)
	if returnval == true then
		Template.ClaimButton:Destroy()
		local ClaimSound = game.ReplicatedStorage:WaitForChild("Sounds"):WaitForChild("ClaimButton")
		ClaimSound:Play()
	else
		-- prompt star pass
		Template.ClaimButton.Text = "Star Pass Needed"
		Template.ClaimButton.BackgroundColor3 = Color3.new(1, 0, 0)
		wait(1)
		Template.ClaimButton.Text = "Claim!"
		Template.ClaimButton.BackgroundColor3 = Color3.new(0,1/3, 0)
		
		menu.Visible = false
		StarpassFrame.Visible = true
		blur.Size = 12
	end
end)