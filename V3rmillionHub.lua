wait(2)
local players = game:GetService("Players")
local lplayer = players.LocalPlayer
local background = Color3.fromRGB(0,0,0)
local highlight = Color3.fromRGB(72, 72, 72)
local v3rmhub = Instance.new("ScreenGui")
v3rmhub.Parent = lplayer.PlayerGui
v3rmhub.Enabled = true
v3rmhub.ResetOnSpawn = false
v3rmhub.Name = "v3rmhub"


local function Load()
	local loading =  Instance.new("Frame")
	loading.Parent = v3rmhub
	local label = Instance.new("TextLabel")
	label.Text = "Loading V3rmHub"
	label.Size = UDim2.new(0,100,0,100)
	label.BackgroundTransparency = 10
	label.Parent = loading
	label.TextSize = 20
	label.Position = UDim2.new(0,100,0,0)
	loading.Position = UDim2.new(0,550,0,300)
	local smooth = Instance.new("UICorner")
	smooth.Parent = loading
	smooth.CornerRadius = UDim.new(0,15)
	loading.BackgroundColor3 = background
	loading.Active = true
	loading.Size = UDim2.new(0,300,0,100)
	local bar = Instance.new("TextButton")
	bar.Size = UDim2.new(0,290,0,20)
	bar.Parent = loading
	local corner = Instance.new("UICorner")
	corner.Parent = bar
	corner.CornerRadius = UDim.new(0,100)
	bar.Text = ""
	bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	bar.Position = UDim2.new(0,5,0,75)
	local bar2 = Instance.new("TextButton")
	bar2.Size = UDim2.new(0,0,0,10)
	bar2.Parent = bar
	local corner2 = Instance.new("UICorner")
	corner2.Parent = bar2
	corner2.CornerRadius = UDim.new(0,100)
	bar2.Text = ""
	bar2.BackgroundColor3 = Color3.fromRGB(11, 225, 0)
	for i=0, 290, 1 do
		wait()
		bar2.Size = UDim2.new(0,i,0,20)
	end
	wait(2)
	loading:Destroy()
end
Load()
local v3rmhub_central = Instance.new("Frame")
v3rmhub_central.Parent = v3rmhub
v3rmhub_central.Draggable = true
v3rmhub_central.BackgroundColor3 = background
v3rmhub_central.Active = true
v3rmhub_central.Size = UDim2.new(0,400,0,400)
local function homebutton() 
	local button = Instance.new("TextButton")
	button.Name = "homebutton"
	button.Parent = v3rmhub_central
	local corner = Instance.new("UICorner")
	corner.Parent = button
	corner.CornerRadius = UDim.new(0,10)
	button.Text = "homebutton"
	button.BackgroundColor3 = background
	button.TextColor = BrickColor.new("White")
	button.Size = UDim2.new(0,80,0,40)
	button.Position = UDim2.new(0,0,0,0)
	button.MouseButton1Click:Connect(function() 
		for i,v in pairs(v3rmhub_central:GetChildren()) do
			if v:IsA("ScrollingFrame") then
				v.Active = false
				v.Visible = false
				v3rmhub_central.Draggable = true
				v3rmhub_central.Active = true
			end
		end
	end)
	
end
homebutton()

local function makepagebutton(name,location,text)
	local button = Instance.new("TextButton")
	button.Name = name
	button.Parent = v3rmhub_central
	local corner = Instance.new("UICorner")
	corner.Parent = button
	corner.CornerRadius = UDim.new(0,10)
	button.Text = text
	button.BackgroundColor3 = background
	button.TextColor = BrickColor.new("White")
	button.Size = UDim2.new(0,80,0,40)
	button.Position = location
	local newpage = Instance.new("ScrollingFrame")
	newpage.Size = UDim2.new(0,300, 0, 399)
	newpage.Active = false
	newpage.Visible = false
	newpage.Name = name.."page"
	newpage.BackgroundColor3 = background
	newpage.Parent = v3rmhub_central
	newpage.Position = UDim2.new(0,100, 0, 0)
	--newpage.Draggable = true
	local layout = Instance.new("UIListLayout")
	layout.Parent = newpage
	layout.Padding = UDim.new(0,5)
	button.MouseButton1Click:Connect(function()
		for i,v in pairs(v3rmhub_central:GetChildren()) do
			if v:IsA("ScrollingFrame") and v.Name ~= button.Name.."page" then
				v.Active = false
				v.Visible = false
				v3rmhub_central.Draggable = true
				v3rmhub_central.Active = true
			else
				v.Active = true
				v.Visible = true
				--v.Draggable = true
				v3rmhub_central.Draggable = true
				v3rmhub_central.Active = true

			end

		end
	end)
	
	
	
