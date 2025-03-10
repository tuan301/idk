local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")
local screenGui = Instance.new("ScreenGui")
local textLabel = Instance.new("TextLabel")

screenGui.Parent = player:WaitForChild("PlayerGui")
textLabel.Parent = screenGui
textLabel.Size = UDim2.new(0, 200, 0, 50)
textLabel.Position = UDim2.new(0.5, -100, 0, 50)
textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextScaled = true
textLabel.Text = "Whale Caught: 0"

local function countBlueWhale()
    local count = 0
    if backpack then
        for _, item in ipairs(backpack:GetChildren()) do
            if item:IsA("Tool") and item.Name == "Blue Whale" then
                count = count + 1
            end
        end
    end
    textLabel.Text = "Total: " .. count
end

if backpack then
    backpack.ChildAdded:Connect(countBlueWhale)
    backpack.ChildRemoved:Connect(countBlueWhale)
end

countBlueWhale()
