local changeColorRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("PlayerSpaceship"):WaitForChild("ChangeColor")
local UpdateUIBindable = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("UpdateColorsUI")

local colorString = script.Parent.Name
local ColorSplitted = string.split(colorString, "_")
local Type = ColorSplitted[1]
local Color = ColorSplitted[2]

local player = game.Players.LocalPlayer
local playerFolder = game.Workspace:WaitForChild(player.Name.."f")
local playerSpaceship
for i, v in pairs(playerFolder:GetChildren()) do
	if string.match(v.Name, "Lvl") then
		playerSpaceship = v
	end
end

local IsTexture = false
if Type ~= "Color1" and Type ~= "Color2" and Type ~= "BuildableFloor" and Type ~= "Wall" then
	-- it is a texture
	Type = string.gsub(Type, ".?$", "") -- remove last letter
	IsTexture = true
end

script.Parent.MouseButton1Down:Connect(function()
	
	changeColorRemote:FireServer(Type, Color, IsTexture)
	UpdateUIBindable:Fire()
end)