end

makepagebutton("basicbutton",UDim2.new(0,0,0,60),"Basic cheats")
makepagebutton("basicbutton2",UDim2.new(0,0,0,160),"other cheats")
makepagebutton("scripts",UDim2.new(0,0,0,240),"Scripts")



local function makebutton(name,page,text,func)
	local button = Instance.new("TextButton")
	button.Name = name
	button.Parent = v3rmhub_central:FindFirstChild(page)
	local corner = Instance.new("UICorner")
	corner.Parent = button
	corner.CornerRadius = UDim.new(0,10)
	button.Text = text
	button.BackgroundColor3 = background
	button.TextColor = BrickColor.new("White")
	button.Size = UDim2.new(0,120,0,40)
	button.Position = UDim2.new(0,0,0,0)

	button.MouseButton1Click:Connect(func)
	button.MouseEnter:Connect(function()
		button.BackgroundColor3 = highlight
	end)
	button.MouseLeave:Connect(function()
		button.BackgroundColor3 = background
	end)
	
end


local function maketogglebutton(name,page,text,var,func,func2)
	local button = Instance.new("TextButton")
	button.Name = name
	button.Parent = v3rmhub_central:FindFirstChild(page)
	local corner = Instance.new("UICorner")
	corner.Parent = button
	corner.CornerRadius = UDim.new(0,10)
	button.Text = text
	button.BackgroundColor3 = background
	button.TextColor = BrickColor.new("White")
	button.Size = UDim2.new(0,120,0,40)
	button.Position = UDim2.new(0,0,0,0)
	local otherbutton = Instance.new("TextButton")
	otherbutton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	otherbutton.Parent = button
	otherbutton.Position = UDim2.new(0,140,0,10)
	otherbutton.Size = UDim2.new(0,40,0,20)
	local corner2 = Instance.new("UICorner")
	corner2.Parent = otherbutton
	corner2.CornerRadius = UDim.new(0,100)
	otherbutton.Text = ""
	local button3 = Instance.new("TextButton")
	button3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	button3.Parent = otherbutton
	local corner3 = Instance.new("UICorner")
	button3.Size = UDim2.new(0,20,0,20)
	corner3.Parent = button3
	corner3.CornerRadius = UDim.new(0,100)
	button3.Text = ""
	local bolean1 = false
	
	
	
	
	button.MouseButton1Click:Connect(function()
		--print(bolean)
		if bolean1 == false then
			bolean1 = true
			
			
			button3:TweenPosition(UDim2.new(0,20,0,0), "Out", "Linear", 0.2, false)
			otherbutton.BackgroundColor3 = Color3.fromRGB(65, 255, 32)
			func()
			
			
		
			--UDim2.new(0,40,0,0)
		
		elseif bolean1 == true then
			otherbutton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			bolean1 = false
			
			button3:TweenPosition(UDim2.new(0,0,0,0), "In", "Linear", 0.2, false)
			func2()
			


			--UDim2.new(0,40,0,0)
		end
		return bolean1
		
	end)
	button.MouseEnter:Connect(function()
		button.BackgroundColor3 = highlight
	end)
	button.MouseLeave:Connect(function()
		button.BackgroundColor3 = background
	end)
	

end

--Enum.EasingStyle.




local waypoint = CFrame.new()




local function x() 
	print("2")
end
makebutton("lolbutton","basicbuttonpage","print something", function() print('2') end)





maketogglebutton("lol","basicbuttonpage","walkspeed",thing,function()
	lplayer.Character.Humanoid.WalkSpeed = 200
	
	
	
end,
	function() 
		lplayer.Character.Humanoid.WalkSpeed = 16 
	
	end)

maketogglebutton("jump", "basicbuttonpage","jump boost",on, function()
	lplayer.Character.Humanoid.JumpPower = 200
end, 
	function() 
		lplayer.Character.Humanoid.JumpPower = 50
	end)

maketogglebutton("maxhp","basicbuttonpage","infinite health",on, function()
	lplayer.Character.Humanoid.MaxHealth = math.huge
	lplayer.Character.Humanoid.Health = math.huge
	
end,
	function()
		lplayer.Character.Humanoid.Health = 100
		lplayer.Character.Humanoid.MaxHealth = 100
	end)
	





makebutton("waypoint","basicbuttonpage", "drop waypoint", function()
	waypoint = lplayer.Character.HumanoidRootPart.CFrame
end)

makebutton("waypointpt","basicbuttonpage", "teleport to waypoint", function()
	lplayer.Character.HumanoidRootPart.CFrame = waypoint
end)

makebutton("InfiniteYield","scriptspage","Infinite Yield", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source', true))()
end)
