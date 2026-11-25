local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- Remove instâncias anteriores para evitar duplicação
if CoreGui:FindFirstChild("BloxruiXHub") then
    CoreGui.BloxruiXHub:Destroy()
end

local Config = {
    PlayerESP = false,
    FruitESP = false,
    ChestESP = false,
    AntiLag = false,
    AutoFarmLevel = false,
    MobKillAura = false,
    ChestFarm = false,
    QuestAccept = false,
    BossFarm = false,
    Aimbot = false,
    AutoParry = false,
    SkillSpam = false,
    TargetLock = false,
    FruitNotifier = false,
    AutoBuyFruit = false,
    SeaBeastHunter = false,
    FastTravel = false
}

-- Criação da Interface Principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BloxruiXHub"
ScreenGui.Parent = CoreGui
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

-- Barra Superior
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(11, 17, 28)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 10)
TopBarCorner.Parent = TopBar

-- Correção visual para os cantos superiores da TopBar não passarem do Frame
local TopBarCover = Instance.new("Frame")
TopBarCover.Size = UDim2.new(1, 0, 0, 10)
TopBarCover.Position = UDim2.new(0, 0, 1, -10)
TopBarCover.BackgroundColor3 = Color3.fromRGB(11, 17, 28)
TopBarCover.BorderSizePixel = 0
TopBarCover.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 320, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "BLOXRUI X - PREMIUM SCRIPT HUB v.5.1"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local PlayerInfo = Instance.new("TextLabel")
PlayerInfo.Size = UDim2.new(0, 200, 1, 0)
PlayerInfo.Position = UDim2.new(1, -265, 0, 0)
PlayerInfo.BackgroundTransparency = 1
PlayerInfo.Text = "User: " .. LocalPlayer.Name .. " | Status: Online"
PlayerInfo.TextColor3 = Color3.fromRGB(100, 220, 150)
PlayerInfo.Font = Enum.Font.Gotham
PlayerInfo.TextSize = 11
PlayerInfo.TextXAlignment = Enum.TextXAlignment.Right
PlayerInfo.Parent = TopBar

-- Container para o corpo do Hub (Conteúdo a ocultar ao minimizar)
local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, 0, 1, -45)
Container.Position = UDim2.new(0, 0, 0, 45)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

-- Botão de Fechar Permanentemente (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 30)
CloseBtn.Position = UDim2.new(1, -42, 0.5, -15)
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Botão de Minimizar / Diminuir (-)
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 35, 0, 30)
MinimizeBtn.Position = UDim2.new(1, -82, 0.5, -15)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 60, 90)
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 16
MinimizeBtn.Parent = TopBar

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinimizeBtn

local isMinimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    Container.Visible = not isMinimized
    if isMinimized then
        MainFrame.Size = UDim2.new(0, 780, 0, 45)
        MinimizeBtn.Text = "+"
    else
        MainFrame.Size = UDim2.new(0, 780, 0, 460)
        MinimizeBtn.Text = "-"
    end
end)

-- Sidebar Esquerda (Categorias)
local LeftSidebar = Instance.new("ScrollingFrame")
LeftSidebar.Size = UDim2.new(0, 165, 1, -15)
LeftSidebar.Position = UDim2.new(0, 10, 0, 8)
LeftSidebar.BackgroundColor3 = Color3.fromRGB(19, 29, 45)
LeftSidebar.BorderSizePixel = 0
LeftSidebar.ScrollBarThickness = 3
LeftSidebar.Parent = Container

local LeftLayout = Instance.new("UIListLayout")
LeftLayout.Padding = UDim.new(0, 5)
LeftLayout.Parent = LeftSidebar

-- Painel Central (Botões)
local CenterPanel = Instance.new("ScrollingFrame")
CenterPanel.Size = UDim2.new(0, 385, 1, -15)
CenterPanel.Position = UDim2.new(0, 185, 0, 8)
CenterPanel.BackgroundColor3 = Color3.fromRGB(19, 29, 45)
CenterPanel.BorderSizePixel = 0
CenterPanel.ScrollBarThickness = 4
CenterPanel.Parent = Container

local CenterLayout = Instance.new("UIListLayout")
CenterLayout.Padding = UDim.new(0, 8)
CenterLayout.Parent = CenterPanel

-- Painel Direito (Logs de Atividade)
local RightPanel = Instance.new("Frame")
RightPanel.Size = UDim2.new(0, 190, 1, -15)
RightPanel.Position = UDim2.new(0, 580, 0, 8)
RightPanel.BackgroundColor3 = Color3.fromRGB(19, 29, 45)
RightPanel.BorderSizePixel = 0
RightPanel.Parent = Container

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
LogBox.Text = "[" .. os.date("%H:%M:%S") .. "] Hub pronto e funcional!\n"
LogBox.Parent = RightPanel

local function AddLog(msg)
    LogBox.Text = LogBox.Text .. "[" .. os.date("%H:%M:%S") .. "] " .. msg .. "\n"
end

-- Construtor de Botões Funcionais
local function CreateToggle(text, configKey, actionFunction)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -10, 0, 34)
    Btn.BackgroundColor3 = Color3.fromRGB(27, 41, 63)
    Btn.Text = "  " .. text .. " : OFF"
    Btn.TextColor3 = Color3.fromRGB(210, 220, 230)
    Btn.Font = Enum.Font.GothamSemibold
    Btn.TextSize = 12
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
                pcall(function()
                    actionFunction(Config[configKey])
                end)
            end)
        end
    end)
end

-- Categorias no Menu Esquerdo
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

-- === IMPLEMENTAÇÃO DA LÓGICA REAL DOS BOTÕES ===

-- 1. Player ESP (Destaca jogadores)
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

-- 2. Fruit ESP (Destaca Frutas no mapa)
CreateToggle("Fruit ESP", "FruitESP", function(state)
    while Config.FruitESP and task.wait(2) do
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("Tool") and (obj.Name:find("Fruit") or obj:FindFirstChild("Handle")) then
                local handle = obj:FindFirstChild("Handle") or obj
                if not handle:FindFirstChild("FruitHighlight") then
                    local hl = Instance.new("Highlight")
                    hl.Name = "FruitHighlight"
                    hl.FillColor = Color3.fromRGB(0, 255, 0)
                    hl.Parent = handle
                end
            end
        end
    end
end)

-- 3. Chest ESP (Destaca Baús)
CreateToggle("Chest ESP", "ChestESP", function(state)
    while Config.ChestESP and task.wait(2) do
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj.Name:find("Chest") and obj:IsA("
