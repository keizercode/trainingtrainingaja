-- Train to Fight - EXTREME Combat Power Booster
-- Multiply BASE training values untuk hasil maksimal

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Settings
local Settings = {
    BaseMultiplier = 100,  -- Multiply BASE value sebelum dikali game multiplier
    SpeedMultiplier = 10,
    AutoTrain = false,
    Enabled = false
}

local Stats = {
    TotalGains = 0,
    TrainingSessions = 0,
    ArmsGain = 0,
    LegsGain = 0,
    BackGain = 0,
    AgilityGain = 0
}

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ExtremeCombatBooster"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = playerGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 480)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -240)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(255, 200, 50)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 12)
TopBarCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -80, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "💥 EXTREME BOOSTER"
Title.TextColor3 = Color3.fromRGB(255, 220, 50)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 32, 0, 32)
MinimizeBtn.Position = UDim2.new(1, -72, 0, 9)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(255, 180, 50)
MinimizeBtn.Text = "−"
MinimizeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
MinimizeBtn.TextSize = 22
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.Parent = TopBar

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 8)
MinCorner.Parent = MinimizeBtn

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -37, 0, 9)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 18
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

-- Content
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -24, 1, -62)
Content.Position = UDim2.new(0, 12, 0, 56)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

-- Status Section
local StatusFrame = Instance.new("Frame")
StatusFrame.Size = UDim2.new(1, 0, 0, 110)
StatusFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
StatusFrame.BorderSizePixel = 0
StatusFrame.Parent = Content

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 8)
StatusCorner.Parent = StatusFrame

local StatusTitle = Instance.new("TextLabel")
StatusTitle.Size = UDim2.new(1, -16, 0, 25)
StatusTitle.Position = UDim2.new(0, 8, 0, 5)
StatusTitle.BackgroundTransparency = 1
StatusTitle.Text = "📊 LIVE STATS"
StatusTitle.TextColor3 = Color3.fromRGB(255, 200, 50)
StatusTitle.TextSize = 15
StatusTitle.Font = Enum.Font.GothamBold
StatusTitle.TextXAlignment = Enum.TextXAlignment.Left
StatusTitle.Parent = StatusFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -16, 0, 18)
StatusLabel.Position = UDim2.new(0, 8, 0, 30)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "⭕ INACTIVE"
StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
StatusLabel.TextSize = 14
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = StatusFrame

local ArmsLabel = Instance.new("TextLabel")
ArmsLabel.Size = UDim2.new(0.5, -8, 0, 16)
ArmsLabel.Position = UDim2.new(0, 8, 0, 52)
ArmsLabel.BackgroundTransparency = 1
ArmsLabel.Text = "💪 Arms: +0"
ArmsLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
ArmsLabel.TextSize = 12
ArmsLabel.Font = Enum.Font.Gotham
ArmsLabel.TextXAlignment = Enum.TextXAlignment.Left
ArmsLabel.Parent = StatusFrame

local LegsLabel = Instance.new("TextLabel")
LegsLabel.Size = UDim2.new(0.5, -8, 0, 16)
LegsLabel.Position = UDim2.new(0.5, 0, 0, 52)
LegsLabel.BackgroundTransparency = 1
LegsLabel.Text = "🦵 Legs: +0"
LegsLabel.TextColor3 = Color3.fromRGB(150, 255, 150)
LegsLabel.TextSize = 12
LegsLabel.Font = Enum.Font.Gotham
LegsLabel.TextXAlignment = Enum.TextXAlignment.Left
LegsLabel.Parent = StatusFrame

local BackLabel = Instance.new("TextLabel")
BackLabel.Size = UDim2.new(0.5, -8, 0, 16)
BackLabel.Position = UDim2.new(0, 8, 0, 72)
BackLabel.BackgroundTransparency = 1
BackLabel.Text = "🏋️ Back: +0"
BackLabel.TextColor3 = Color3.fromRGB(150, 200, 255)
BackLabel.TextSize = 12
BackLabel.Font = Enum.Font.Gotham
BackLabel.TextXAlignment = Enum.TextXAlignment.Left
BackLabel.Parent = StatusFrame

