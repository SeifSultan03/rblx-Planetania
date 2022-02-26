local Template = script.Parent
local rep = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer
local object = rep.Buildables:WaitForChild(tostring(Template.Name))
local objectInInventory = player.Inventory:FindFirstChild(Template.Name)
local VPF = script.Parent.ViewportFrame
local RarityImagesModule = require(rep.Modules.RarityTemplates)
local char = player.Character or player.CharacterAdded:Wait()

local ItemRarity = object:GetAttribute("Rarity")
Template.Image = RarityImagesModule[ItemRarity]
local VPFcam = Instance.new("Camera")
VPF.CurrentCamera = VPFcam
VPFcam.Parent = VPF

for i, v in pairs(object:GetChildren()) do
	vClone = v:Clone()
	vClone.Parent = VPF
end

local maxLength = math.max(object:GetExtentsSize().Z, object:GetExtentsSize().Y)/2
local CenterCF = object:GetBoundingBox()
VPFcam.CFrame = CFrame.new(CenterCF.p + Vector3.new( maxLength/math.tan(math.rad(35)) + object:GetExtentsSize().Z/2, object:GetExtentsSize().Y/1.3, 0), CenterCF.p)

local ScrollingFrame = script.Parent.Parent
local function UpdateCanvasSize(Canvas, Constraint)
	Canvas.CanvasSize = UDim2.new(0, Constraint.AbsoluteContentSize.X, 0, Constraint.AbsoluteContentSize.Y)
end

--============================ now to the useful stuff
local BuildTools = Template.Parent.Parent.Parent.Parent:WaitForChild("BuildingTools")
local deleteButton = BuildTools:WaitForChild("DeleteButton")
local Xbutton = BuildTools:WaitForChild("Xbutton")
local RotateButton = BuildTools:WaitForChild("RotateButton")
local BuildAndInv = Template.Parent.Parent.Parent
local ConfirmButton = BuildTools:WaitForChild("ConfirmButton")

local Placing = false

local BuildAndInv = Template.Parent.Parent.Parent

local green = Color3.new(0, 1, 0.0823529)
local red = Color3.new(1, 0, 0.0156863)

local objectClone
Template.MouseButton1Down:Connect(function()
	-- hide the inventory and turn placing on
	deleteButton.Visible = false
	BuildAndInv.Visible = false
	Placing = true
	-- object clone stuff
	objectClone = object:Clone()
	objectClone.Parent = game.Workspace:WaitForChild("ClonesClientSide")
	for i, partsInModel in pairs(objectClone:GetChildren()) do
		partsInModel.CanCollide = false
		partsInModel.Color = green 
		partsInModel.Transparency = 0.4
	end
end)

local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera

local UIS = game:GetService("UserInputService")
local runService = game:GetService("RunService")

local placeEvent = rep.Remotes.PlaceItemEvent

Xbutton.MouseButton1Down:Connect(function()
	if not Placing then return end
	Placing = false
	deleteButton.Visible = true
	RotateButton.Visible = true
	BuildAndInv.Visible = true
	objectClone:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))
	for i, v in pairs(game.Workspace.ClonesClientSide:GetChildren()) do
		print("Destroying stuff from clientSide,", v )
		v:Destroy()
	end
	
	-- update inventory UI
	wait(0.25)
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
	
end)

local GridSize = 2

local changeGridButton = BuildTools:WaitForChild("GridSize"):WaitForChild("ChangeGridSize")
local textBox = BuildTools:WaitForChild("GridSize"):WaitForChild("TextBox")

local MarketPlaceService = game:GetService("MarketplaceService")
local GamepassId = 26472093

local function promptPurchase()
	local player = game.Players.LocalPlayer
	local hasPass = false

	local success, message = pcall(function()
		hasPass = MarketPlaceService:UserOwnsGamePassAsync(player.UserId, GamepassId)
	end)

	if hasPass == true  then
		print("player already has the gamepass")
	else
		MarketPlaceService:PromptGamePassPurchase(player, GamepassId)
	end
end

changeGridButton.MouseButton1Down:Connect(function()
	local OwnsGridSize = player.leaderstats:GetAttribute("OwnsGridSize")
	if OwnsGridSize then
		if tonumber(textBox.Text) and tonumber(textBox.Text) > 0 and tonumber(textBox.Text) <= 10 then
			GridSize = tonumber(textBox.Text)
		end
	else
		changeGridButton.BackgroundColor3 = red
		changeGridButton.Text = "Grid Size gamepass needed"
		wait(1)
		promptPurchase()
		changeGridButton.BackgroundColor3 = green
		changeGridButton.Text = "Change"
	end
end)

