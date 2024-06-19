-- please kill me
local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Stuff = Instance.new("Frame")
local Hover = Instance.new("TextButton")
local speedMode = Instance.new("TextLabel")
local Land = Instance.new("TextButton")
local PS = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0, 0, 0.794270813, 0)
Main.Size = UDim2.new(0.131749466, 0, 0.018229166, 0)
Main.Active = true
Main.Draggable = true


TextLabel.Parent = Main
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(1, 0, 1.07142854, 0)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "TT CAPSULE TYPE 40 MARK 3"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

Stuff.Name = "Stuff"
Stuff.Parent = Main
Stuff.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Stuff.BorderColor3 = Color3.fromRGB(0, 0, 0)
Stuff.BorderSizePixel = 0
Stuff.Position = UDim2.new(0, 0, 1, 0)
Stuff.Size = UDim2.new(1, 0, 10.2857141, 0)

Hover.Name = "Hover"
Hover.Parent = Stuff
Hover.BackgroundColor3 = Color3.fromRGB(85, 0, 0)
Hover.BorderColor3 = Color3.fromRGB(0, 0, 0)
Hover.BorderSizePixel = 0
Hover.Position = UDim2.new(0, 0, 0.0069444445, 0)
Hover.Size = UDim2.new(1, 0, 0.222222224, 0)
Hover.Font = Enum.Font.FredokaOne
Hover.Text = "Hover"
Hover.TextColor3 = Color3.fromRGB(255, 255, 255)
Hover.TextScaled = true
Hover.TextSize = 14.000
Hover.TextWrapped = true

speedMode.Name = "speedMode"
speedMode.Parent = Stuff
speedMode.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
speedMode.BackgroundTransparency = 1.000
speedMode.BorderColor3 = Color3.fromRGB(0, 0, 0)
speedMode.BorderSizePixel = 0
speedMode.Position = UDim2.new(0, 0, 0.75, 0)
speedMode.Size = UDim2.new(1, 0, 0.25, 0)
speedMode.Font = Enum.Font.FredokaOne
speedMode.Text = "Speed Mode : 2"
speedMode.TextColor3 = Color3.fromRGB(255, 255, 255)
speedMode.TextScaled = true
speedMode.TextSize = 14.000
speedMode.TextWrapped = true

Land.Name = "Land"
Land.Parent = Stuff
Land.BackgroundColor3 = Color3.fromRGB(85, 0, 0)
Land.BorderColor3 = Color3.fromRGB(0, 0, 0)
Land.BorderSizePixel = 0
Land.Position = UDim2.new(0, 0, 0.229166672, 0)
Land.Size = UDim2.new(1, 0, 0.222222224, 0)
Land.Font = Enum.Font.FredokaOne
Land.Text = "Land"
Land.TextColor3 = Color3.fromRGB(255, 255, 255)
Land.TextScaled = true
Land.TextSize = 14.000
Land.TextWrapped = true

PS.Name = "PS"
PS.Parent = Stuff
PS.BackgroundColor3 = Color3.fromRGB(85, 0, 0)
PS.BorderColor3 = Color3.fromRGB(0, 0, 0)
PS.BorderSizePixel = 0
PS.Position = UDim2.new(0, 0, 0.451388896, 0)
PS.Size = UDim2.new(1, 0, 0.222222224, 0)
PS.Font = Enum.Font.FredokaOne
PS.Text = "PseudoSpeed"
PS.TextColor3 = Color3.fromRGB(255, 255, 255)
PS.TextScaled = true
PS.TextSize = 14.000
PS.TextWrapped = true

local runService = game:GetService("RunService")

for v, i in pairs(workspace:GetDescendants()) do
    if i:IsA("Seat") then
        i:Remove()
    end
end

local plr = game.Players.LocalPlayer
local char = plr.Character
local hrp = char.HumanoidRootPart

for v, i in pairs(char.Humanoid.Animator:GetPlayingAnimationTracks()) do
  i:Stop()
end

char.Humanoid.JumpPower = 0
workspace.Gravity = 196.2
wait(2)
workspace.Gravity = 0
char.Humanoid.Animator:Destroy()
local slavePart = Instance.new("Part")
slavePart.Parent = workspace
slavePart.CanCollide = false
slavePart.Transparency = 1
slavePart.Name = "slavePart"
slavePart.Anchored = false
slavePart.CFrame = hrp.CFrame
slavePart.Size = Vector3.new(1,6.8,1)