local AgilityLabel = Instance.new("TextLabel")
AgilityLabel.Size = UDim2.new(0.5, -8, 0, 16)
AgilityLabel.Position = UDim2.new(0.5, 0, 0, 72)
AgilityLabel.BackgroundTransparency = 1
AgilityLabel.Text = "⚡ Agility: +0"
AgilityLabel.TextColor3 = Color3.fromRGB(255, 255, 150)
AgilityLabel.TextSize = 12
AgilityLabel.Font = Enum.Font.Gotham
AgilityLabel.TextXAlignment = Enum.TextXAlignment.Left
AgilityLabel.Parent = StatusFrame

local TotalLabel = Instance.new("TextLabel")
TotalLabel.Size = UDim2.new(1, -16, 0, 16)
TotalLabel.Position = UDim2.new(0, 8, 0, 90)
TotalLabel.BackgroundTransparency = 1
TotalLabel.Text = "🎯 Total Gain: +0 | Sessions: 0"
TotalLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
TotalLabel.TextSize = 11
TotalLabel.Font = Enum.Font.Gotham
TotalLabel.TextXAlignment = Enum.TextXAlignment.Left
TotalLabel.Parent = StatusFrame

-- Base Multiplier Section
local BaseMultFrame = Instance.new("Frame")
BaseMultFrame.Size = UDim2.new(1, 0, 0, 100)
BaseMultFrame.Position = UDim2.new(0, 0, 0, 120)
BaseMultFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
BaseMultFrame.BorderSizePixel = 0
BaseMultFrame.Parent = Content

local BaseMultCorner = Instance.new("UICorner")
BaseMultCorner.CornerRadius = UDim.new(0, 8)
BaseMultCorner.Parent = BaseMultFrame

local BaseMultTitle = Instance.new("TextLabel")
BaseMultTitle.Size = UDim2.new(1, -16, 0, 28)
BaseMultTitle.Position = UDim2.new(0, 8, 0, 5)
BaseMultTitle.BackgroundTransparency = 1
BaseMultTitle.Text = "💎 BASE MULTIPLIER: x100"
BaseMultTitle.TextColor3 = Color3.fromRGB(150, 255, 255)
BaseMultTitle.TextSize = 16
BaseMultTitle.Font = Enum.Font.GothamBold
BaseMultTitle.TextXAlignment = Enum.TextXAlignment.Left
BaseMultTitle.Parent = BaseMultFrame

local BaseMultInfo = Instance.new("TextLabel")
BaseMultInfo.Size = UDim2.new(1, -16, 0, 28)
BaseMultInfo.Position = UDim2.new(0, 8, 0, 30)
BaseMultInfo.BackgroundTransparency = 1
BaseMultInfo.Text = "Result: Back=18K | Arms/Agility=36K | Legs=72K"
BaseMultInfo.TextColor3 = Color3.fromRGB(255, 200, 100)
BaseMultInfo.TextSize = 12
BaseMultInfo.Font = Enum.Font.GothamMedium
BaseMultInfo.TextXAlignment = Enum.TextXAlignment.Left
BaseMultInfo.Parent = BaseMultFrame

local BaseMultSlider = Instance.new("Frame")
BaseMultSlider.Size = UDim2.new(1, -16, 0, 32)
BaseMultSlider.Position = UDim2.new(0, 8, 0, 60)
BaseMultSlider.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
BaseMultSlider.BorderSizePixel = 0
BaseMultSlider.Parent = BaseMultFrame

local BMSliderCorner = Instance.new("UICorner")
BMSliderCorner.CornerRadius = UDim.new(0, 6)
BMSliderCorner.Parent = BaseMultSlider

local BaseMultFill = Instance.new("Frame")
BaseMultFill.Size = UDim2.new(0.099, 0, 1, 0)
BaseMultFill.BackgroundColor3 = Color3.fromRGB(150, 255, 255)
BaseMultFill.BorderSizePixel = 0
BaseMultFill.Parent = BaseMultSlider

local BMFillCorner = Instance.new("UICorner")
BMFillCorner.CornerRadius = UDim.new(0, 6)
BMFillCorner.Parent = BaseMultFill

local BaseMultBtn = Instance.new("TextButton")
BaseMultBtn.Size = UDim2.new(1, 0, 1, 0)
BaseMultBtn.BackgroundTransparency = 1
BaseMultBtn.Text = ""
BaseMultBtn.Parent = BaseMultSlider

