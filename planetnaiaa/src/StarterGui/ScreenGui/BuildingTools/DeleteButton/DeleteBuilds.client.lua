local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera

local UIS = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local rep = game.ReplicatedStorage
local RemoveBuildEvent = rep:WaitForChild("Remotes"):WaitForChild("RemoveBuildEvent")

local DeletingModelPart = game.Workspace:WaitForChild("DeletingModelPart")

isDeleting = false
local deleteButton = script.Parent
local RotateButton = script.Parent.Parent:WaitForChild("RotateButton")
local BuildAndInv = script.Parent.Parent.Parent:WaitForChild("BuildAndInv")
local ScrollingFrame = BuildAndInv:WaitForChild("BuildInventory"):WaitForChild("ScrollingFrame")
local Xbutton = script.Parent.Parent:WaitForChild("Xbutton")
local ConfirmButton = script.Parent.Parent:WaitForChild("ConfirmButton")

local function UpdateCanvasSize(Canvas, Constraint)
	Canvas.CanvasSize = UDim2.new(0, Constraint.AbsoluteContentSize.X, 0, Constraint.AbsoluteContentSize.Y)
end

script.Parent.MouseButton1Down:Connect(function()
	isDeleting = true
	deleteButton.Visible = false
	RotateButton.Visible = false
	BuildAndInv.Visible = false
end)

Xbutton.MouseButton1Down:Connect(function()
	if not isDeleting then return end
	isDeleting = false
	deleteButton.Visible = true
	RotateButton.Visible = true
	BuildAndInv.Visible = true
	DeletingModelPart.Position = Vector3.new(0, 0, 0)
end)

local function getMousePoint(X, Y)

	local rayCastParams = RaycastParams.new()
	rayCastParams.FilterType = Enum.RaycastFilterType.Blacklist
	rayCastParams.FilterDescendantsInstances = {DeletingModelPart}
	rayCastParams.IgnoreWater = true

	local camray = camera:ScreenPointToRay(X, Y)

	local raycastResult = game.Workspace:Raycast(camray.Origin, camray.Direction*2048, rayCastParams)

	if not raycastResult then return end

	return raycastResult.Instance, raycastResult.Position
end

UIS.InputBegan:Connect(function(input, gameprocessed)

	if gameprocessed then return end
	
	if isDeleting and input.UserInputType == Enum.UserInputType.MouseButton1 then

		local mouseLocation = player:GetMouse()
		local target, position = getMousePoint(mouseLocation.X, mouseLocation.Y)

		if target and position then
			if DeletingModelPart.Size ~= Vector3.new(0.3, 0.3, 0.3) then
				DeletingModelPart.Size = Vector3.new(0.3, 0.3, 0.3)
			end
			DeletingModelPart.Position = position
			if rep.Buildables:FindFirstChild(tostring(target.Parent)) then
				if target.Parent:IsA("Model") then
					local orientation, size = target.Parent:GetBoundingBox()
					DeletingModelPart.Size = size + Vector3.new(0.1, 0.1, 0.1)
					DeletingModelPart.CFrame = orientation
					RemoveBuildEvent:FireServer(target.Parent)
					-- update UI
					wait(0.15)
					for i, v in pairs(BuildAndInv:GetChildren()) do
						if v:IsA("TextButton") then
							-- make colors black (unpressed)
							v.BackgroundColor3 = Color3.new(0.105882, 0.164706, 0.207843)
							v.Visible = true
							if v.Name == "All" then
								-- make the "ALL" button activated (yellow)
								v.BackgroundColor3 = Color3.new(1, 0.796078, 0.054902)
							end
						end
					end

					-- delete the stuff already there
					for i, v in pairs(ScrollingFrame:GetChildren()) do
						print(v)
						if v:IsA("ImageButton") and v.Name ~= "Template" then 
							print("destroying "..tostring(v))
							v:Destroy()
						end
					end
					-- clone the stuff
					for Number, Item in pairs(player.Inventory:GetChildren()) do
						if Item:IsA("Folder") == false then

							local TemplateClone = ScrollingFrame.Template:Clone()
							TemplateClone.Name = Item.Name
							TemplateClone.Parent = ScrollingFrame
							TemplateClone.Visible = true
							TemplateClone.Count.Text = "x"..tostring(Item:GetAttribute("Count"))
							TemplateClone:WaitForChild("TemplateSetStuff").Disabled = false

							UpdateCanvasSize(ScrollingFrame, ScrollingFrame.UIListLayout)
						end
					end
				end
			end
		end
	end
end)

ConfirmButton.MouseButton1Down:Connect(function()
	if isDeleting then
		local mouseLocation = player:GetMouse()
		local target, position = getMousePoint(mouseLocation.X, mouseLocation.Y)

		if target and position then
			
			if DeletingModelPart.Size ~= Vector3.new(0.3, 0.3, 0.3) then
				DeletingModelPart.Size = Vector3.new(0.3, 0.3, 0.3)
			end
			DeletingModelPart.Position = position
			if rep.Buildables:FindFirstChild(tostring(target.Parent)) then

				if target.Parent:IsA("Model") then

					local orientation, size = target.Parent:GetBoundingBox()
					DeletingModelPart.Size = size + Vector3.new(0.1, 0.1, 0.1)
					DeletingModelPart.CFrame = orientation
					RemoveBuildEvent:FireServer(target.Parent)
					
					-- update UI
					wait(0.15)
					for i, v in pairs(BuildAndInv:GetChildren()) do
						if v:IsA("TextButton") then
							-- make colors black (unpressed)
							v.BackgroundColor3 = Color3.new(0.105882, 0.164706, 0.207843)
							v.Visible = true
							if v.Name == "All" then
								-- make the "ALL" button activated (yellow)
								v.BackgroundColor3 = Color3.new(1, 0.796078, 0.054902)
							end
						end
					end

					-- delete the stuff already there
					for i, v in pairs(ScrollingFrame:GetChildren()) do
	
						if v:IsA("ImageButton") and v.Name ~= "Template" then 
						
							v:Destroy()
						end
					end
					-- clone the stuff
					for Number, Item in pairs(player.Inventory:GetChildren()) do
						if Item:IsA("Folder") == false then

							local TemplateClone = ScrollingFrame.Template:Clone()
							TemplateClone.Name = Item.Name
							TemplateClone.Parent = ScrollingFrame
							TemplateClone.Visible = true
							TemplateClone.Count.Text = "x"..tostring(Item:GetAttribute("Count"))
							TemplateClone:WaitForChild("TemplateSetStuff").Disabled = false

							UpdateCanvasSize(ScrollingFrame, ScrollingFrame.UIListLayout)
						end
					end
				end
			end
		end
	end
end)

runService.RenderStepped:Connect(function()
	
	if not isDeleting then return end
	
	local mouseLocation = player:GetMouse()
	local target, position = getMousePoint(mouseLocation.X, mouseLocation.Y)

	if target and position then
		if DeletingModelPart.Size ~= Vector3.new(0.3, 0.3, 0.3) then
			DeletingModelPart.Size = Vector3.new(0.3, 0.3, 0.3)
		end
		DeletingModelPart.Position = position
		if rep.Buildables:FindFirstChild(tostring(target.Parent)) then
			if target.Parent:IsA("Model") then
				local orientation, size = target.Parent:GetBoundingBox()
				DeletingModelPart.Size = size + Vector3.new(0.1, 0.1, 0.1)
				DeletingModelPart.CFrame = orientation
			end
		end
	end
end)