local rotPart = Instance.new("Part")
rotPart.Parent = workspace
rotPart.CanCollide = false
rotPart.Transparency = 1
rotPart.Anchored = false
rotPart.Position = hrp.Position



for v, i in pairs(char:GetDescendants()) do
    if i:IsA("BasePart") or i:IsA("UnionOperation") then
        i.CanCollide = false
        i.Anchored = false
    end
end

char.Animate:Destroy()

function createVectorForce(forceValue)
    local attachment = Instance.new("Attachment")
    attachment.Parent = slavePart
    local force = Instance.new("VectorForce")
    force.Enabled = false
    force.Parent = attachment
    force.ApplyAtCenterOfMass = true
    force.Attachment0 = attachment
    force.Force = forceValue
    force.Enabled = true
    return force
end
local landed = false
local speedy = 1
local upForce
local wForce
local aForce
local dForce
local antiUpForce
local sForce 
local movement = false
local friction = createVectorForce(Vector3.new(0,0,0))
local downForce = createVectorForce(Vector3.new(0,0,0))
local speedFactor = 150
local fastEffect = false
local hover
local hitted = false
game:GetService("UserInputService").InputBegan:Connect(function(input, gaming)
    if gaming == false then
        if input.KeyCode == Enum.KeyCode.Space then
            movement = true
            upForce = createVectorForce(Vector3.new(0,speedFactor,0))
        end
        if input.KeyCode == Enum.KeyCode.W then
            movement = true
            wForce = createVectorForce(Vector3.new(0,0,-speedFactor))
        end
        if input.KeyCode == Enum.KeyCode.S then
            movement = true
            sForce = createVectorForce(Vector3.new(0,0,speedFactor))
        end
        if input.KeyCode == Enum.KeyCode.C then
            movement = true
            antiUpForce = createVectorForce(Vector3.new(0,-speedFactor,0))
        end
        if input.KeyCode == Enum.KeyCode.A then
            movement = true
            aForce = createVectorForce(Vector3.new(-speedFactor,0,0))
        end
        if input.KeyCode == Enum.KeyCode.D then
            movement = true
            dForce = createVectorForce(Vector3.new(speedFactor,0,0))
        end
        if input.KeyCode == Enum.KeyCode.R then
           if speedy == 3 then
               speedy = 1
            else
                speedy += 1
            end
        end
       	if input.KeyCode == Enum.KeyCode.Q then
            if speedy == 1 then
               speedy = 3
            else
                speedy -= 1
            end
        end
    end
end)

PS.MouseButton1Click:Connect(function()
	if fastEffect == true then
		PS.BackgroundColor3 = Color3.fromRGB(85,0,0)
	else
		PS.BackgroundColor3 = Color3.fromRGB(0,85,0)	
	end
	fastEffect = not fastEffect
end)

Hover.MouseButton1Click:Connect(function()
	if landed == false then
		if hover == false then
			Hover.BackgroundColor3 = Color3.fromRGB(85,0,0)
		else
			Hover.BackgroundColor3 = Color3.fromRGB(0,85,0)	
		end
		hover = not hover
	end
end)
Land.MouseButton1Click:Connect(function()
	if landed == true then
		Land.BackgroundColor3 = Color3.fromRGB(85,0,0)
	else
		Land.BackgroundColor3 = Color3.fromRGB(0,85,0)	
	end
	landed = not landed
    if landed == true then
    	hover = false
    	Hover.BackgroundColor3 = Color3.fromRGB(85,0,0)
        hitted = false
        workspace.Gravity = 0
        slavePart.Velocity = Vector3.new(0,-20,0)
    end
end)

slavePart.Touched:Connect(function(hit)
	if hit:FindFirstAncestor(char.Name) == nil and hitted == false and hit ~= rotPart then
	    if hit.Name ~= slavePart.Name then
	        if landed == true then
	            hitted = true
	            slavePart.Velocity = Vector3.new(0,0,0)

	            slavePart.Anchored = true
	        end
	    end
	end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input, gaming)
    if gaming == false then
        if input.KeyCode == Enum.KeyCode.Space then
            movement = false
            upForce:Destroy()
        end
        if input.KeyCode == Enum.KeyCode.C then
            movement = false
            antiUpForce:Destroy()
        end
        if input.KeyCode == Enum.KeyCode.W then
            movement = false
            wForce:Destroy()
        end
        if input.KeyCode == Enum.KeyCode.S then
            movement = false
            sForce:Destroy()
        end
        if input.KeyCode == Enum.KeyCode.A then
            movement = false
            aForce:Destroy()
        end
        if input.KeyCode == Enum.KeyCode.D then
            movement = false
            dForce:Destroy()
        end
        if input.KeyCode == Enum.KeyCode.F then
            movement = false
            slavePart.Velocity = Vector3.new(0,0,0)
        end
    end