-- Speed Section
local SpeedFrame = Instance.new("Frame")
SpeedFrame.Size = UDim2.new(1, 0, 0, 85)
SpeedFrame.Position = UDim2.new(0, 0, 0, 230)
SpeedFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
SpeedFrame.BorderSizePixel = 0
SpeedFrame.Parent = Content

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 8)
SpeedCorner.Parent = SpeedFrame

local SpeedTitle = Instance.new("TextLabel")
SpeedTitle.Size = UDim2.new(1, -16, 0, 25)
SpeedTitle.Position = UDim2.new(0, 8, 0, 5)
SpeedTitle.BackgroundTransparency = 1
SpeedTitle.Text = "⚡ TRAINING SPEED: x10"
SpeedTitle.TextColor3 = Color3.fromRGB(255, 200, 100)
SpeedTitle.TextSize = 15
SpeedTitle.Font = Enum.Font.GothamBold
SpeedTitle.TextXAlignment = Enum.TextXAlignment.Left
SpeedTitle.Parent = SpeedFrame

local SpeedSlider = Instance.new("Frame")
SpeedSlider.Size = UDim2.new(1, -16, 0, 32)
SpeedSlider.Position = UDim2.new(0, 8, 0, 45)
SpeedSlider.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
SpeedSlider.BorderSizePixel = 0
SpeedSlider.Parent = SpeedFrame

local SpeedSliderCorner = Instance.new("UICorner")
SpeedSliderCorner.CornerRadius = UDim.new(0, 6)
SpeedSliderCorner.Parent = SpeedSlider

local SpeedFill = Instance.new("Frame")
SpeedFill.Size = UDim2.new(0.45, 0, 1, 0)
SpeedFill.BackgroundColor3 = Color3.fromRGB(255, 180, 100)
SpeedFill.BorderSizePixel = 0
SpeedFill.Parent = SpeedSlider

local SpeedFillCorner = Instance.new("UICorner")
SpeedFillCorner.CornerRadius = UDim.new(0, 6)
SpeedFillCorner.Parent = SpeedFill

local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(1, 0, 1, 0)
SpeedBtn.BackgroundTransparency = 1
SpeedBtn.Text = ""
SpeedBtn.Parent = SpeedSlider

-- Buttons
local EnableBtn = Instance.new("TextButton")
EnableBtn.Size = UDim2.new(1, 0, 0, 50)
EnableBtn.Position = UDim2.new(0, 0, 0, 325)
EnableBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 50)
EnableBtn.Text = "🚀 ACTIVATE EXTREME MODE"
EnableBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
EnableBtn.TextSize = 17
EnableBtn.Font = Enum.Font.GothamBold
EnableBtn.BorderSizePixel = 0
EnableBtn.Parent = Content

local EnableCorner = Instance.new("UICorner")
EnableCorner.CornerRadius = UDim.new(0, 10)
EnableCorner.Parent = EnableBtn

local EnableStroke = Instance.new("UIStroke")
EnableStroke.Color = Color3.fromRGB(255, 150, 50)
EnableStroke.Thickness = 2
EnableStroke.Parent = EnableBtn

local AutoTrainBtn = Instance.new("TextButton")
AutoTrainBtn.Size = UDim2.new(1, 0, 0, 40)
AutoTrainBtn.Position = UDim2.new(0, 0, 0, 385)
AutoTrainBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
AutoTrainBtn.Text = "🤖 AUTO TRAIN: OFF"
AutoTrainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoTrainBtn.TextSize = 15
AutoTrainBtn.Font = Enum.Font.GothamBold
AutoTrainBtn.BorderSizePixel = 0
AutoTrainBtn.Parent = Content

local AutoCorner = Instance.new("UICorner")
AutoCorner.CornerRadius = UDim.new(0, 8)
AutoCorner.Parent = AutoTrainBtn

-- Minimized Frame
local MinimizedFrame = Instance.new("Frame")
MinimizedFrame.Size = UDim2.new(0, 240, 0, 50)
MinimizedFrame.Position = UDim2.new(0.5, -120, 0, 10)
MinimizedFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
MinimizedFrame.BorderSizePixel = 0
MinimizedFrame.Visible = false
MinimizedFrame.Active = true
MinimizedFrame.Draggable = true
MinimizedFrame.Parent = ScreenGui

