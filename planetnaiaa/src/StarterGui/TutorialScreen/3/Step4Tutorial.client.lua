local Text1 = "Press the menu button to find the Star pass, quests, and more!"

local function typeWrite(object, text)
	for i = 1, #text, 1 do
		object.Text = string.sub(text, 1, i)
		wait(0.05)
	end
end

local IncreaseStepNum = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Tutorial"):WaitForChild("IncreaseStepNum")

local ScreenGui = script.Parent.Parent.Parent:WaitForChild("ScreenGui")
local Arrow = script.Parent:WaitForChild("Arrow")
local done = false
script.Parent.Changed:Connect(function()
	if script.Parent.Visible then
		typeWrite(script.Parent:WaitForChild("Text"), Text1)
		wait(1)
		local MenuBut = ScreenGui.FullMenuFrame.BaseUi.OpenMenuButton
		Arrow.Visible = true
		local pressed = false
		MenuBut.MouseButton1Down:Connect(function()
			if done then return end
			if Arrow.Visible then
				if pressed then
					wait(math.random(0, 10)/100)
					done = true
					IncreaseStepNum:FireServer()
				end
				pressed = true
				for i, v in pairs(script.Parent:GetChildren()) do
					if v.Name ~= "Arrow" and not v:IsA("Script")then
						v.Visible = false
					end
				end
				
			end
		end)
	end
end)