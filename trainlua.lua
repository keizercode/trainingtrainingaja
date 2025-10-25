-- Train to Fight - Ultra Speed Bypass
-- SPAM SANGAT CEPAT dengan parameter yang benar

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- Get remotes (cek semua kemungkinan)
local AutoTrainRemote
local TrainSpeedRemote

pcall(function()
    -- Coba path 1: AutoTrain (dari Sigma Spy)
    local AutoTrain = ReplicatedStorage:WaitForChild("AutoTrain", 3)
    if AutoTrain then
        local Bindable = AutoTrain:FindFirstChild("Bindable")
        if Bindable then
            AutoTrainRemote = Bindable:FindFirstChild("AutoTrainStateHasChanged")
        end
    end
end)

pcall(function()
    -- Coba path 2: TrainSystem (backup)
    local TrainSystem = ReplicatedStorage:FindFirstChild("TrainSystem")
    if TrainSystem then
        local Remote = TrainSystem:FindFirstChild("Remote")
        if Remote then
            TrainSpeedRemote = Remote:FindFirstChild("TrainSpeedHasChanged")
        end
    end
end)

-- Configuration
local Config = {
    SpeedMultiplier = 1000000,  -- Mulai dari 1 JUTA!
    SpamDelay = 0.001,          -- Spam SUPER cepat (1ms)
    Enabled = false
}

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TrainUltraSpeed"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 400)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -200)
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
Title.Text = "⚡ ULTRA SPEED BYPASS"
Title.TextColor3 = Color3.fromRGB(255, 50, 50)
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 15)
TitleCorner.Parent = Title

-- Remote Status
local RemoteStatus = Instance.new("TextLabel")
RemoteStatus.Size = UDim2.new(0.9, 0, 0, 35)
RemoteStatus.Position = UDim2.new(0.05, 0, 0, 60)
RemoteStatus.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
RemoteStatus.TextColor3 = Color3.fromRGB(200, 200, 200)
RemoteStatus.TextSize = 11
RemoteStatus.Font = Enum.Font.Gotham
RemoteStatus.Parent = MainFrame

local RemoteCorner = Instance.new("UICorner")
RemoteCorner.CornerRadius = UDim.new(0, 8)
RemoteCorner.Parent = RemoteStatus

if AutoTrainRemote then
    RemoteStatus.Text = "📡 Remote 1: ✅ " .. AutoTrainRemote.Name
    RemoteStatus.TextColor3 = Color3.fromRGB(100, 255, 100)
elseif TrainSpeedRemote then
    RemoteStatus.Text = "📡 Remote 2: ✅ " .. TrainSpeedRemote.Name
    RemoteStatus.TextColor3 = Color3.fromRGB(100, 255, 100)
else
    RemoteStatus.Text = "📡 Remote: ❌ NOT FOUND!"
    RemoteStatus.TextColor3 = Color3.fromRGB(255, 100, 100)
end

-- Status
local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(0.9, 0, 0, 45)
Status.Position = UDim2.new(0.05, 0, 0, 105)
Status.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Status.Text = "🎯 Status: Idle | Multiplier: x" .. Config.SpeedMultiplier
Status.TextColor3 = Color3.fromRGB(255, 100, 100)
Status.TextSize = 14
Status.Font = Enum.Font.GothamBold
Status.Parent = MainFrame

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 10)
StatusCorner.Parent = Status

-- Speed Display
local SpeedFrame = Instance.new("Frame")
SpeedFrame.Size = UDim2.new(0.9, 0, 0, 90)
SpeedFrame.Position = UDim2.new(0.05, 0, 0, 160)
SpeedFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
SpeedFrame.BorderSizePixel = 0
SpeedFrame.Parent = MainFrame

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 10)
SpeedCorner.Parent = SpeedFrame

local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Size = UDim2.new(1, 0, 0, 25)
SpeedLabel.Position = UDim2.new(0, 0, 0, 8)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "🚀 Speed Multiplier"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.TextSize = 16
SpeedLabel.Font = Enum.Font.GothamBold
SpeedLabel.Parent = SpeedFrame

local SpeedDisplay = Instance.new("TextLabel")
SpeedDisplay.Size = UDim2.new(0.9, 0, 0, 35)
SpeedDisplay.Position = UDim2.new(0.05, 0, 0, 38)
SpeedDisplay.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
SpeedDisplay.Text = "x" .. Config.SpeedMultiplier
SpeedDisplay.TextColor3 = Color3.fromRGB(255, 50, 50)
SpeedDisplay.TextSize = 20
SpeedDisplay.Font = Enum.Font.GothamBold
SpeedDisplay.Parent = SpeedFrame

local SpeedDisplayCorner = Instance.new("UICorner")
SpeedDisplayCorner.CornerRadius = UDim.new(0, 8)
SpeedDisplayCorner.Parent = SpeedDisplay

-- Preset Buttons
local presets = {
    {text = "x1M", value = 1000000, color = Color3.fromRGB(100, 200, 100)},
    {text = "x10M", value = 10000000, color = Color3.fromRGB(255, 200, 50)},
    {text = "x100M", value = 100000000, color = Color3.fromRGB(255, 150, 50)},
    {text = "x1B", value = 1000000000, color = Color3.fromRGB(255, 50, 50)}
}

