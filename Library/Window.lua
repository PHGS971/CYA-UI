local CYAUI = {}
CYAUI.__index = CYAUI

-- Helper para copiar tabela (simples)
local function shallowCopy(tbl)
    local t = {}
    for k,v in pairs(tbl) do t[k] = v end
    return t
end

-- Função para criar janela principal (construtor)
function CreateWindow(params)
    local self = setmetatable({}, CYAUI)
    self.name = params.name or "CYAUI Hub"
    self.author = params.author or "By PHGS"
    self.color = params.Color or "Dark"
    self.configFolder = params.ConfigFolder or "config"
    self.tabs = {}
    self.visible = true
    self.x, self.y = 100, 100
    self.width, self.height = 500, 400
    self.dragging = false
    self.dragOffsetX, self.dragOffsetY = 0, 0

    return self
end

-- Método para criar abas (Tabs)
function CYAUI:Tab_Home(params)
    local tab = {
        title = params.createtab or "Tab",
        icon = params.icon or "default",
        dropdowns = {},
        buttons = {},
        inputs = {},
        selections = {},
    }
    table.insert(self.tabs, tab)
    return tab
end

-- Método para criar dropdown dentro de uma aba
function CYAUI:createDropdown(tab, params, onChange)
    local dropdown = {
        title = params.title or "Dropdown",
        options = {},
        selected = nil,
        onChange = onChange,
    }

    -- Parse opções (se string separada por vírgula ou espaço)
    if type(params.options) == "string" then
        dropdown.options = {}
        for option in params.options:gmatch("[^, ]+") do
            table.insert(dropdown.options, option)
        end
    elseif type(params.options) == "table" then
        dropdown.options = shallowCopy(params.options)
    end

    dropdown.selected = dropdown.options[1]

    table.insert(tab.dropdowns, dropdown)
    return dropdown
end

-- Método para criar botão dentro de uma aba
function CYAUI:createButton(tab, params, onClick)
    local button = {
        title = params.title or "Button",
        onClick = onClick,
    }
    table.insert(tab.buttons, button)
    return button
end

-- Método para criar input dentro de uma aba
function CYAUI:createInput(tab, params, onChange)
    local input = {
        placeholder = params.placeholder or "",
        text = "",
        onChange = onChange,
    }
    table.insert(tab.inputs, input)
    return input
end

-- Método para criar seleção (checkbox ou radio) dentro de uma aba
function CYAUI:createSelection(tab, params, onToggle)
    local selection = {
        title = params.title or "Selection",
        checked = false,
        onToggle = onToggle,
    }
    table.insert(tab.selections, selection)
    return selection
end

-- (Opcional) função para desenhar (a adaptar para seu sistema gráfico)
function CYAUI:draw()
    print("=== Janela: " .. self.name .. " | Autor: " .. self.author)
    print("Visível? " .. tostring(self.visible))
    print("Tabs:")
    for i, tab in ipairs(self.tabs) do
        print(string.format(" Tab %d: %s (Icon: %s)", i, tab.title, tab.icon))
        for _, dropdown in ipairs(tab.dropdowns) do
            print("  Dropdown: " .. dropdown.title .. " | Selecionado: " .. tostring(dropdown.selected))
        end
        for _, button in ipairs(tab.buttons) do
            print("  Button: " .. button.title)
        end
        for _, input in ipairs(tab.inputs) do
            print("  Input: " .. input.placeholder .. " | Texto: " .. input.text)
        end
        for _, selection in ipairs(tab.selections) do
            print("  Selection: " .. selection.title .. " | Checked: " .. tostring(selection.checked))
        end
    end
end

return CreateWindow
