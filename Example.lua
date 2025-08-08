local CreateWindow = require("CYAUI")

-- Cria a janela principal
local CYA = CreateWindow{
    name = "Meu Hub Legal",
    author = "By PHGS",
    Color = "Dark",
    ConfigFolder = "clouding"
}

-- Cria uma aba
local tabHome = CYA:Tab_Home{
    createtab = "Home",
    icon = "home"
}

-- Cria um dropdown na aba Home
local dropdown = CYA:createDropdown(tabHome, {
    title = "Escolha uma vogal",
    options = "a,e,i,o,u"
}, function(selected)
    print("Dropdown mudou para: " .. selected)
end)

-- Cria um botão na aba Home
local button = CYA:createButton(tabHome, {
    title = "Clique Aqui"
}, function()
    print("Botão clicado!")
end)

-- Cria um input na aba Home
local input = CYA:createInput(tabHome, {
    placeholder = "Digite algo"
}, function(text)
    print("Input mudou: " .. text)
end)

-- Cria uma seleção (checkbox) na aba Home
local selection = CYA:createSelection(tabHome, {
    title = "Ativar modo"
}, function(checked)
    print("Modo ativado? " .. tostring(checked))
end)

