local player = game.Players.LocalPlayer
local ColorInventory = player:WaitForChild("ColorsInventory")
local TexturesInventory = player:WaitForChild("TexturesInventory")

local UpdateUIBindable = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("UpdateColorsUI")

local ColorsList = script.Parent:WaitForChild("ColorsList")
local OwnedLabel = script.Parent:WaitForChild("OwnedLabel")
local Template = ColorsList:WaitForChild("Template")

local Color1Button = script.Parent:WaitForChild("Color1")
local Color2Button = script.Parent:WaitForChild("Color2")
local FloorColorButton = script.Parent:WaitForChild("FloorColor")
local WallColorButton = script.Parent:WaitForChild("WallColor")

local Color1TextureButton = script.Parent:WaitForChild("Color1Texture")
local Color2TextureButton = script.Parent:WaitForChild("Color2Texture")
local FloorTextureButton = script.Parent:WaitForChild("FloorTexture")

local playerFolder = game.Workspace:WaitForChild(player.Name.."f")

-- big position {0.398, 0},{0.078, 0}
-- big size {0.542, 0},{0.829, 0}
-- small position {0.307, 0},{0.256, 0}
-- small size {0.287, 0},{0.439, 0}
local function UpdateFullUi()
	local playerSpaceship
	for i, v in pairs(playerFolder:GetChildren()) do
		if string.match(v.Name, "Lvl") then
			playerSpaceship = v
		end
	end
	print("Ran once")
	-- Colors
	Color1Button.BackgroundColor = playerSpaceship:FindFirstChild("Color1").BrickColor
	Color2Button.BackgroundColor = playerSpaceship:FindFirstChild("Color2").BrickColor
	FloorColorButton.BackgroundColor = playerSpaceship:FindFirstChild("BuildableFloor").BrickColor
	WallColorButton.BackgroundColor = playerSpaceship:FindFirstChild("Wall").BrickColor
	Color1TextureButton.BackgroundColor = playerSpaceship:FindFirstChild("Color1").BrickColor
	Color2TextureButton.BackgroundColor = playerSpaceship:FindFirstChild("Color2").BrickColor
	FloorTextureButton.BackgroundColor = playerSpaceship:FindFirstChild("BuildableFloor").BrickColor
	-- Textures
	if playerSpaceship:FindFirstChild("Color1"):FindFirstChildOfClass("Texture") then
		Color1TextureButton.Image = playerSpaceship:FindFirstChild("Color1"):FindFirstChildOfClass("Texture").Texture
		Color1TextureButton.ImageTransparency = 0.7
	end
	if playerSpaceship:FindFirstChild("Color2"):FindFirstChildOfClass("Texture") then
		Color2TextureButton.Image = playerSpaceship:FindFirstChild("Color2"):FindFirstChildOfClass("Texture").Texture
		Color2TextureButton.ImageTransparency = 0.7
	end
	if playerSpaceship:FindFirstChild("BuildableFloor"):FindFirstChildOfClass("Texture") then
		FloorTextureButton.Image = playerSpaceship:FindFirstChild("BuildableFloor"):FindFirstChildOfClass("Texture").Texture
		FloorTextureButton.ImageTransparency = 0.7
	end
	
end

local function DestroyTemplateClones()
	for i, v in pairs(ColorsList:GetChildren()) do
		if v.Name ~= "Template" and not string.match(v.Name, "UI") then
			v:Destroy()
		end
	end
end

script.Parent.Changed:Connect(function() -- opened/closed
	if script.Parent.Visible  then
		UpdateFullUi()
	end
end)

