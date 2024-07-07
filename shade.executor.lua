-- credits to SIGMABOY456 for his script that executes
-- After five attempts of making a executor, i finally made it
-- Here i present to you Shade a working executor!

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel1 = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local ScrollingFrame = Instance.new("ScrollingFrame")
local TextButton3 = Instance.new("TextButton")

ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
 
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(98, 98, 98)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.172, 0, 0.121, 0)
Frame.Size = UDim2.new(0, 564, 0, 359)
Frame.Active = true
Frame.Draggable = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 564, 0, 50)
TextLabel.Font = Enum.Font.ArimoBold
TextLabel.Text = " Shade V1.1"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = false
TextLabel.TextSize = 28
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

TextLabel1.Parent = TextLabel
TextLabel1.BackgroundTransparency = 1
TextLabel1.BorderSizePixel = 0
TextLabel1.Position = UDim2.new(0.271, 0, 0.145, 0)
TextLabel1.Size = UDim2.new(0, 85, 0, 35)
TextLabel1.Font = Enum.Font.ArimoBold
TextLabel1.Text = "Active"
TextLabel1.TextColor3 = Color3.fromRGB(72, 255, 0)
TextLabel1.TextScaled = true
TextLabel1.TextWrapped = true

TextButton3.Parent = Frame
TextButton3.BackgroundColor3 = Color3.fromRGB(91, 91, 91)
TextButton3.BorderSizePixel = 0
TextButton3.Position = UDim2.new(0.589, 0, 0.877, 0)
TextButton3.Size = UDim2.new(0, 217, 0, 35)
TextButton3.Font = Enum.Font.SourceSansBold
TextButton3.Text = "Execute"
TextButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton3.TextScaled = true
TextButton3.TextWrapped = true

ScrollingFrame.Parent = Frame
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0.021, 0, 0.167, 0)
ScrollingFrame.Size = UDim2.new(0, 537, 0, 247)
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 20, 0)
ScrollingFrame.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
ScrollingFrame.ScrollBarThickness = 10
ScrollingFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
ScrollingFrame.VerticalScrollBarInset = 'None'
ScrollingFrame.ZIndex = 1

TextBox.Parent = ScrollingFrame
TextBox.BackgroundTransparency = 1
TextBox.BorderSizePixel = 0
TextBox.ClearTextOnFocus = false
TextBox.MultiLine = true
TextBox.Position = UDim2.new(0, 0, 0, 0)
TextBox.Size = UDim2.new(0, 518, 0, 7170)
TextBox.Font = Enum.Font.SourceSansBold
TextBox.TextSize = 20.000
TextBox.TextScaled = false
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Text = ""
TextBox.ZIndex = 1

-- Function to execute Lua code
local function executeCode(code)
    local f, err = loadstring(code)
    if f then
        local success, result = pcall(f)
        if success then
            print("Code executed successfully.")
        else
            print("Execution error:", result)
        end
    else
        print("Syntax error:", err)
    end
end

TextButton3.MouseButton1Click:Connect(function()
    local code = TextBox.Text
    executeCode(code)
end)
 
-- Function to format the code
local function formatCode(code)
    local formattedCode = ""
    local indentLevel = 0
 
    for line in code:gmatch("[^\r\n]+") do
        line = line:match("^%s*(.-)%s*$") -- trim leading and trailing whitespace
        if line ~= "" then
            if line:match("end") then
                indentLevel = indentLevel - 1
            end
            formattedCode = formattedCode .. string.rep("  ", indentLevel) .. line .. "\n"
            if line:match("then") or line:match("do") then
                indentLevel = indentLevel + 1
            end
        end
    end
 
    return formattedCode
end
