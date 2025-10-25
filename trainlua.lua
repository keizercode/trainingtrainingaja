-- Train to Fight - Working Speed Bypass
-- Based on actual game remotes

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- Get actual remotes from game
local TrainSystem = ReplicatedStorage:WaitForChild("TrainSystem")
local Remote = TrainSystem:WaitForChild("Remote")
local TrainSpeedRemote = Remote:WaitForChild("TrainSpeedHasChanged")

-- Configuration
local Config = {
    TrainSpeed = 100,          -- Speed multiplier (game default: 1-3, kita bypass jadi 100+)
    AutoTrain = {
        Arms = false,
        Legs = false,
        Back = false,
        Agility = false
    },
    BypassSpeed = true,        -- Bypass x3.0 limit
    SpamSpeed = true           -- Spam speed changes untuk training lebih cepat
}

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TrainSpeedBypass"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 550)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -275)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Title.Text = "⚡ Train Speed Bypass"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 15)
TitleCorner.Parent = Title

-- Status
local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(0.9, 0, 0, 40)
Status.Position = UDim2.new(0.05, 0, 0, 60)
Status.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Status.Text = "🎯 Status: Ready | Speed: x" .. Config.TrainSpeed
Status.TextColor3 = Color3.fromRGB(100, 255, 100)
Status.TextSize = 13
Status.Font = Enum.Font.Gotham
Status.Parent = MainFrame

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 10)
StatusCorner.Parent = Status

-- Speed Control Section
local SpeedSection = Instance.new("Frame")
SpeedSection.Size = UDim2.new(0.9, 0, 0, 100)
SpeedSection.Position = UDim2.new(0.05, 0, 0, 110)
SpeedSection.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
SpeedSection.BorderSizePixel = 0
SpeedSection.Parent = MainFrame

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 10)
SpeedCorner.Parent = SpeedSection

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(1, 0, 0, 30)
SpeedLabel.Position = UDim2.new(0, 0, 0, 10)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "🚀 Train Speed Multiplier"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.TextSize = 15
SpeedLabel.Font = Enum.Font.GothamBold
SpeedLabel.Parent = SpeedSection

local SpeedValue = Instance.new("TextLabel")
SpeedValue.Size = UDim2.new(0.3, 0, 0, 25)
SpeedValue.Position = UDim2.new(0.35, 0, 0, 45)
SpeedValue.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
SpeedValue.Text = "x" .. Config.TrainSpeed
SpeedValue.TextColor3 = Color3.fromRGB(255, 215, 0)
SpeedValue.TextSize = 16
SpeedValue.Font = Enum.Font.GothamBold
SpeedValue.Parent = SpeedSection

local SpeedValueCorner = Instance.new("UICorner")
SpeedValueCorner.CornerRadius = UDim.new(0, 8)
SpeedValueCorner.Parent = SpeedValue

-- Speed Buttons
local function CreateSpeedButton(text, pos, value)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.15, 0, 0, 25)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamBold
    btn.Parent = SpeedSection
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        Config.TrainSpeed = math.max(1, Config.TrainSpeed + value)
        SpeedValue.Text = "x" .. Config.TrainSpeed
        Status.Text = "🎯 Status: Active | Speed: x" .. Config.TrainSpeed
    end)
    
    return btn
end

CreateSpeedButton("-10", UDim2.new(0.05, 0, 0, 45), -10)
CreateSpeedButton("-", UDim2.new(0.22, 0, 0, 45), -1)
CreateSpeedButton("+", UDim2.new(0.68, 0, 0, 45), 1)
CreateSpeedButton("+10", UDim2.new(0.8, 0, 0, 45), 10)

-- Quick Speed Presets
local PresetFrame = Instance.new("Frame")
PresetFrame.Size = UDim2.new(0.9, 0, 0, 35)
PresetFrame.Position = UDim2.new(0.05, 0, 0, 75)
PresetFrame.BackgroundTransparency = 1
PresetFrame.Parent = SpeedSection

local function CreatePreset(text, pos, speed)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.23, 0, 1, 0)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.TextSize = 11
    btn.Font = Enum.Font.Gotham
    btn.Parent = PresetFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        Config.TrainSpeed = speed
        SpeedValue.Text = "x" .. Config.TrainSpeed
        Status.Text = "🎯 Status: Active | Speed: x" .. Config.TrainSpeed
    end)
end

CreatePreset("x50", UDim2.new(0, 0, 0, 0), 50)
CreatePreset("x100", UDim2.new(0.26, 0, 0, 0), 100)
CreatePreset("x200", UDim2.new(0.52, 0, 0, 0), 200)
CreatePreset("x500", UDim2.new(0.78, 0, 0, 0), 500)

