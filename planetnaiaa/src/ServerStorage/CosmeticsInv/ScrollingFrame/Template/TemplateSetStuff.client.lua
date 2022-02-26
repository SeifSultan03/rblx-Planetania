local Template = script.Parent
local rep = game:GetService("ReplicatedStorage")

local object = rep.Accessories:WaitForChild(tostring(Template.Name))
local VPF = script.Parent.ViewportFrame
local RarityImagesModule = require(rep.Modules.RarityTemplates)
local player = game.Players.LocalPlayer
local BindableEvent = rep:WaitForChild("Remotes"):WaitForChild("PlayerScreenBindable")

local ItemRarity = object:GetAttribute("Rarity")
Template.Image = RarityImagesModule[ItemRarity]
objClone = object:Clone()
objClone.Parent = VPF
local VPFcam = Instance.new("Camera")
VPF.CurrentCamera = VPFcam
VPFcam.Parent = VPF
local maxLength = math.max(object.Size.X, object.Size.Z)/2
VPFcam.CFrame = CFrame.new(object.Position + Vector3.new(0, maxLength/math.tan(math.rad(35)) + object.Size.Y/2, 0), object.Position)

script.Parent.MouseButton1Down:Connect(function()
	rep.Remotes.ChangePlayerClothes:FireServer(Template.Name)
	BindableEvent:Fire()
end)
