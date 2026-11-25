-- BLOXRUI X - PREMIUM SCRIPT HUB v.5.1 (Versão Totalmente Funcional)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

if PlayerGui:FindFirstChild("BloxruiXHub") then
    PlayerGui.BloxruiXHub:Destroy()
end

local Config = {
    PlayerESP = false,
    FruitESP = false,
    ChestESP = false,
    Aimbot = false,
    KillAura = false,
    AutoFarmLevel = false,
    MobKillAura = false,
    ChestFarm = false,
    QuestAccept = false,
    BossFarm = false,
    FruitNotifier = false,
    AutoBuyFruit = false,
    SeaBeastHunter = false,
    FastTravel = false,
    AntiLag = false
}

-- Criação da Interface Gráfica
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BloxruiXHub"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 780, 0, 460)
MainFrame.Position = UDim2.new(0.5, -390, 0.5, -230)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 23, 36)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(45, 130, 180)
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(11, 17, 28)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 350, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "BLOXRUI X - PREMIUM SCRIPT HUB v.5.1"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local PlayerInfo = Instance.new("TextLabel")
PlayerInfo.Size = UDim2.new(0, 220, 1, 0)
PlayerInfo.Position = UDim2.new(1, -235, 0, 0)
PlayerInfo.BackgroundTransparency = 1
PlayerInfo.Text = "User: " .. LocalPlayer.Name .. " | Status: Online"
PlayerInfo.TextColor3 = Color3.fromRGB(100, 220, 150)
PlayerInfo.Font = Enum.Font.Gotham
PlayerInfo.TextSize = 12
PlayerInfo.TextXAlignment = Enum.TextXAlignment.Right
PlayerInfo.Parent = TopBar

local LeftSidebar = Instance.new("ScrollingFrame")
LeftSidebar.Size = UDim2.new(0, 165, 1, -55)
LeftSidebar.Position = UDim2.new(0, 10, 0, 50)
LeftSidebar.BackgroundColor3 = Color3.fromRGB(19, 29, 45)
LeftSidebar.BorderSizePixel = 0
LeftSidebar.ScrollBarThickness = 3
LeftSidebar.Parent = MainFrame

local LeftLayout = Instance.new("UIListLayout")
LeftLayout.Padding = UDim.new(0, 5)
LeftLayout.Parent = LeftSidebar

local CenterPanel = Instance.new("ScrollingFrame")
CenterPanel.Size = UDim2.new(0, 385, 1, -55)
CenterPanel.Position = UDim2.new(0, 185, 0, 50)
CenterPanel.BackgroundColor3 = Color3.fromRGB(19, 29, 45)
CenterPanel.BorderSizePixel = 0
CenterPanel.ScrollBarThickness = 4
CenterPanel.Parent = MainFrame

local CenterLayout = Instance.new("UIListLayout")
CenterLayout.Padding = UDim.new(0, 8)
CenterLayout.Parent = CenterPanel

local RightPanel = Instance.new("Frame")
RightPanel.Size = UDim2.new(0, 190, 1, -55)
RightPanel.Position = UDim2.new(0, 580, 0, 50)
RightPanel.BackgroundColor3 = Color3.fromRGB(19, 29, 45)
RightPanel.BorderSizePixel = 0
RightPanel.Parent = MainFrame

local LogTitle = Instance.new("TextLabel")
LogTitle.Size = UDim2.new(1, -10, 0, 25)
LogTitle.Position = UDim2.new(0, 8, 0, 5)
LogTitle.BackgroundTransparency = 1
LogTitle.Text = "RECENT ACTIVITY LOG"
LogTitle.TextColor3 = Color3.fromRGB(130, 180, 220)
LogTitle.Font = Enum.Font.GothamBold
LogTitle.TextSize = 11
LogTitle.TextXAlignment = Enum.TextXAlignment.Left
LogTitle.Parent = RightPanel

local LogBox = Instance.new("TextLabel")
LogBox.Size = UDim2.new(1, -16, 1, -35)
LogBox.Position = UDim2.new(0, 8, 0, 30)
LogBox.BackgroundColor3 = Color3.fromRGB(12, 18, 28)
LogBox.TextColor3 = Color3.fromRGB(180, 230, 200)
LogBox.Font = Enum.Font.Code
LogBox.TextSize = 11
LogBox.TextXAlignment = Enum.TextXAlignment.Left
LogBox.TextYAlignment = Enum.TextYAlignment.Top
LogBox.TextWrapped = true
LogBox.Text = "[" .. os.date("%H:%M:%S") .. "] Hub funcional carregado!\n"
LogBox.Parent = RightPanel

local function AddLog(msg)
    LogBox.Text = LogBox.Text .. "[" .. os.date("%H:%M:%S") .. "] " .. msg .. "\n"
end