Color1Button.MouseButton1Down:Connect(function()
	OwnedLabel.Visible = true
	ColorsList.Visible = true
	-- destroy stuff in OwnedColors
	DestroyTemplateClones()
	-- clone the stuff into OwnedColors
	for i, v in pairs(ColorInventory:GetChildren()) do
		local TemplateClone = Template:Clone()
		TemplateClone.Visible = true
		TemplateClone.Name = "Color1_"..v.Name
		TemplateClone.BackgroundColor = BrickColor.new(v.Name)
		TemplateClone.Parent = ColorsList
	end
	
end)
Color2Button.MouseButton1Down:Connect(function()
	OwnedLabel.Visible = true
	ColorsList.Visible = true
	-- destroy stuff in OwnedColors
	DestroyTemplateClones()
	-- clone the stuff into OwnedColors
	for i, v in pairs(ColorInventory:GetChildren()) do
		local TemplateClone = Template:Clone()
		TemplateClone.Visible = true
		TemplateClone.Name = "Color2_"..v.Name
		TemplateClone.BackgroundColor = BrickColor.new(v.Name)
		TemplateClone.Parent = ColorsList
	end
end)
FloorColorButton.MouseButton1Down:Connect(function()
	OwnedLabel.Visible = true
	ColorsList.Visible = true
	-- destroy stuff in OwnedColors
	DestroyTemplateClones()
	-- clone the stuff into OwnedColors
	for i, v in pairs(ColorInventory:GetChildren()) do
		local TemplateClone = Template:Clone()
		TemplateClone.Visible = true
		TemplateClone.Name = "BuildableFloor_"..v.Name
		TemplateClone.BackgroundColor = BrickColor.new(v.Name)
		TemplateClone.Parent = ColorsList
	end
end)
WallColorButton.MouseButton1Down:Connect(function()
	OwnedLabel.Visible = true
	ColorsList.Visible = true
	-- destroy stuff in OwnedColors
	DestroyTemplateClones()
	-- clone the stuff into OwnedColors
	for i, v in pairs(ColorInventory:GetChildren()) do
		local TemplateClone = Template:Clone()
		TemplateClone.Visible = true
		TemplateClone.Name = "Wall_"..v.Name
		TemplateClone.BackgroundColor = BrickColor.new(v.Name)
		TemplateClone.Parent = ColorsList
	end
end)
-- textures
Color1TextureButton.MouseButton1Down:Connect(function()
	OwnedLabel.Visible = true
	ColorsList.Visible = true
	-- destroy stuff in OwnedColors
	DestroyTemplateClones()
	-- clone the stuff into OwnedColors
	for i, TextureID in pairs(TexturesInventory:GetChildren()) do
		local TemplateClone = Template:Clone()
		TemplateClone.Visible = true
		TemplateClone.Name = "Color1T_"..TextureID.Name
		TemplateClone.Image = TextureID.Name
		TemplateClone.Parent = ColorsList
		TemplateClone.ImageTransparency = 0.7
	end
end)
Color2TextureButton.MouseButton1Down:Connect(function()
	OwnedLabel.Visible = true
	ColorsList.Visible = true
	-- destroy stuff in OwnedColors
	DestroyTemplateClones()
	-- clone the stuff into OwnedColors
	for i, TextureID in pairs(TexturesInventory:GetChildren()) do
		local TemplateClone = Template:Clone()
		TemplateClone.Visible = true
		TemplateClone.Name = "Color2T_"..TextureID.Name
		TemplateClone.Image = TextureID.Name
		TemplateClone.Parent = ColorsList
		TemplateClone.ImageTransparency = 0.7
	end
end)
FloorTextureButton.MouseButton1Down:Connect(function()
	OwnedLabel.Visible = true
	ColorsList.Visible = true
	-- destroy stuff in OwnedColors
	DestroyTemplateClones()
	-- clone the stuff into OwnedColors
	for i, TextureID in pairs(TexturesInventory:GetChildren()) do
		local TemplateClone = Template:Clone()
		TemplateClone.Visible = true
		TemplateClone.Name = "BuildableFloorT_"..TextureID.Name
		TemplateClone.Image = TextureID.Name
		TemplateClone.Parent = ColorsList
		TemplateClone.ImageTransparency = 0.7
	end
end)

UpdateUIBindable.Event:Connect(function()
	OwnedLabel.Visible = false
	ColorsList.Visible = false
	wait(0.25)
	UpdateFullUi()
end)