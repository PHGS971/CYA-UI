local CYA = loadstring(game:HttpGet("https://raw.githubusercontent.com/PHGS971/CYA-UI/main/CYAUI.lua"))()

CYA:PlayIntro(function()
    local Window = CYA:CreateWindow({
        Title = "Meu Hub",
        Icon = "rbxassetid://10723423456",
        Author = "MeuNome",
        Size = UDim2.fromOffset(580, 300),
        Theme = "Dark"
    })

    local Tab1 = Window:CreateTab("Principal")
    local Tab2 = Window:CreateTab("Configurações")

    local Elements = loadstring(game:HttpGet("https://raw.githubusercontent.com/PHGS971/CYA-UI/main/Library/Elements.lua"))()
    Elements:CreateButton(Tab1, "Executar Script", function()
        print("Executando...")
    end)
end)
