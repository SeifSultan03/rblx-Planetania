local Text1 = "Heres 100 free coins as a gift :D"

local nextButton = script.Parent:WaitForChild("NextButton")

local function typeWrite(object, text)
	for i = 1, #text, 1 do
		object.Text = string.sub(text, 1, i)
		wait(0.04)
	end
end

local ScreenGui = script.Parent.Parent.Parent:WaitForChild("ScreenGui")
local CoinsNum = ScreenGui:WaitForChild("XpBarFrame"):WaitForChild("SilverCoinBar"):WaitForChild("SilverCoinNumber")
script.Parent.Changed:Connect(function()
	if script.Parent.Visible then
		CoinsNum.Text = "0"
		typeWrite(script.Parent:WaitForChild("Text"), Text1)
		wait(1)
		CoinsNum.Text = "100"
		game.ReplicatedStorage:WaitForChild("Sounds"):WaitForChild("UpgradinSpaceship"):Play()
		nextButton.Visible = true
	end
end)