end)
counter = Instance.new("NumberValue")
counter.Parent = workspace
game:GetService("RunService").Heartbeat:Connect(function() 
    if landed == false then
        slavePart.Anchored = false
        if fastEffect == true then
            counter.Value += 4
        else
            if speedy == 3 then
                speedFactor = 300
                game:GetService("TweenService"):Create(counter, TweenInfo.new(.05), {Value = counter.Value + 2.5}):play()

            elseif speedy == 2 then
                game:GetService("TweenService"):Create(counter, TweenInfo.new(.05), {Value = counter.Value + 1.5}):play()

                speedFactor = 150
            elseif speedy == 1 then
                 game:GetService("TweenService"):Create(counter, TweenInfo.new(.05), {Value = counter.Value + 0.8}):play()

                speedFactor = 30
            end
        end
    end
    local x,y,z = workspace.CurrentCamera.CFrame:ToOrientation()
    local cameraY = y
   
    
  	speedMode.Text = "Speed Mode : "..tostring(speedy)

    if landed == false then
        slavePart.CFrame = CFrame.new(slavePart.Position) * CFrame.Angles(0, cameraY, 0)
        local slavePartAdjusted = slavePart.CFrame
        if fastEffect == false then
            if math.abs(slavePart.Velocity.X) > 100 or math.abs(slavePart.Velocity.Z) > 100 then
                game:GetService("TweenService"):Create(rotPart, TweenInfo.new(.3), {CFrame = slavePartAdjusted * CFrame.Angles(math.rad(-70), 0, 0)}):play()
            elseif math.abs(slavePart.Velocity.X) > 60 or math.abs(slavePart.Velocity.Z) > 60 then
                game:GetService("TweenService"):Create(rotPart, TweenInfo.new(.3), {CFrame = slavePartAdjusted * CFrame.Angles(math.rad(-55), 0, 0)}):play()
            elseif math.abs(slavePart.Velocity.X) > 40 or math.abs(slavePart.Velocity.Z) > 40 then
                game:GetService("TweenService"):Create(rotPart, TweenInfo.new(.3), {CFrame = slavePartAdjusted * CFrame.Angles(math.rad(-35), 0, 0)}):play()
            elseif slavePart.Velocity.X > 15 or slavePart.Velocity.Z > 15 then
                game:GetService("TweenService"):Create(rotPart, TweenInfo.new(.3), {CFrame = slavePartAdjusted * CFrame.Angles(math.rad(-15), 0, 0)}):play()
            elseif slavePart.Velocity.X > 10 or slavePart.Velocity.Z > 10 then
                game:GetService("TweenService"):Create(rotPart, TweenInfo.new(.3), {CFrame = slavePartAdjusted * CFrame.Angles(math.rad(-5), 0, 0)}):play()
            elseif slavePart.Velocity.X < 10 or slavePart.Velocity.Z < 10 then
                game:GetService("TweenService"):Create(rotPart, TweenInfo.new(.3), {CFrame = slavePartAdjusted * CFrame.Angles(0, 0, 0)}):play()
            end
        else
            game:GetService("TweenService"):Create(rotPart, TweenInfo.new(.3), {CFrame = slavePartAdjusted * CFrame.Angles(math.rad(-75), 0, 0)}):play()
        end
    else
        rotPart.CFrame = slavePart.CFrame
    end
    hrp.CFrame = rotPart.CFrame * CFrame.Angles(0, math.rad(counter.Value), 0)
   
end)
local upDownForce = createVectorForce(Vector3.new(0,0,0))
while true do
    if hover then
        upDownForce.Force = Vector3.new(0,2.5,0)
        wait(2)
        repeat wait()
        upDownForce.Force = Vector3.new(0,-2.5,0)
        until slavePart.Velocity.Y < 0
        upDownForce.Force = Vector3.new(0,-2.5,0)
        wait(2)
        repeat wait()
        upDownForce.Force = Vector3.new(0,2.5,0)
        until slavePart.Velocity.Y > 0
    else 
        upDownForce.Force = Vector3.new(0,0,0)
        wait()
    end
end