for i, preset in ipairs(presets) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.22, 0, 0, 35)
    btn.Position = UDim2.new(0.05 + (i-1)*0.24, 0, 0, 260)
    btn.BackgroundColor3 = preset.color
    btn.Text = preset.text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamBold
    btn.Parent = MainFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        Config.SpeedMultiplier = preset.value
        SpeedDisplay.Text = "x" .. Config.SpeedMultiplier
        Status.Text = "🎯 Status: " .. (Config.Enabled and "🔥 ACTIVE" or "Idle") .. " | Multiplier: x" .. Config.SpeedMultiplier
    end)
end

-- Counter Display
local Counter = Instance.new("TextLabel")
Counter.Size = UDim2.new(0.9, 0, 0, 40)
Counter.Position = UDim2.new(0.05, 0, 0, 305)
Counter.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Counter.Text = "📊 Spam Count: 0"
Counter.TextColor3 = Color3.fromRGB(100, 255, 255)
Counter.TextSize = 14
Counter.Font = Enum.Font.GothamBold
Counter.Parent = MainFrame

local CounterCorner = Instance.new("UICorner")
CounterCorner.CornerRadius = UDim.new(0, 10)
CounterCorner.Parent = Counter

-- Control Buttons
local StartBtn = Instance.new("TextButton")
StartBtn.Size = UDim2.new(0.43, 0, 0, 45)
StartBtn.Position = UDim2.new(0.05, 0, 0, 355)
StartBtn.BackgroundColor3 = Color3.fromRGB(50, 220, 50)
StartBtn.Text = "▶️ START"
StartBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StartBtn.TextSize = 16
StartBtn.Font = Enum.Font.GothamBold
StartBtn.Parent = MainFrame

local StartCorner = Instance.new("UICorner")
StartCorner.CornerRadius = UDim.new(0, 10)
StartCorner.Parent = StartBtn

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0.43, 0, 0, 45)
CloseBtn.Position = UDim2.new(0.52, 0, 0, 355)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CloseBtn.Text = "❌ CLOSE"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 10)
CloseCorner.Parent = CloseBtn

-- Variables
local SpamCount = 0

-- Button Actions
StartBtn.MouseButton1Click:Connect(function()
    Config.Enabled = not Config.Enabled
    
    if Config.Enabled then
        StartBtn.Text = "⏸️ STOP"
        StartBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
        Status.Text = "🎯 Status: 🔥 ACTIVE | Multiplier: x" .. Config.SpeedMultiplier
        Status.TextColor3 = Color3.fromRGB(100, 255, 100)
    else
        StartBtn.Text = "▶️ START"
        StartBtn.BackgroundColor3 = Color3.fromRGB(50, 220, 50)
        Status.Text = "🎯 Status: Idle | Multiplier: x" .. Config.SpeedMultiplier
        Status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- ULTRA SPAM LOOP - METHOD 1: AutoTrainStateHasChanged
if AutoTrainRemote then
    spawn(function()
        print("🔥 Using AutoTrainStateHasChanged remote")
        while task.wait(Config.SpamDelay) do
            if Config.Enabled then
                -- SPAM dengan loop sangat cepat
                for i = 1, 100 do -- Loop 100x per tick
                    pcall(function()
                        AutoTrainRemote:Fire(Config.SpeedMultiplier)
                        SpamCount = SpamCount + 1
                    end)
                end
                Counter.Text = "📊 Spam Count: " .. SpamCount
            end
        end
    end)
end

-- ULTRA SPAM LOOP - METHOD 2: TrainSpeedHasChanged
if TrainSpeedRemote then
    spawn(function()
        print("🔥 Using TrainSpeedHasChanged remote")
        while task.wait(Config.SpamDelay) do
            if Config.Enabled then
                -- SPAM dengan loop sangat cepat
                for i = 1, 100 do -- Loop 100x per tick
                    pcall(function()
                        TrainSpeedRemote:FireServer(Config.SpeedMultiplier)
                        SpamCount = SpamCount + 1
                    end)
                end
                Counter.Text = "📊 Spam Count: " .. SpamCount
            end
        end
    end)
end

-- Extra spam loop untuk memastikan
spawn(function()
    while task.wait() do -- Loop secepat mungkin
        if Config.Enabled then
            -- Spam SEMUA remote yang ada
            pcall(function()
                if AutoTrainRemote then
                    for i = 1, 50 do
                        AutoTrainRemote:Fire(1)
                    end
                end
            end)
            
            pcall(function()
                if TrainSpeedRemote then
                    for i = 1, 50 do
                        TrainSpeedRemote:FireServer(1)
                    end
                end
            end)
        end
    end
end)

-- Info
print("✅ ULTRA SPEED BYPASS LOADED!")
print("💥 Multiplier: x" .. Config.SpeedMultiplier)
print("⚡ Spam Delay: " .. Config.SpamDelay .. "s")
if AutoTrainRemote then
    print("📡 Remote 1:", AutoTrainRemote:GetFullName())
end
if TrainSpeedRemote then
    print("📡 Remote 2:", TrainSpeedRemote:GetFullName())
end
print("🔥 TEKAN START UNTUK MULAI SPAM!")