local MinFrameCorner = Instance.new("UICorner")
MinFrameCorner.CornerRadius = UDim.new(0, 10)
MinFrameCorner.Parent = MinimizedFrame

local MinStroke = Instance.new("UIStroke")
MinStroke.Color = Color3.fromRGB(255, 200, 50)
MinStroke.Thickness = 2
MinStroke.Parent = MinimizedFrame

local MinLabel = Instance.new("TextLabel")
MinLabel.Size = UDim2.new(1, -50, 1, 0)
MinLabel.Position = UDim2.new(0, 12, 0, 0)
MinLabel.BackgroundTransparency = 1
MinLabel.Text = "💥 EXTREME BOOSTER"
MinLabel.TextColor3 = Color3.fromRGB(255, 220, 50)
MinLabel.TextSize = 16
MinLabel.Font = Enum.Font.GothamBold
MinLabel.TextXAlignment = Enum.TextXAlignment.Left
MinLabel.Parent = MinimizedFrame

local RestoreBtn = Instance.new("TextButton")
RestoreBtn.Size = UDim2.new(0, 38, 0, 38)
RestoreBtn.Position = UDim2.new(1, -44, 0, 6)
RestoreBtn.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
RestoreBtn.Text = "+"
RestoreBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RestoreBtn.TextSize = 24
RestoreBtn.Font = Enum.Font.GothamBold
RestoreBtn.BorderSizePixel = 0
RestoreBtn.Parent = MinimizedFrame

local RestoreCorner = Instance.new("UICorner")
RestoreCorner.CornerRadius = UDim.new(0, 8)
RestoreCorner.Parent = RestoreBtn

-- Functions
function FormatNumber(n)
    if n >= 1e9 then return string.format("%.2fB", n / 1e9)
    elseif n >= 1e6 then return string.format("%.2fM", n / 1e6)
    elseif n >= 1e3 then return string.format("%.2fK", n / 1e3)
    else return tostring(math.floor(n)) end
end

local function UpdateUI()
    BaseMultTitle.Text = string.format("💎 BASE MULTIPLIER: x%d", Settings.BaseMultiplier)
    
    -- Calculate expected results
    local backResult = 18 * Settings.BaseMultiplier
    local armsAgilityResult = 36 * Settings.BaseMultiplier
    local legsResult = 72 * Settings.BaseMultiplier
    
    BaseMultInfo.Text = string.format("Result: Back=%s | Arms/Agility=%s | Legs=%s", 
        FormatNumber(backResult), FormatNumber(armsAgilityResult), FormatNumber(legsResult))
    
    BaseMultFill.Size = UDim2.new((Settings.BaseMultiplier - 1) / 999, 0, 1, 0)
    
    SpeedTitle.Text = string.format("⚡ TRAINING SPEED: x%d", Settings.SpeedMultiplier)
    SpeedFill.Size = UDim2.new((Settings.SpeedMultiplier - 1) / 19, 0, 1, 0)
    
    ArmsLabel.Text = string.format("💪 Arms: +%s", FormatNumber(Stats.ArmsGain))
    LegsLabel.Text = string.format("🦵 Legs: +%s", FormatNumber(Stats.LegsGain))
    BackLabel.Text = string.format("🏋️ Back: +%s", FormatNumber(Stats.BackGain))
    AgilityLabel.Text = string.format("⚡ Agility: +%s", FormatNumber(Stats.AgilityGain))
    TotalLabel.Text = string.format("🎯 Total Gain: +%s | Sessions: %d", 
        FormatNumber(Stats.TotalGains), Stats.TrainingSessions)
end

-- Sliders
local draggingBase = false
local draggingSpeed = false

BaseMultBtn.MouseButton1Down:Connect(function() draggingBase = true end)
SpeedBtn.MouseButton1Down:Connect(function() draggingSpeed = true end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingBase = false
        draggingSpeed = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        if draggingBase then
            local pos = (UserInputService:GetMouseLocation().X - BaseMultSlider.AbsolutePosition.X) / BaseMultSlider.AbsoluteSize.X
            Settings.BaseMultiplier = math.clamp(math.floor(pos * 1000) + 1, 1, 1000)
            UpdateUI()
        end
        if draggingSpeed then
            local pos = (UserInputService:GetMouseLocation().X - SpeedSlider.AbsolutePosition.X) / SpeedSlider.AbsoluteSize.X
            Settings.SpeedMultiplier = math.clamp(math.floor(pos * 20) + 1, 1, 20)
            UpdateUI()
        end
    end
end)

