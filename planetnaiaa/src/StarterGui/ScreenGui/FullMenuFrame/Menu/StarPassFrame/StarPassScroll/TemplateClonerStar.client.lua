local template = script.Parent:WaitForChild("Template")
local rep = game:GetService("ReplicatedStorage")
local StarPassItems = rep:WaitForChild("StarPassItems")


for Number, Item in pairs(StarPassItems:WaitForChild("Paid"):GetChildren()) do
	TemplateClone = template:Clone()
	TemplateClone.Name = tostring(Number + 100)
	TemplateClone.Parent = script.Parent
	TemplateClone.Visible = true
	TemplateClone:WaitForChild("TemplateSetStuffPaid").Disabled = false
end