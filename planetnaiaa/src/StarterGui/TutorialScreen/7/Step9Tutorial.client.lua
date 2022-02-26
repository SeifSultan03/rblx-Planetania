local Text1 = "Press the house upgrades button to make your house bigger"
local Text2 = "Now press the 100 buckies button to do some progress"
local function typeWrite(object, text)
	for i = 1, #text, 1 do
		object.Text = string.sub(text, 1, i)
		wait(0.045)
	end
end

local IncreaseStepNum = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Tutorial"):WaitForChild("IncreaseStepNum")

local ScreenGui = script.Parent.Parent.Parent:WaitForChild("ScreenGui")
local Arrow = script.Parent:WaitForChild("Arrow")
local Arrow2 = script.Parent:WaitForChild("Arrow2")

script.Parent.Changed:Connect(function()
	if script.Parent.Visible then
		typeWrite(script.Parent:WaitForChild("Text"), Text1)
		wait(1)
		local UpgradesButton = ScreenGui.HouseUpgrades.BaseUi.ImageButton
		local BuyButton = UpgradesButton.Parent.Parent.HouseUI.Plus100
		Arrow.Visible = true
		local done = false
		local typeWritten = 0
		UpgradesButton.MouseButton1Down:Connect(function()
			if done then return end
			typeWritten += 1
			if typeWritten <= 1 then
				typeWrite(script.Parent:WaitForChild("Text"), Text2)
			end
			
			if Arrow.Visible then
				Arrow.Visible = false
				Arrow2.Visible = true
			else
				Arrow.Visible = true
				Arrow2.Visible = false
			end
			
			BuyButton.MouseButton1Down:Connect(function()
				wait(math.random(0, 10)/100)
				if done then return end
				done = true
				IncreaseStepNum:FireServer()
			end)
			
		end)
	end
end)