local angleRotation = 0
local previousGood = true
local modeAdd = false
local BeforePreviousGood = false
local function getMousePoint(X, Y, IgnoreList)
	
	local rayCastParams = RaycastParams.new()
	rayCastParams.FilterType = Enum.RaycastFilterType.Blacklist
	rayCastParams.FilterDescendantsInstances = {objectClone}
	rayCastParams.IgnoreWater = true
	
	local camray = camera:ScreenPointToRay(X, Y)
	
	local raycastResult = game.Workspace:Raycast(camray.Origin, camray.Direction*2048, rayCastParams)
	
	if not raycastResult then return end
	
	local xPos = raycastResult.Position.X
	local yPos = raycastResult.Position.Y
	local zPos = raycastResult.Position.Z
	
	if previousGood then
		if modeAdd then
			xPos += (GridSize - (xPos % GridSize))
			yPos -= (yPos % GridSize)
			zPos += (GridSize - (zPos % GridSize))
		else
			xPos -= (xPos % GridSize)
			yPos -= (yPos % GridSize)
			zPos -= (zPos % GridSize)
		end
	elseif BeforePreviousGood then
		-- switch
		if not modeAdd then
			xPos += (GridSize - (xPos % GridSize))
			yPos -= (yPos % GridSize)
			zPos += (GridSize - (zPos % GridSize))
			modeAdd = true
		else
			xPos -= (xPos % GridSize)
			yPos -= (yPos % GridSize)
			zPos -= (zPos % GridSize)
			modeAdd = false
		end
	else
		xPos -= (xPos % GridSize)
		yPos -= (yPos % GridSize)
		zPos -= (zPos % GridSize)
		modeAdd = false
	end
	
	local position = Vector3.new(xPos, yPos, zPos)
	
	
	return raycastResult.Instance, position
	-- return raycastResult.Instance, raycastResult.Position
end

-- PC
local function rotate()
	angleRotation += math.rad(45)
end
UIS.InputBegan:Connect(function(input, gameprocessed)
	
	if gameprocessed then return end
	
	
	if Placing then
		-- if its a click
		if input.KeyCode == Enum.KeyCode.R then
			rotate()
		end
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			-- get mouse location
			--local mouseLocation = UIS:GetMouseLocation()
			local mouseLocation = player:GetMouse()
			
			local target, position = getMousePoint(mouseLocation.X, mouseLocation.Y, {objectClone})
			
			if target and position then
				
				objectClone:SetPrimaryPartCFrame(CFrame.new(position) * CFrame.Angles(0, angleRotation, 0))

				local params = OverlapParams.new()
				params.MaxParts = math.huge
				params.FilterType = Enum.RaycastFilterType.Blacklist
				-- ignore stuff
				local IgnoreTable = {}
				table.insert(IgnoreTable, game.Workspace.Locations:FindFirstChild(player.Name.."Location"))
				for i, v in pairs(game.Workspace:FindFirstChild(player.Name.."f"):GetDescendants()) do
					if string.match(v.Name, "Color") then
						table.insert(IgnoreTable, v)
					end
				end
				params.FilterDescendantsInstances = IgnoreTable
				-- the parts in box ignoring the parts in model
				local partsInBox = game.Workspace:GetPartBoundsInBox(objectClone.PrimaryPart.CFrame, objectClone:GetExtentsSize(),params)
				print(partsInBox)
				-- checking if colliding
				local IsColliding = false
				for index, partInBox in pairs(partsInBox) do
					-- if partInBox.Parent ~= objectClone and partInBox.Name ~= target.Name then
					if partInBox.Parent ~= objectClone and not string.match(partInBox.Parent.Name, "Buildable") and not string.match(target.Parent.Name, "Lvl") then
						print("part:", partInBox, "is collidin with the model which its class is:", partInBox.ClassName)
						IsColliding = true
					end
				end
				if string.match(target.Name, "Buildable") and objectClone.PrimaryPart.Position.Y >= 0 and not IsColliding and target.Parent.Parent.Name == player.Name.."f" and target.Parent.Parent:IsA("Folder")then
					-- it is buildable so make the objects green
					for i, partsInModel in pairs(objectClone:GetChildren()) do
						partsInModel.Color = green
					end
					placeEvent:FireServer(target, objectClone.PrimaryPart.CFrame, objectClone.Name)
					objectClone:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))
					
					if player.Inventory:FindFirstChild(objectClone.Name) and player.Inventory:FindFirstChild(objectClone.Name):GetAttribute("Count") == 1 then
						deleteButton.Visible = true
						BuildAndInv.Visible = true
						Placing = false
						
						-- update inventory UI
						wait(0.25)
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
						-- destroy the clones from client side
						for i, v in pairs(game.Workspace.ClonesClientSide:GetChildren()) do
							print("Destroying stuff from clientSide,", v )
							v:Destroy()
						end
					end
				else
					-- its not buildable so make it red
					for i, partsInModel in pairs(objectClone:GetChildren()) do
						partsInModel.Color = red
					end
				end
				
			end
			print(target, position)
		end
	end
end)

