function createWindow(windowTitle)
    -- Create Instances
    local ScreenGui = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local ScrollingFrame = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local Frame = Instance.new("Frame")
    local Name = Instance.new("TextLabel")
    local Min = Instance.new("TextButton")
    local Close = Instance.new("TextButton")

    -- Set Properties
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false

    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    Main.BackgroundTransparency = 0.900
    Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 400, 0, 500)

    ScrollingFrame.Parent = Main
    ScrollingFrame.Active = true
    ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollingFrame.BackgroundTransparency = 1.000
    ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.Position = UDim2.new(0.0274999999, 0, 0.0179999992, 0)
    ScrollingFrame.Size = UDim2.new(0, 378, 0, 481)
    ScrollingFrame.ScrollBarThickness = 7

    UIListLayout.Parent = ScrollingFrame
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 13)

    Frame.Parent = Main
    Frame.AnchorPoint = Vector2.new(0, 1)
    Frame.BackgroundColor3 = Color3.fromRGB(200, 20, 20)
    Frame.BackgroundTransparency = 0.700
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(1, 0, 0, 30)

    Name.Name = "Name"
    Name.Parent = Frame
    Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Name.BackgroundTransparency = 1.000
    Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Name.BorderSizePixel = 0
    Name.Position = UDim2.new(0, 5, 0, 5)
    Name.Size = UDim2.new(0, 100, 1, -10)
    Name.FontFace = Font.new([[rbxasset://fonts/families/RobotoCondensed.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    Name.Text = windowTitle
    Name.TextColor3 = Color3.fromRGB(230, 230, 230)
    Name.TextSize = 20.000
    Name.TextXAlignment = Enum.TextXAlignment.Left

    Min.Name = "Min"
    Min.Parent = Main
    Min.AnchorPoint = Vector2.new(1, 1)
    Min.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Min.BackgroundTransparency = 1.000
    Min.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Min.BorderSizePixel = 0
    Min.Position = UDim2.new(0, 370, 0, -5)
    Min.Size = UDim2.new(0, 20, 0, 20)
    Min.AutoButtonColor = false
    Min.FontFace = Font.new([[rbxasset://fonts/families/RobotoCondensed.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    Min.LineHeight = 0.960
    Min.Text = "-"
    Min.TextColor3 = Color3.fromRGB(230, 230, 230)
    Min.TextSize = 30.000

    Close.Name = "Close"
    Close.Parent = Main
    Close.AnchorPoint = Vector2.new(1, 1)
    Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundTransparency = 1.000
    Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(1, -5, 0, -5)
    Close.Size = UDim2.new(0, 20, 0, 20)
    Close.AutoButtonColor = false
    Close.FontFace = Font.new([[rbxasset://fonts/families/RobotoCondensed.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    Close.LineHeight = 0.960
    Close.Text = "X"
    Close.TextColor3 = Color3.fromRGB(230, 230, 230)
    Close.TextSize = 30.000

    -- Scripts

    -- Dragging functionality
    local function YXGCPL_fake_script() -- Frame.Drag 
        local script = Instance.new('LocalScript', Frame)

        local UIS = game:GetService('UserInputService')
        local frame = script.Parent
        local dragToggle = nil
        local dragSpeed = 0.25
        local dragStart = nil
        local startPos = nil
        
        local function updateInput(input)
            local delta = input.Position - dragStart
            local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            game:GetService('TweenService'):Create(frame.Parent, TweenInfo.new(dragSpeed), {Position = position}):Play()
        end
        
        frame.InputBegan:Connect(function(input)
            if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
                dragToggle = true
                dragStart = input.Position
                startPos = frame.Parent.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragToggle = false
                    end
                end)
            end
        end)
        
        UIS.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                if dragToggle then
                    updateInput(input)
                end
            end
        end)
    end
    coroutine.wrap(YXGCPL_fake_script)()

    -- Show window on key press
    local function SXVD_fake_script() -- Main.Close 
        local script = Instance.new('LocalScript', Main)

        local keycode = Enum.KeyCode.K
        
        local UserInputService = game:GetService("UserInputService")
        
        UserInputService.InputBegan:Connect(function(Input, gameprocess)
            if not gameprocess then
                if Input.KeyCode == keycode then
                    script.Parent.Visible = true
                end
            end
            
        end)
    end
    coroutine.wrap(SXVD_fake_script)()

    -- Minimize button functionality
    local function ZLPM_fake_script() -- Min.LocalScript 
        local script = Instance.new('LocalScript', Min)

        script.Parent.MouseButton1Click:Connect(function()
            print("CLOSED")
            local plr = game:GetService("Players").LocalPlayer
            game.StarterGui:SetCore("SendNotification", {
                Title = "Closed."; -- the title 
                Text = 'Press "k" to open again.'; -- what the text says 
                Duration = 10; -- how long the notification should in seconds
            })
            script.Parent.Parent.Visible = false
        end)
    end
    coroutine.wrap(ZLPM_fake_script)()

    -- Close button functionality
    local function QRKGSXI_fake_script() -- Close.LocalScript 
        local script = Instance.new('LocalScript', Close)

        script.Parent.MouseButton1Click:Connect(function()
            print("CLOSED")
            script.Parent.Parent.Parent:Destroy()
        end)
    end
    coroutine.wrap(QRKGSXI_fake_script)()

    local window = {}

    function window:createSection(sectionName)
        local section = Instance.new("TextLabel")
        section.Name = sectionName
        section.Parent = ScrollingFrame
        section.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        section.BackgroundTransparency = 1.000
        section.BorderColor3 = Color3.fromRGB(0, 0, 0)
        section.Size = UDim2.new(0, 150, 0, 20)
        section.FontFace = Font.new([[rbxasset://fonts/families/RobotoCondensed.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
        section.Text = sectionName
        section.TextColor3 = Color3.fromRGB(230, 230, 230)
        section.TextSize = 16.000
        section.TextXAlignment = Enum.TextXAlignment.Left

        local sectionTable = {}

        function sectionTable:createButton(buttonName, onClick)
            local button = Instance.new("TextButton")
            button.Name = buttonName
            button.Parent = ScrollingFrame
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 0.900
            button.BorderColor3 = Color3.fromRGB(0, 0, 0)
            button.BorderSizePixel = 0
            button.Size = UDim2.new(0, 236, 0, 21)
            button.FontFace = Font.new([[rbxasset://fonts/families/RobotoCondensed.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            button.Text = buttonName
            button.TextColor3 = Color3.fromRGB(230, 230, 230)
            button.TextSize = 16.000

            button.MouseButton1Click:Connect(onClick)
        end

        return sectionTable
    end

    return window
end
