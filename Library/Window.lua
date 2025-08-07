local Window = {}
Window.__index = Window

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- Função para criar a janela principal
function Window:Init(config)
    local self = setmetatable({}, Window)

    -- Criar ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CYA_UI_Main"
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ResetOnSpawn = false

    -- Frame principal
    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = config.Size or UDim2.fromOffset(580, 300)
    MainFrame.Position = UDim2.new(0.5, -290, 0.5, -150)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0

    -- Cantos arredondados
    local UICorner = Instance.new("UICorner", MainFrame)
    UICorner.CornerRadius = UDim.new(0, 8)

    -- Cabeçalho
    local Header = Instance.new("Frame", MainFrame)
    Header.Size = UDim2.new(1, 0, 0, 40)
    Header.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Header.BorderSizePixel = 0

    local UIStroke = Instance.new("UIStroke", Header)
    UIStroke.Color = Color3.fromRGB(60, 60, 60)
    UIStroke.Thickness = 1

    local Title = Instance.new("TextLabel", Header)
    Title.Size = UDim2.new(1, -40, 1, 0)
    Title.Position = UDim2.new(0, 40, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = (config.Title or "CYA Hub") .. " | " .. (config.Author or "Desconhecido")
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.TextXAlignment = Enum.TextXAlignment.Left

    -- Ícone no cabeçalho
    local Icon = Instance.new("ImageLabel", Header)
    Icon.Size = UDim2.new(0, 24, 0, 24)
    Icon.Position = UDim2.new(0, 8, 0.5, -12)
    Icon.BackgroundTransparency = 1
    Icon.Image = config.Icon or "rbxassetid://10723423456"

    -- Container lateral para Tabs
    local TabsContainer = Instance.new("ScrollingFrame", MainFrame)
    TabsContainer.Size = UDim2.new(0, 150, 1, -40)
    TabsContainer.Position = UDim2.new(0, 0, 0, 40)
    TabsContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    TabsContainer.ScrollBarThickness = 4
    TabsContainer.BorderSizePixel = 0
    TabsContainer.CanvasSize = UDim2.new(0, 0, 0, 0)

    local TabsLayout = Instance.new("UIListLayout", TabsContainer)
    TabsLayout.Padding = UDim.new(0, 4)
    TabsLayout.SortOrder = Enum.SortOrder.LayoutOrder

    -- Área de conteúdo
    local ContentFrame = Instance.new("Frame", MainFrame)
    ContentFrame.Size = UDim2.new(1, -150, 1, -40)
    ContentFrame.Position = UDim2.new(0, 150, 0, 40)
    ContentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    ContentFrame.BorderSizePixel = 0

    local ContentCorner = Instance.new("UICorner", ContentFrame)
    ContentCorner.CornerRadius = UDim.new(0, 6)

    -- Lista de abas
    self.Tabs = {}
    self.ContentFrame = ContentFrame
    self.TabsContainer = TabsContainer

    return self
end

-- Criar nova Tab
function Window:CreateTab(name)
    local TabButton = Instance.new("TextButton", self.TabsContainer)
    TabButton.Size = UDim2.new(1, -8, 0, 30)
    TabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.Font = Enum.Font.Gotham
    TabButton.TextSize = 14
    TabButton.Text = name
    TabButton.AutoButtonColor = false

    local BtnCorner = Instance.new("UICorner", TabButton)
    BtnCorner.CornerRadius = UDim.new(0, 4)

    -- Frame de conteúdo para esta aba
    local TabContent = Instance.new("ScrollingFrame", self.ContentFrame)
    TabContent.Size = UDim2.new(1, 0, 1, 0)
    TabContent.BackgroundTransparency = 1
    TabContent.BorderSizePixel = 0
    TabContent.Visible = false
    TabContent.ScrollBarThickness = 6
    TabContent.CanvasSize = UDim2.new(0, 0, 0, 0)

    local Layout = Instance.new("UIListLayout", TabContent)
    Layout.Padding = UDim.new(0, 6)
    Layout.SortOrder = Enum.SortOrder.LayoutOrder

    -- Quando clicar na Tab
    TabButton.MouseButton1Click:Connect(function()
        for _, tab in pairs(self.Tabs) do
            tab.Content.Visible = false
        end
        TabContent.Visible = true
    end)

    table.insert(self.Tabs, {Button = TabButton, Content = TabContent})

    -- Ajustar CanvasSize
    self.TabsContainer.CanvasSize = UDim2.new(0, 0, 0, #self.Tabs * 34)

    return TabContent
end

return Window
