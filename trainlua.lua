-- Train to Fight - CORRECT Speed Spam
-- Spam Fire(1) berkali-kali per detik!

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- Get remote yang BENAR
local AutoTrain = ReplicatedStorage:WaitForChild("AutoTrain")
local Bindable = AutoTrain:WaitForChild("Bindable")
local AutoTrainStateHasChanged = Bindable:WaitForChild("AutoTrainStateHasChanged")

-- Configuration
local Config = {
    SpamPerSecond = 1000,  -- Berapa kali Fire(1) per detik (default: 1000x)
    Enabled = false
}

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TrainSpeedSpam"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 350)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -175)
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
Title.Text = "⚡ Train Speed Spam"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 15)
TitleCorner.Parent = Title

-- Remote Info
local RemoteInfo = Instance.new("TextLabel")
RemoteInfo.Size = UDim2.new(0.9, 0, 0, 35)
RemoteInfo.Position = UDim2.new(0.05, 0, 0, 60)
RemoteInfo.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
RemoteInfo.Text = "📡 Remote: AutoTrainStateHasChanged ✅"
RemoteInfo.TextColor3 = Color3.fromRGB(100, 255, 100)
RemoteInfo.TextSize = 11
RemoteInfo.Font = Enum.Font.Gotham
RemoteInfo.Parent = MainFrame

local RemoteCorner = Instance.new("UICorner")
RemoteCorner.CornerRadius = UDim.new(0, 8)
RemoteCorner.Parent = RemoteInfo

-- Status
local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(0.9, 0, 0, 45)
Status.Position = UDim2.new(0.05, 0, 0, 105)
Status.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Status.Text = "🎯 Status: Idle"
Status.TextColor3 = Color3.fromRGB(255, 100, 100)
Status.TextSize = 16
Status.Font = Enum.Font.GothamBold
Status.Parent = MainFrame

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 10)
StatusCorner.Parent = Status

-- Spam Speed Control
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
SpeedLabel.Position = UDim2.new(0, 0, 0, 5)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "🚀 Spam Per Second"
SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedLabel.TextSize = 15
SpeedLabel.Font = Enum.Font.GothamBold
SpeedLabel.Parent = SpeedFrame

local SpeedDisplay = Instance.new("TextLabel")
SpeedDisplay.Size = UDim2.new(0.9, 0, 0, 30)
SpeedDisplay.Position = UDim2.new(0.05, 0, 0, 35)
SpeedDisplay.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
SpeedDisplay.Text = Config.SpamPerSecond .. "x / second"
SpeedDisplay.TextColor3 = Color3.fromRGB(255, 215, 0)
SpeedDisplay.TextSize = 18
SpeedDisplay.Font = Enum.Font.GothamBold
SpeedDisplay.Parent = SpeedFrame

local SpeedDisplayCorner = Instance.new("UICorner")
SpeedDisplayCorner.CornerRadius = UDim.new(0, 8)
SpeedDisplayCorner.Parent = SpeedDisplay

-- Preset Buttons
local presets = {
    {text = "500x", value = 500},
    {text = "1000x", value = 1000},
    {text = "5000x", value = 5000},
    {text = "10000x", value = 10000}
}

for i, preset in ipairs(presets) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.22, 0, 0, 28)
    btn.Position = UDim2.new(0.05 + (i-1)*0.24, 0, 0, 260)
    btn.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
    btn.Text = preset.text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.Parent = MainFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        Config.SpamPerSecond = preset.value
        SpeedDisplay.Text = Config.SpamPerSecond .. "x / second"
    end)
end

-- Counter
local Counter = Instance.new("TextLabel")
Counter.Size = UDim2.new(0.9, 0, 0, 35)
Counter.Position = UDim2.new(0.05, 0, 0, 298)
Counter.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Counter.Text = "📊 Total Spammed: 0"
Counter.TextColor3 = Color3.fromRGB(100, 255, 255)
Counter.TextSize = 13
Counter.Font = Enum.Font.GothamBold
Counter.Parent = MainFrame

local CounterCorner = Instance.new("UICorner")
CounterCorner.CornerRadius = UDim.new(0, 8)
CounterCorner.Parent = Counter

-- Control Buttons
local StartBtn = Instance.new("TextButton")
StartBtn.Size = UDim2.new(0.43, 0, 0, 45)
StartBtn.Position = UDim2.new(0.05, 0, 0, 343)
StartBtn.BackgroundColor3 = Color3.fromRGB(50, 220, 50)
StartBtn.Text = "▶️ START SPAM"
StartBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StartBtn.TextSize = 15
StartBtn.Font = Enum.Font.GothamBold
StartBtn.Parent = MainFrame

local StartCorner = Instance.new("UICorner")
StartCorner.CornerRadius = UDim.new(0, 10)
StartCorner.Parent = StartBtn

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0.43, 0, 0, 45)
CloseBtn.Position = UDim2.new(0.52, 0, 0, 343)
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
CloseBtn.Text = "❌ CLOSE"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 15
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 10)
CloseCorner.Parent = CloseBtn

-- Variables
local TotalSpammed = 0

-- Button Actions
StartBtn.MouseButton1Click:Connect(function()
    Config.Enabled = not Config.Enabled
    
    if Config.Enabled then
        StartBtn.Text = "⏸️ STOP"
        StartBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
        Status.Text = "🎯 Status: 🔥 SPAMMING!"
        Status.TextColor3 = Color3.fromRGB(100, 255, 100)
    else
        StartBtn.Text = "▶️ START SPAM"
        StartBtn.BackgroundColor3 = Color3.fromRGB(50, 220, 50)
        Status.Text = "🎯 Status: Idle"
        Status.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- SPAM LOOP yang BENAR!
-- Spam Fire(1) berkali-kali per detik
spawn(function()
    while true do
        if Config.Enabled then
            local delay = 1 / Config.SpamPerSecond -- Calculate delay based on spam rate
            
            -- Spam dengan parameter 1 (seperti di Sigma Spy)
            for i = 1, math.ceil(Config.SpamPerSecond / 100) do
                pcall(function()
                    AutoTrainStateHasChanged:Fire(1)
                    TotalSpammed = TotalSpammed + 1
                end)
            end
            
            -- Update counter setiap 100 spam
            if TotalSpammed % 100 == 0 then
                Counter.Text = "📊 Total Spammed: " .. TotalSpammed
            end
            
            task.wait(delay * 100) -- Delay proporsional
        else
            task.wait(0.1)
        end
    end
end)

-- Extra aggressive spam loop (no delay)
spawn(function()
    while true do
        if Config.Enabled then
            pcall(function()
                AutoTrainStateHasChanged:Fire(1)
                TotalSpammed = TotalSpammed + 1
            end)
        else
            task.wait(0.1)
        end
        task.wait() -- Minimal delay
    end
end)

-- Info
print("✅ Train Speed Spam Loaded!")
print("📡 Remote:", AutoTrainStateHasChanged:GetFullName())
print("🔥 Spam Rate:", Config.SpamPerSecond, "per second")
print("⚡ Parameter: 1 (seperti game aslinya)")
print("💡 TEKAN E UNTUK TRAINING, lalu tekan START!")
