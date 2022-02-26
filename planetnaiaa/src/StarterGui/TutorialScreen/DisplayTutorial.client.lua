local rep = game:GetService("ReplicatedStorage")

local startTutorial = rep:WaitForChild("Remotes"):WaitForChild("Gui"):WaitForChild("StartTutorial")

startTutorial.OnClientEvent:Connect(function(stepNum)
	local stepNumString = tostring(stepNum)
	local Frame = script.Parent:FindFirstChild(stepNumString)
	for i, v in pairs(script.Parent:GetChildren()) do
		if v:IsA("Frame") then
			v.Visible = false
			if tonumber(v.Name) < stepNum then
				v:Destroy()
			end
		end
	end
	if Frame then
		Frame.Visible = true
	end
end)