-- MOBILE
ConfirmButton.MouseButton1Down:Connect(function()
	if Placing then
		-- get mouse location
		-- local mouseLocation = UIS:GetMouseLocation()
		local mouseLocation = player:GetMouse()
		
		local target, position = getMousePoint(mouseLocation.X, mouseLocation.Y, {objectClone})

		if target and position then

			objectClone:SetPrimaryPartCFrame(CFrame.new(position) * CFrame.Angles(0, angleRotation, 0))

			local params = OverlapParams.new()
			params.MaxParts = math.huge
			params.FilterType = Enum.RaycastFilterType.Blacklist
			-- ignore stuff
			local IgnoreTable = {}
			table.insert(IgnoreTable, game.Workspace.Locations:FindFirstChild(player.Name.."Location"))
			for i, v in pairs(game.Workspace:FindFirstChild(player.Name.."f"):GetDescendants()) do
				if string.match(v.Name, "Color") then
					table.insert(IgnoreTable, v)
				end
			end
			params.FilterDescendantsInstances = IgnoreTable
			-- the parts in box ignoring the parts in model
			local partsInBox = game.Workspace:GetPartBoundsInBox(objectClone.PrimaryPart.CFrame, objectClone:GetExtentsSize(),params)
			print(partsInBox)
			-- checking if colliding
			local IsColliding = false
			for index, partInBox in pairs(partsInBox) do
				if partInBox.Parent ~= objectClone and not string.match(partInBox.Parent.Name, "Buildable") and not string.match(target.Parent.Name, "Lvl") then
					print("part:", partInBox, "is collidin with the model which its class is:", partInBox.ClassName)
					IsColliding = true
				end
			end
			if string.match(target.Name, "Buildable") and objectClone.PrimaryPart.Position.Y >= 0 and not IsColliding and target.Parent.Parent.Name == player.Name.."f" and target.Parent.Parent:IsA("Folder")then
				-- it is buildable so make the objects green
				for i, partsInModel in pairs(objectClone:GetChildren()) do
					partsInModel.Color = green
				end
				placeEvent:FireServer(target, objectClone.PrimaryPart.CFrame, objectClone.Name)
				objectClone:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))

				if player.Inventory:FindFirstChild(objectClone.Name) and player.Inventory:FindFirstChild(objectClone.Name):GetAttribute("Count") == 1 then
					deleteButton.Visible = true
					BuildAndInv.Visible = true
					Placing = false

					-- update inventory UI
					wait(0.25)
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
					-- destroy the clones from client side
					for i, v in pairs(game.Workspace.ClonesClientSide:GetChildren()) do
						print("Destroying stuff from clientSide,", v )
						v:Destroy()
					end
				end
			else
				-- its not buildable so make it red
				for i, partsInModel in pairs(objectClone:GetChildren()) do
					partsInModel.Color = red
				end
			end
		end
		print(target, position)
	end
end)

runService.RenderStepped:Connect(function()
	if not Placing then return end
	
	-- local mouseLocation = UIS:GetMouseLocation()
	local mouseLocation = player:GetMouse()
	
	local target, position = getMousePoint(mouseLocation.X, mouseLocation.Y, {objectClone})
	if target and position then
		objectClone:SetPrimaryPartCFrame(CFrame.new(position) * CFrame.Angles(0, angleRotation, 0))
		
		local params = OverlapParams.new()
		params.MaxParts = math.huge
		params.FilterType = Enum.RaycastFilterType.Blacklist
		-- ignore stuff
		local IgnoreTable = {}
		table.insert(IgnoreTable, game.Workspace.Locations:FindFirstChild(player.Name.."Location"))
		for i, v in pairs(game.Workspace:FindFirstChild(player.Name.."f"):GetDescendants()) do
			if string.match(v.Name, "Color") then
				table.insert(IgnoreTable, v)
			end
		end
		params.FilterDescendantsInstances = IgnoreTable
		-- the parts in box ignoring the parts in model
		local partsInBox = game.Workspace:GetPartBoundsInBox(objectClone.PrimaryPart.CFrame, objectClone:GetExtentsSize(),params)
		-- checking if colliding
		local IsColliding = false
		for index, partInBox in pairs(partsInBox) do
			if partInBox.Parent ~= objectClone and not string.match(partInBox.Parent.Name, "Buildable") and not string.match(target.Parent.Name, "Lvl") then
				IsColliding = true
			end
		end
		if string.match(target.Name, "Buildable") and objectClone.PrimaryPart.Position.Y >= 0 and not IsColliding and target.Parent.Parent.Name == player.Name.."f" and target.Parent.Parent:IsA("Folder")then
			-- it is buildable so make the objects green
			for i, partsInModel in pairs(objectClone:GetChildren()) do
				partsInModel.Color = green
			end
			if previousGood then
				BeforePreviousGood = true
			end
			previousGood = true
		else
			-- its not buildable so make it red
			for i, partsInModel in pairs(objectClone:GetChildren()) do
				partsInModel.Color = red
			end
			if not previousGood then
				BeforePreviousGood = false
			end
			previousGood = false
		end
	end
end)

RotateButton.MouseButton1Down:Connect(function()
	rotate()
end)