local Tabs = {}
Tabs.__index = Tabs

function Tabs:New(parentFrame)
    self.Parent = parentFrame
    self.TabsList = {}
    return self
end

function Tabs:AddTab(tabName)
    local TabButton = Instance.new("TextButton", self.Parent)
    TabButton.Size = UDim2.new(0, 100, 0, 30)
    TabButton.Text = tabName
    table.insert(self.TabsList, TabButton)
end

return Tabs