-- Buttons
MinimizeBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    MinimizedFrame.Visible = true
end)

RestoreBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    MinimizedFrame.Visible = false
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

EnableBtn.MouseButton1Click:Connect(function()
    Settings.Enabled = not Settings.Enabled
    if Settings.Enabled then
        EnableBtn.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
        EnableBtn.Text = "✅ EXTREME MODE ACTIVE"
        StatusLabel.Text = "🔥 ACTIVE - BOOSTING!"
        StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
        EnableStroke.Color = Color3.fromRGB(100, 255, 100)
    else
        EnableBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 50)
        EnableBtn.Text = "🚀 ACTIVATE EXTREME MODE"
        StatusLabel.Text = "⭕ INACTIVE"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        EnableStroke.Color = Color3.fromRGB(255, 150, 50)
    end
end)

AutoTrainBtn.MouseButton1Click:Connect(function()
    Settings.AutoTrain = not Settings.AutoTrain
    if Settings.AutoTrain then
        AutoTrainBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
        AutoTrainBtn.Text = "🤖 AUTO TRAIN: ON"
    else
        AutoTrainBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        AutoTrainBtn.Text = "🤖 AUTO TRAIN: OFF"
    end
end)

-- CORE HOOKS - Multiply BASE training values
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    if not Settings.Enabled then
        return oldNamecall(self, ...)
    end
    
    local method = getnamecallmethod()
    local args = {...}
    
    -- Hook InvokeServer untuk multiply SEMUA return values
    if method == "InvokeServer" then
        local results = {oldNamecall(self, ...)}
        
        -- Multiply hasil untuk semua training functions
        for i, result in ipairs(results) do
            if typeof(result) == "number" and result > 0 then
                results[i] = result * Settings.BaseMultiplier
            end
        end
        
        return unpack(results)
    end
    
    -- Hook FireServer untuk training speed
    if method == "FireServer" and self.Name == "TrainSpeedHasChanged" then
        if args[1] then
            args[1] = args[1] * Settings.SpeedMultiplier
        end
        Stats.TrainingSessions = Stats.TrainingSessions + 1
        UpdateUI()
        return oldNamecall(self, unpack(args))
    end
    
    return oldNamecall(self, ...)
end)

-- Hook BindableFunction Invoke untuk multiply results
local TrainSystem = ReplicatedStorage:WaitForChild("TrainSystem", 5)
if TrainSystem and TrainSystem:FindFirstChild("Bindable") then
    for _, bindable in pairs(TrainSystem.Bindable:GetChildren()) do
        if bindable:IsA("BindableFunction") then
            local oldInvoke = bindable.Invoke
            bindable.Invoke = function(self, ...)
                local result = oldInvoke(self, ...)
                
                if Settings.Enabled and typeof(result) == "number" and result > 0 then
                    return result * Settings.BaseMultiplier
                end
                
                return result
            end
        end
    end
end

-- Hook OnClientEvent untuk multiply data dari server
local function HookRemote(remote)
    if not remote:IsA("RemoteEvent") then return end
    
    local connections = getconnections(remote.OnClientEvent)
    for _, connection in pairs(connections) do
        local oldFunc = connection.Function
        connection:Disable()
        
        remote.OnClientEvent:Connect(function(...)
            local args = {...}
            
            if Settings.Enabled then
                -- Multiply PlayerTrainValueHasChanged
                if remote.Name == "PlayerTrainValueHasChanged" then
                    if args[3] and args[4] then
                        local gain = (args[3] - args[4]) * Settings.BaseMultiplier
                        args[3] = args[4] + gain
                        
                        -- Track by train type
                        local trainType = args[2]
                        if trainType == 1 then -- Arms
                            Stats.ArmsGain = Stats.ArmsGain + gain
                        elseif trainType == 2 then -- Legs
                            Stats.LegsGain = Stats.LegsGain + gain
                        elseif trainType == 3 then -- Back
                            Stats.BackGain = Stats.BackGain + gain
                        elseif trainType == 4 then -- Agility
                            Stats.AgilityGain = Stats.AgilityGain + gain
                        end
                        
                        Stats.TotalGains = Stats.TotalGains + gain
                        UpdateUI()
                    end
                end
                
                -- Multiply Combat Power
                if remote.Name == "PlayerCombatPowerHasChanged" and args[2] then
                    args[2] = args[2] * Settings.BaseMultiplier
                end
                
                -- Multiply Statistics
                if remote.Name == "StatisticsDataHasChanged" and args[2] then
                    args[2] = args[2] * Settings.BaseMultiplier
                end
            end
            
            return oldFunc(unpack(args))
        end)
    end
