local CodesRemoteFunction = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CodesRemote")

script.Parent.MouseButton1Down:Connect(function()
	local InputText = string.lower(script.Parent.Parent.TextBox.Text)
	local returnVal = CodesRemoteFunction:InvokeServer(InputText)
	
	-- true is correct, false is not found, nil is already claimed
	if returnVal == false then
		script.Parent.Text = "Not Valid"
		script.Parent.BackgroundColor3 = Color3.new(1, 0, 0)
		wait(1)
		script.Parent.Text = "Claim"
		script.Parent.BackgroundColor3 = Color3.new(0.14902, 1, 0)
	elseif returnVal == nil then
		script.Parent.Text = "Already Claimed"
		script.Parent.BackgroundColor3 = Color3.new(1, 0, 0)
		wait(1)
		script.Parent.Text = "Claim"
		script.Parent.BackgroundColor3 = Color3.new(0.14902, 1, 0)
	else
		script.Parent.Text = returnVal
		game.ReplicatedStorage.Sounds.ClaimButton:Play()
		wait(2)
		script.Parent.Text = "Claim"
	end
end)
