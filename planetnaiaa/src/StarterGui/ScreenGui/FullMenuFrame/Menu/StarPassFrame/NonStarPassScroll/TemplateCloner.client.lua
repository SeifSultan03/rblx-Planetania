local template = script.Parent:WaitForChild("Template")
local rep = game:GetService("ReplicatedStorage")
local StarPassItems = rep.StarPassItems


for Number, Item in pairs(StarPassItems.Free:GetChildren()) do
	TemplateClone = template:Clone()
	TemplateClone.Name = tostring(Number + 100)
	TemplateClone.Parent = script.Parent
	TemplateClone.Visible = true
	TemplateClone:WaitForChild("TemplateSetStuff").Disabled = false
end