end

-- Apply hooks to all training remotes
task.spawn(function()
    if TrainSystem and TrainSystem:FindFirstChild("Remote") then
        for _, remote in pairs(TrainSystem.Remote:GetChildren()) do
            HookRemote(remote)
        end
    end
    
    local Statistics = ReplicatedStorage:FindFirstChild("Statistics")
    if Statistics and Statistics:FindFirstChild("Remote") then
        for _, remote in pairs(Statistics.Remote:GetChildren()) do
            HookRemote(remote)
        end
    end
end)

-- Auto Training Loop - AGGRESSIVE MODE
task.spawn(function()
    while task.wait(0.15) do -- Very fast loop
        if Settings.AutoTrain and Settings.Enabled then
            pcall(function()
                local TrainEquipment = ReplicatedStorage:FindFirstChild("TrainEquipment")
                if TrainEquipment and TrainEquipment:FindFirstChild("Remote") then
                    -- Try stationary train first
                    local stationaryTrain = TrainEquipment.Remote:FindFirstChild("ApplyStationaryTrain")
                    if stationaryTrain then
                        stationaryTrain:InvokeServer()
                    end
                    
                    -- Also try mobile train
                    local mobileTrain = TrainEquipment.Remote:FindFirstChild("ApplyMobileTrain")
                    if mobileTrain then
                        mobileTrain:InvokeServer()
                    end
                end
                
                -- Force training speed update
                local trainSpeed = ReplicatedStorage.TrainSystem.Remote:FindFirstChild("TrainSpeedHasChanged")
                if trainSpeed then
                    trainSpeed:FireServer(4 * Settings.SpeedMultiplier)
                end
            end)
        end
    end
end)

-- Additional hook for direct training value modification
task.spawn(function()
    local TrainEquipment = ReplicatedStorage:WaitForChild("TrainEquipment", 5)
    if TrainEquipment and TrainEquipment:FindFirstChild("Bindable") then
        -- Hook ApplyAddFrenzyValue
        local addFrenzy = TrainEquipment.Bindable:FindFirstChild("ApplyAddFrenzyValue")
        if addFrenzy then
            local oldInvoke = addFrenzy.Invoke
            addFrenzy.Invoke = function(self, value)
                if Settings.Enabled and value then
                    value = value * Settings.BaseMultiplier
                end
                return oldInvoke(self, value)
            end
        end
    end
end)

-- Monitor and log gains (debug)
task.spawn(function()
    while task.wait(2) do
        if Settings.Enabled and Stats.TrainingSessions > 0 then
            local avgGain = Stats.TotalGains / Stats.TrainingSessions
            print(string.format("[EXTREME BOOSTER] Sessions: %d | Total: %s | Avg: %s per train",
                Stats.TrainingSessions,
                FormatNumber(Stats.TotalGains),
                FormatNumber(avgGain)))
        end
    end
end)

UpdateUI()
print("💥 EXTREME COMBAT BOOSTER LOADED!")
print("💎 Base Multiplier Range: x1 - x1000")
print("⚡ Speed Multiplier Range: x1 - x20")
print("🎯 Expected Results with x100 multiplier:")
print("   - Back: 180 → 18,000 (x10 game mult)")
print("   - Arms: 360 → 36,000 (x20 game mult)")
print("   - Agility: 360 → 36,000 (x20 game mult)")
print("   - Legs: 720 → 72,000 (x40 game mult)")
print("🚀 Set multiplier, activate, and train!")
print("🤖 Enable Auto Train for fully automated gains!"
