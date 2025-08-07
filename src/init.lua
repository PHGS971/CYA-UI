-- Arquivo inicial da CYA UI
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Fade de introdução
local introGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
introGui.Name = "CYAIntroUI"

local label = Instance.new("TextLabel")
label.Parent = introGui
label.Size = UDim2.new(0, 300, 0, 50)
label.Position = UDim2.new(0, -300, 0.5, -25)
label.BackgroundTransparency = 1
label.TextScaled = true
label.Text = "CYA UI"
label.Font = Enum.Font.GothamBold
label.TextColor3 = Color3.fromRGB(255, 255, 255)

local tween = TweenService:Create(label, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -150, 0.5, -25)
})
tween:Play()
tween.Completed:Wait()

task.wait(2)

local outro = TweenService:Create(label, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
    Position = UDim2.new(1.5, 0, 0.5, -25)
})
outro:Play()
outro.Completed:Wait()

introGui:Destroy()

-- Carregar a UI completa (coloque seu sistema aqui)
print("CYA UI carregada!")