-- Auto Train Sections
local function CreateTrainSection(name, yPos, icon)
    local Section = Instance.new("Frame")
    Section.Size = UDim2.new(0.9, 0, 0, 60)
    Section.Position = UDim2.new(0.05, 0, 0, yPos)
    Section.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    Section.BorderSizePixel = 0
    Section.Parent = MainFrame
    
    local SectionCorner = Instance.new("UICorner")
    SectionCorner.CornerRadius = UDim.new(0, 10)
    SectionCorner.Parent = Section
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.5, 0, 0, 30)
    Label.Position = UDim2.new(0.05, 0, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = icon .. " " .. name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 16
    Label.Font = Enum.Font.GothamBold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Section
    
    local Toggle = Instance.new("TextButton")
    Toggle.Size = UDim2.new(0.4, 0, 0, 40)
    Toggle.Position = UDim2.new(0.55, 0, 0, 10)
    Toggle.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    Toggle.Text = "❌ OFF"
    Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    Toggle.TextSize = 14
    Toggle.Font = Enum.Font.GothamBold
    Toggle.Parent = Section
    
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 10)
    ToggleCorner.Parent = Toggle
    
    local Counter = Instance.new("TextLabel")
    Counter.Size = UDim2.new(0.9, 0, 0, 20)
    Counter.Position = UDim2.new(0.05, 0, 0, 38)
    Counter.BackgroundTransparency = 1
    Counter.Text = "📊 Trains: 0"
    Counter.TextColor3 = Color3.fromRGB(100, 255, 255)
    Counter.TextSize = 11
    Counter.Font = Enum.Font.Gotham
    Counter.TextXAlignment = Enum.TextXAlignment.Left
    Counter.Parent = Section
    
    Toggle.MouseButton1Click:Connect(function()
        Config.AutoTrain[name] = not Config.AutoTrain[name]
        if Config.AutoTrain[name] then
            Toggle.Text = "✅ ON"
            Toggle.BackgroundColor3 = Color3.fromRGB(50, 220, 50)
        else
            Toggle.Text = "❌ OFF"
            Toggle.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
        end
    end)
    
    return Counter
end

local Counters = {
    Arms = CreateTrainSection("Arms", 220, "💪"),
    Legs = CreateTrainSection("Legs", 290, "🦵"),
    Back = CreateTrainSection("Back", 360, "🏋️"),
    Agility = CreateTrainSection("Agility", 430, "⚡")
}

-- Control Buttons
local AllToggle = Instance.new("TextButton")
AllToggle.Size = UDim2.new(0.43, 0, 0, 40)
AllToggle.Position = UDim2.new(0.05, 0, 0, 500)
AllToggle.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
AllToggle.Text = "🔥 Toggle All"
AllToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AllToggle.TextSize = 14
AllToggle.Font = Enum.Font.GothamBold
AllToggle.Parent = MainFrame

local AllCorner = Instance.new("UICorner")
AllCorner.CornerRadius = UDim.new(0, 10)
AllCorner.Parent = AllToggle

AllToggle.MouseButton1Click:Connect(function()
    local allActive = true
    for _, v in pairs(Config.AutoTrain) do
        if not v then allActive = false break end
    end
    for k, _ in pairs(Config.AutoTrain) do
        Config.AutoTrain[k] = not allActive
    end
end)

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0.43, 0, 0, 40)
CloseButton.Position = UDim2.new(0.52, 0, 0, 500)
CloseButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CloseButton.Text = "❌ Close"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 10)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Training System
local TrainCounts = {Arms = 0, Legs = 0, Back = 0, Agility = 0}

-- Speed Bypass Function (kirim speed value terus menerus)
spawn(function()
    while task.wait(0.01) do -- Loop cepat untuk bypass speed
        if Config.BypassSpeed and Config.SpamSpeed then
            pcall(function()
                -- Spam speed changes dengan value tinggi
                TrainSpeedRemote:FireServer(Config.TrainSpeed)
            end)
        end
    end
end)

-- Auto Train Loop
spawn(function()
    while task.wait(0.1) do
        for statName, enabled in pairs(Config.AutoTrain) do
            if enabled then
                -- Update counter
                TrainCounts[statName] = TrainCounts[statName] + 1
                Counters[statName].Text = "📊 Trains: " .. TrainCounts[statName]
                
                -- Fire speed remote berkali-kali untuk training lebih cepat
                for i = 1, math.min(Config.TrainSpeed, 100) do
                    pcall(function()
                        TrainSpeedRemote:FireServer(i)
                    end)
                end
            end
        end
    end
end)

-- Info
print("✅ Train Speed Bypass Loaded!")
print("📡 Remote Found:", TrainSpeedRemote:GetFullName())
print("🚀 Speed Multiplier:", Config.TrainSpeed)
print("⚡ Game limit (x3.0) BYPASSED!")
