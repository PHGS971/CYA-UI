local Elements = {}

function Elements:CreateButton(parent, text, callback)
    local Btn = Instance.new("TextButton", parent)
    Btn.Size = UDim2.new(0, 120, 0, 30)
    Btn.Text = text
    Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.MouseButton1Click:Connect(callback)
    return Btn
end

return Elements