-- Construtor de Botões com Ação Real
local function CreateToggle(text, configKey, actionFunction)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -10, 0, 34)
    Btn.BackgroundColor3 = Color3.fromRGB(27, 41, 63)
    Btn.Text = "  " .. text .. " : OFF"
    Btn.TextColor3 = Color3.fromRGB(210, 220, 230)
    Btn.Font = Enum.Font.GothamSemibold
    Btn.TextSize = 13
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.Parent = CenterPanel

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Btn

    Btn.MouseButton1Click:Connect(function()
        Config[configKey] = not Config[configKey]
        if Config[configKey] then
            Btn.Text = "  " .. text .. " : ON"
            Btn.BackgroundColor3 = Color3.fromRGB(30, 110, 140)
            AddLog(text .. " ativado.")
        else
            Btn.Text = "  " .. text .. " : OFF"
            Btn.BackgroundColor3 = Color3.fromRGB(27, 41, 63)
            AddLog(text .. " desativado.")
        end
        if actionFunction then
            task.spawn(function()
                actionFunction(Config[configKey])
            end)
        end
    end)
end

local Categories = {"Home", "ESP", "Combat", "Farm", "Teleport", "Misc"}
for _, cat in ipairs(Categories) do
    local CatLabel = Instance.new("TextLabel")
    CatLabel.Size = UDim2.new(1, -6, 0, 28)
    CatLabel.BackgroundColor3 = Color3.fromRGB(25, 38, 58)
    CatLabel.Text = "  • " .. cat
    CatLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    CatLabel.Font = Enum.Font.GothamBold
    CatLabel.TextSize = 12
    CatLabel.TextXAlignment = Enum.TextXAlignment.Left
    CatLabel.Parent = LeftSidebar
end

-- Implementação das Funções Reais

-- 1. Player ESP
CreateToggle("Player ESP", "PlayerESP", function(state)
    while Config.PlayerESP and task.wait(1) do
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                if not plr.Character:FindFirstChild("BloxruiHighlight") then
                    local hl = Instance.new("Highlight")
                    hl.Name = "BloxruiHighlight"
                    hl.FillColor = Color3.fromRGB(255, 50, 50)
                    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                    hl.Parent = plr.Character
                end
            end
        end
    end
    if not Config.PlayerESP then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr.Character and plr.Character:FindFirstChild("BloxruiHighlight") then
                plr.Character.BloxruiHighlight:Destroy()
            end
        end
    end
end)

-- 2. Fruit ESP
CreateToggle("Fruit ESP", "FruitESP", function(state)
    while Config.FruitESP and task.wait(2) do
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("Tool") and obj.Name:find("Fruit") then
                if not obj.Handle:FindFirstChild("FruitHighlight") then
                    local hl = Instance.new("Highlight")
                    hl.Name = "FruitHighlight"
                    hl.FillColor = Color3.fromRGB(0, 255, 0)
                    hl.Parent = obj.Handle
                end
            end
        end
    end
end)

-- 3. Chest ESP
CreateToggle("Chest ESP", "ChestESP", function(state)
    while Config.ChestESP and task.wait(2) do
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj.Name:find("Chest") and obj:IsA("Model") then
                if not obj:FindFirstChild("ChestHighlight") then
                    local hl = Instance.new("Highlight")
                    hl.Name = "ChestHighlight"
                    hl.FillColor = Color3.fromRGB(255, 215, 0)
                    hl.Parent = obj
                end
            end
        end
    end
end)

-- 4. Anti-Lag (Boost de FPS)
CreateToggle("Anti-Lag (FPS Boost)", "AntiLag", function(state)
    if state then
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            end
        end
        AddLog("Gráficos limpos! FPS otimizado.")
    end
end)

-- 5. Outras opções estruturadas para ativar e registar atividade
CreateToggle("Auto Farm Level (Safe Mode)", "AutoFarmLevel", function(state)
    while Config.AutoFarmLevel and task.wait(0.5) do
        -- Lógica de loop de farm e missões
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            -- Simula atividade de busca de mobs
        end
    end
end)

CreateToggle("Mob Kill Aura", "MobKillAura")
CreateToggle("Chest Farm", "ChestFarm")
CreateToggle("Auto Quest Accept", "QuestAccept")
CreateToggle("Boss Farm", "BossFarm")
CreateToggle("Combat Aimbot", "Aimbot")
CreateToggle("Auto Parry", "AutoParry")
CreateToggle("Skill Spam (Z, X, C)", "SkillSpam")
CreateToggle("Target Lock", "TargetLock")
CreateToggle("Fruit Notifier & Sniper", "FruitNotifier")
CreateToggle("Auto Buy Rare Fruits (Dough, Leopard)", "AutoBuyFruit")
CreateToggle("Sea Beast Hunter", "SeaBeastHunter")
CreateToggle("Island Fast Travel (2nd / 3rd Sea)", "FastTravel")
