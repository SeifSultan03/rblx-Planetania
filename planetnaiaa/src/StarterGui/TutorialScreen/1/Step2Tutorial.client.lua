local Text1 = "Welcome to Planetania, the world of imagination. Whether you want to have fun and play minigames or build your house you will enjoy!"

local nextButton = script.Parent:WaitForChild("NextButton")

local function typeWrite(object, text)
	for i = 1, #text, 1 do
		object.Text = string.sub(text, 1, i)
		wait(0.05)
	end
end

script.Parent.Changed:Connect(function()
	if script.Parent.Visible then
		typeWrite(script.Parent:WaitForChild("Text"), Text1)
		wait(1)
		nextButton.Visible = true
	end
end)