-- TESTE DE EXECUÇÃO REAL NO PERSONAGEM
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("BloxruiXHub") then
    CoreGui.BloxruiXHub:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BloxruiXHub"
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 200)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 23, 36)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Btn = Instance.new("TextButton")
Btn.Size = UDim2.new(0, 360, 0, 50)
Btn.Position = UDim2.new(0, 20, 0, 70)
Btn.BackgroundColor3 = Color3.fromRGB(30, 110, 140)
Btn.Text = "CLICA AQUI PARA CORRER RÁPIDO"
Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Btn.Font = Enum.Font.GothamBold
Btn.TextSize = 14
Btn.Parent = MainFrame

Btn.MouseButton1Click:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 50
        print("Função executada: Velocidade alterada para 50!")
    end
end)
