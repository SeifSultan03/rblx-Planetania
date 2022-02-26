local Template = script.Parent
local rep = game:GetService("ReplicatedStorage")
local FreeStarPassItems = rep:WaitForChild("StarPassItems"):WaitForChild("Free")
local TemplateTier = tonumber(Template.Name) - 100
local VPF = Template:WaitForChild("ViewportFrame")
local RarityTemplate = require(rep.Modules.RarityTemplates)

for _, Item in pairs(FreeStarPassItems:GetChildren()) do
	if Item:GetAttribute("Tier") == TemplateTier then
		local ItemAttribute = Item:GetAttribute("Rarity")
		Template.Image = RarityTemplate[ItemAttribute]
		Template:WaitForChild("ItemName").Text = Item.Name
		Template:WaitForChild("Tier").Text = "Level "..tostring(TemplateTier)
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

Template.ClaimButton.MouseButton1Down:Connect(function()
	local StarPassRemote = rep.Remotes.StarPassRemote
	local returnval = StarPassRemote:InvokeServer(TemplateTier)
	if returnval == true then
		Template.ClaimButton:Destroy()
	else
		print("error, player clicked button when theyre not allowed to")
	end
end)