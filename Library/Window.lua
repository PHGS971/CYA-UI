local Window = {}
Window.__index = Window

function Window:Init(config)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CYA_UI_Main"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.IgnoreGuiInset = true

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = config.Size or UDim2.fromOffset(580, 300)
    MainFrame.Position = UDim2.new(0.5, -290, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

    local Title = Instance.new("TextLabel", MainFrame)
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.BackgroundTransparency = 1
    Title.Text = (config.Title or "CYA Hub") .. " | " .. (config.Author or "Desconhecido")
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18

    self.Frame = MainFrame
    return self
end

function Window:CreateTab(name)
    print("Criando tab:", name)
    -- Aqui você pode integrar com o Tabs.lua
end

return Window
