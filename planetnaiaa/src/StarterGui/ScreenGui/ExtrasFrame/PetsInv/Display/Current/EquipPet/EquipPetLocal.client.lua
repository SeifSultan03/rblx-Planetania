local EquipRemote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Pets"):WaitForChild("Equip")
local UpdateUI = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Pets"):WaitForChild("UpdateUI")

script.Parent.MouseButton1Down:Connect(function()
	EquipRemote:FireServer(script.Parent.Parent.ViewportFrame:FindFirstChildOfClass("Model").Name)
	script.Parent.Parent.Parent.Visible = false
	UpdateUI:Fire()
end)