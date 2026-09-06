local AvUI = {}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer

local Colors = {
    Background = Color3.fromRGB(12, 12, 12),
    Surface = Color3.fromRGB(18, 18, 18),
    Element = Color3.fromRGB(22, 22, 22),
    ElementHover = Color3.fromRGB(28, 28, 28),
    Border = Color3.fromRGB(32, 32, 32),
    Text = Color3.fromRGB(235, 235, 235),
    SubText = Color3.fromRGB(160, 160, 160),
    Accent = Color3.fromRGB(108, 92, 231),
    AccentHover = Color3.fromRGB(125, 110, 240),
    Toggle = Color3.fromRGB(55, 55, 55),
    ToggleOn = Color3.fromRGB(108, 92, 231),
    SliderBg = Color3.fromRGB(35, 35, 35),
    Notif = Color3.fromRGB(16, 16, 16),
}

local Fonts = {
    Regular = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
    Medium = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
    SemiBold = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
    Bold = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
}

local fastTI = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local smoothTI = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local slideTI = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local function tween(obj, info, props)
    TweenService:Create(obj, info, props):Play()
end

local function makeCorner(parent, radius)
    local c = Instance.new("UICorner", parent)
    c.CornerRadius = UDim.new(0, radius or 6)
    return c
end

local function makeStroke(parent, color, thickness)
    local s = Instance.new("UIStroke", parent)
    s.Color = color or Colors.Border
    s.Thickness = thickness or 1
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    return s
end

local function makePadding(parent, t, b, l, r)
    local p = Instance.new("UIPadding", parent)
    p.PaddingTop = UDim.new(0, t or 0)
    p.PaddingBottom = UDim.new(0, b or 0)
    p.PaddingLeft = UDim.new(0, l or 0)
    p.PaddingRight = UDim.new(0, r or 0)
    return p
end

local function makeList(parent, padding)
    local l = Instance.new("UIListLayout", parent)
    l.Padding = UDim.new(0, padding or 4)
    l.SortOrder = Enum.SortOrder.LayoutOrder
    l.HorizontalAlignment = Enum.HorizontalAlignment.Center
    return l
end

local function makeText(parent, text, size, color, font, xAlign)
    local t = Instance.new("TextLabel", parent)
    t.BackgroundTransparency = 1
    t.Text = text or ""
    t.TextSize = size or 13
    t.TextColor3 = color or Colors.Text
    t.FontFace = font or Fonts.Regular
    t.TextXAlignment = xAlign or Enum.TextXAlignment.Left
    t.TextWrapped = true
    t.BorderSizePixel = 0
    return t
end

local function connectRefresh(scroll)
    local layout = scroll:FindFirstChildOfClass("UIListLayout")
    if layout then
        layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 8)
        end)
    end
end

local function elementFrame(parent, height)
    local frame = Instance.new("Frame", parent)
    frame.BackgroundColor3 = Colors.Element
    frame.BorderSizePixel = 0
    frame.Size = UDim2.new(1, -8, 0, height or 36)
    makeCorner(frame, 6)
    makeStroke(frame, Colors.Border, 1)
    return frame
end

local function hoverEffect(button, frame)
    button.MouseEnter:Connect(function()
        tween(frame, fastTI, {BackgroundColor3 = Colors.ElementHover})
    end)
    button.MouseLeave:Connect(function()
        tween(frame, fastTI, {BackgroundColor3 = Colors.Element})
    end)
end

AvUI.CreateWindow = function(config)
    config = config or {}
    local win = {}

    local screenGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
    screenGui.Name = "AvUI"
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.ResetOnSpawn = false

    local shadow = Instance.new("ImageLabel", screenGui)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://6014261993"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.5
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    shadow.Size = UDim2.new(0, 560, 0, 360)
    shadow.Position = UDim2.new(0.5, -280, 0.5, -180)
    shadow.ZIndex = 0

    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.BackgroundColor3 = Colors.Background
    mainFrame.BorderSizePixel = 0
    mainFrame.Size = UDim2.new(0, 520, 0, 320)
    mainFrame.Position = UDim2.new(0.5, -260, 0.5, -160)
    mainFrame.ClipsDescendants = true
    mainFrame.ZIndex = 1
    makeCorner(mainFrame, 8)
    makeStroke(mainFrame, Colors.Border, 1.5)

    local topbar = Instance.new("Frame", mainFrame)
    topbar.BackgroundColor3 = Colors.Background
    topbar.BorderSizePixel = 0
    topbar.Size = UDim2.new(1, 0, 0, 38)
    topbar.ZIndex = 10

    local topLine = Instance.new("Frame", topbar)
    topLine.BackgroundColor3 = Colors.Border
    topLine.BorderSizePixel = 0
    topLine.Size = UDim2.new(1, 0, 0, 1)
    topLine.Position = UDim2.new(0, 0, 1, -1)

    local titleLabel = makeText(topbar, config.Title or "AvUI", 14, Colors.Text, Fonts.SemiBold)

    if config.Author then
        titleLabel.Size = UDim2.new(0.6, 0, 0, 20)
        titleLabel.Position = UDim2.new(0, 14, 0, 3)
        local authorLabel = makeText(topbar, config.Author, 10, Colors.SubText, Fonts.Regular)
        authorLabel.Size = UDim2.new(0.6, 0, 0, 14)
        authorLabel.Position = UDim2.new(0, 14, 0, 21)
    else
        titleLabel.Size = UDim2.new(0.6, 0, 1, 0)
        titleLabel.Position = UDim2.new(0, 14, 0, 0)
    end

    local function topBtn(xOff, label, callback)
        local btn = Instance.new("TextButton", topbar)
        btn.BackgroundTransparency = 1
        btn.BorderSizePixel = 0
        btn.Size = UDim2.new(0, 28, 0, 28)
        btn.Position = UDim2.new(1, xOff, 0, 5)
        btn.Text = label
        btn.TextSize = 16
        btn.TextColor3 = Colors.SubText
        btn.FontFace = Fonts.Bold
        btn.ZIndex = 11
        btn.MouseEnter:Connect(function() tween(btn, fastTI, {TextColor3 = Colors.Text}) end)
        btn.MouseLeave:Connect(function() tween(btn, fastTI, {TextColor3 = Colors.SubText}) end)
        btn.MouseButton1Click:Connect(callback)
        return btn
    end

    topBtn(-38, "X", function()
        tween(mainFrame, slideTI, {Size = UDim2.new(0, 520, 0, 0)})
        tween(shadow, slideTI, {Size = UDim2.new(0, 560, 0, 0)})
        task.wait(0.4)
        screenGui:Destroy()
    end)

    local minimized = false
    topBtn(-66, "-", function()
        minimized = not minimized
        if minimized then
            tween(mainFrame, slideTI, {Size = UDim2.new(0, 520, 0, 38)})
            tween(shadow, slideTI, {Size = UDim2.new(0, 560, 0, 78)})
        else
            tween(mainFrame, slideTI, {Size = UDim2.new(0, 520, 0, 320)})
            tween(shadow, slideTI, {Size = UDim2.new(0, 560, 0, 360)})
        end
    end)

    local dragging, dragInput, dragStart, startPos

    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    topbar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            mainFrame.Position = newPos
            shadow.Position = UDim2.new(0, newPos.X.Offset + (newPos.X.Scale * screenGui.AbsoluteSize.X) - 20, 0, newPos.Y.Offset + (newPos.Y.Scale * screenGui.AbsoluteSize.Y) - 20)
        end
    end)

    local toggleKey = config.ToggleKey or Enum.KeyCode.RightShift
    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == toggleKey then
            screenGui.Enabled = not screenGui.Enabled
        end
    end)

    local sidebar = Instance.new("Frame", mainFrame)
    sidebar.BackgroundColor3 = Colors.Surface
    sidebar.BorderSizePixel = 0
    sidebar.Size = UDim2.new(0, 140, 1, -38)
    sidebar.Position = UDim2.new(0, 0, 0, 38)

    local sidebarLine = Instance.new("Frame", sidebar)
    sidebarLine.BackgroundColor3 = Colors.Border
    sidebarLine.BorderSizePixel = 0
    sidebarLine.Size = UDim2.new(0, 1, 1, 0)
    sidebarLine.Position = UDim2.new(1, -1, 0, 0)

    local tabScroll = Instance.new("ScrollingFrame", sidebar)
    tabScroll.BackgroundTransparency = 1
    tabScroll.BorderSizePixel = 0
    tabScroll.Size = UDim2.new(1, -2, 1, -8)
    tabScroll.Position = UDim2.new(0, 0, 0, 4)
    tabScroll.ScrollBarThickness = 2
    tabScroll.ScrollBarImageColor3 = Colors.Border
    tabScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    makePadding(tabScroll, 4, 4, 6, 8)
    makeList(tabScroll, 2)
    connectRefresh(tabScroll)

    local contentArea = Instance.new("Frame", mainFrame)
    contentArea.BackgroundTransparency = 1
    contentArea.BorderSizePixel = 0
    contentArea.Size = UDim2.new(1, -140, 1, -38)
    contentArea.Position = UDim2.new(0, 140, 0, 38)

    local activeTab = nil
    local tabPages = {}

    local notifHolder = Instance.new("Frame", screenGui)
    notifHolder.BackgroundTransparency = 1
    notifHolder.Size = UDim2.new(0, 260, 1, 0)
    notifHolder.Position = UDim2.new(1, -270, 0, 0)
    notifHolder.ZIndex = 100
    local nList = Instance.new("UIListLayout", notifHolder)
    nList.Padding = UDim.new(0, 6)
    nList.VerticalAlignment = Enum.VerticalAlignment.Bottom
    nList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    nList.SortOrder = Enum.SortOrder.LayoutOrder
    makePadding(notifHolder, 0, 10, 0, 0)

    win.Notify = function(nConfig)
        nConfig = nConfig or {}
        local notif = Instance.new("Frame", notifHolder)
        notif.BackgroundColor3 = Colors.Notif
        notif.BorderSizePixel = 0
        notif.Size = UDim2.new(1, 0, 0, 60)
        notif.ZIndex = 100
        makeCorner(notif, 8)
        makeStroke(notif, Colors.Border, 1)

        local nTitle = makeText(notif, nConfig.Title or "Notification", 12, Colors.Text, Fonts.SemiBold)
        nTitle.Size = UDim2.new(1, -16, 0, 18)
        nTitle.Position = UDim2.new(0, 8, 0, 8)
        nTitle.ZIndex = 101

        local nDesc = makeText(notif, nConfig.Description or "", 11, Colors.SubText, Fonts.Regular)
        nDesc.Size = UDim2.new(1, -16, 0, 30)
        nDesc.Position = UDim2.new(0, 8, 0, 26)
        nDesc.ZIndex = 101

        notif.Position = UDim2.new(1, 0, 0, 0)
        tween(notif, smoothTI, {Position = UDim2.new(0, 0, 0, 0)})

        task.delay(nConfig.Duration or 3, function()
            tween(notif, smoothTI, {Position = UDim2.new(1, 0, 0, 0)})
            task.wait(0.3)
            notif:Destroy()
        end)
    end

    local function selectTab(tabBtn)
        if activeTab == tabBtn then return end

        for t, page in pairs(tabPages) do
            page.Visible = false
            tween(t, fastTI, {BackgroundTransparency = 1})
            local nm = t:FindFirstChild("TabName")
            if nm then tween(nm, fastTI, {TextColor3 = Colors.SubText}) end
        end

        activeTab = tabBtn
        tabPages[tabBtn].Visible = true
        tween(tabBtn, fastTI, {BackgroundTransparency = 0.85, BackgroundColor3 = Colors.Accent})
        local nm = tabBtn:FindFirstChild("TabName")
        if nm then tween(nm, fastTI, {TextColor3 = Colors.Text}) end
    end

    win.Tab = function(tabConfig)
        tabConfig = tabConfig or {}
        local tab = {}

        local tabBtn = Instance.new("TextButton", tabScroll)
        tabBtn.BackgroundColor3 = Colors.Accent
        tabBtn.BackgroundTransparency = 1
        tabBtn.BorderSizePixel = 0
        tabBtn.Size = UDim2.new(1, 0, 0, 30)
        tabBtn.Text = ""
        tabBtn.AutoButtonColor = false
        makeCorner(tabBtn, 5)

        local tabName = makeText(tabBtn, tabConfig.Title or "Tab", 12, Colors.SubText, Fonts.Medium)
        tabName.Name = "TabName"
        tabName.Size = UDim2.new(1, -10, 1, 0)
        tabName.Position = UDim2.new(0, 10, 0, 0)

        tabBtn.MouseEnter:Connect(function()
            if activeTab ~= tabBtn then
                tween(tabBtn, fastTI, {BackgroundTransparency = 0.9, BackgroundColor3 = Colors.ElementHover})
            end
        end)
        tabBtn.MouseLeave:Connect(function()
            if activeTab ~= tabBtn then
                tween(tabBtn, fastTI, {BackgroundTransparency = 1})
            end
        end)

        local page = Instance.new("ScrollingFrame", contentArea)
        page.BackgroundTransparency = 1
        page.BorderSizePixel = 0
        page.Size = UDim2.new(1, 0, 1, 0)
        page.ScrollBarThickness = 3
        page.ScrollBarImageColor3 = Colors.Border
        page.Visible = false
        page.CanvasSize = UDim2.new(0, 0, 0, 0)
        makePadding(page, 6, 6, 8, 8)
        makeList(page, 4)
        connectRefresh(page)

        tabPages[tabBtn] = page
        tabBtn.MouseButton1Click:Connect(function() selectTab(tabBtn) end)
        if not activeTab then selectTab(tabBtn) end

        tab.Section = function(sConfig)
            sConfig = sConfig or {}
            local section = Instance.new("Frame", page)
            section.BackgroundTransparency = 1
            section.BorderSizePixel = 0
            section.Size = UDim2.new(1, 0, 0, 22)
            local sLabel = makeText(section, sConfig.Title or "Section", 11, Colors.SubText, Fonts.SemiBold)
            sLabel.Size = UDim2.new(1, -4, 0, 16)
            sLabel.Position = UDim2.new(0, 4, 0, 4)
            sLabel.TextTransparency = 0.2
        end

        tab.Divider = function()
            local div = Instance.new("Frame", page)
            div.BackgroundColor3 = Colors.Border
            div.BorderSizePixel = 0
            div.Size = UDim2.new(1, -16, 0, 1)
        end

        tab.Paragraph = function(pConfig)
            pConfig = pConfig or {}
            local frame = elementFrame(page, 50)
            local pTitle = makeText(frame, pConfig.Title or "", 12, Colors.Text, Fonts.SemiBold)
            pTitle.Size = UDim2.new(1, -16, 0, 16)
            pTitle.Position = UDim2.new(0, 8, 0, 6)
            local pDesc = makeText(frame, pConfig.Content or pConfig.Desc or "", 11, Colors.SubText, Fonts.Regular)
            pDesc.Size = UDim2.new(1, -16, 0, 24)
            pDesc.Position = UDim2.new(0, 8, 0, 22)
        end

        tab.Button = function(bConfig)
            bConfig = bConfig or {}
            local frame = elementFrame(page, bConfig.Desc and 48 or 36)

            local btn = Instance.new("TextButton", frame)
            btn.BackgroundTransparency = 1
            btn.BorderSizePixel = 0
            btn.Size = UDim2.new(1, 0, 1, 0)
            btn.Text = ""

            local bTitle = makeText(btn, bConfig.Title or "Button", 12, Colors.Text, Fonts.Medium)

            if bConfig.Desc then
                bTitle.Size = UDim2.new(0.7, 0, 0, 20)
                bTitle.Position = UDim2.new(0, 10, 0, 5)
                local bDesc = makeText(btn, bConfig.Desc, 10, Colors.SubText, Fonts.Regular)
                bDesc.Size = UDim2.new(0.7, 0, 0, 16)
                bDesc.Position = UDim2.new(0, 10, 0, 24)
            else
                bTitle.Size = UDim2.new(0.7, 0, 1, 0)
                bTitle.Position = UDim2.new(0, 10, 0, 0)
            end

            local arrow = makeText(btn, ">", 14, Colors.SubText, Fonts.Bold, Enum.TextXAlignment.Center)
            arrow.Size = UDim2.new(0, 20, 1, 0)
            arrow.Position = UDim2.new(1, -28, 0, 0)

            hoverEffect(btn, frame)
            btn.MouseButton1Click:Connect(function()
                tween(frame, TweenInfo.new(0.08), {BackgroundColor3 = Colors.Accent})
                task.wait(0.08)
                tween(frame, fastTI, {BackgroundColor3 = Colors.Element})
                if bConfig.Callback then bConfig.Callback() end
            end)

            local obj = {}
            obj.SetTitle = function(_, t) bTitle.Text = t end
            obj.Destroy = function(_) frame:Destroy() end
            return obj
        end

        tab.Toggle = function(tConfig)
            tConfig = tConfig or {}
            local state = tConfig.Value or false
            local frame = elementFrame(page, tConfig.Desc and 48 or 36)

            local btn = Instance.new("TextButton", frame)
            btn.BackgroundTransparency = 1
            btn.BorderSizePixel = 0
            btn.Size = UDim2.new(1, 0, 1, 0)
            btn.Text = ""

            local tTitle = makeText(btn, tConfig.Title or "Toggle", 12, Colors.Text, Fonts.Medium)

            if tConfig.Desc then
                tTitle.Size = UDim2.new(0.65, 0, 0, 20)
                tTitle.Position = UDim2.new(0, 10, 0, 5)
                local tDesc = makeText(btn, tConfig.Desc, 10, Colors.SubText, Fonts.Regular)
                tDesc.Size = UDim2.new(0.65, 0, 0, 16)
                tDesc.Position = UDim2.new(0, 10, 0, 24)
            else
                tTitle.Size = UDim2.new(0.7, 0, 1, 0)
                tTitle.Position = UDim2.new(0, 10, 0, 0)
            end

            local toggleBg = Instance.new("Frame", btn)
            toggleBg.BackgroundColor3 = state and Colors.ToggleOn or Colors.Toggle
            toggleBg.BorderSizePixel = 0
            toggleBg.Size = UDim2.new(0, 36, 0, 18)
            toggleBg.Position = UDim2.new(1, -48, 0.5, -9)
            makeCorner(toggleBg, 9)

            local toggleCircle = Instance.new("Frame", toggleBg)
            toggleCircle.BackgroundColor3 = Colors.Text
            toggleCircle.BorderSizePixel = 0
            toggleCircle.Size = UDim2.new(0, 14, 0, 14)
            toggleCircle.Position = state and UDim2.new(1, -16, 0, 2) or UDim2.new(0, 2, 0, 2)
            makeCorner(toggleCircle, 7)

            local function updateToggle()
                tween(toggleBg, smoothTI, {BackgroundColor3 = state and Colors.ToggleOn or Colors.Toggle})
                tween(toggleCircle, smoothTI, {Position = state and UDim2.new(1, -16, 0, 2) or UDim2.new(0, 2, 0, 2)})
            end

            hoverEffect(btn, frame)
            btn.MouseButton1Click:Connect(function()
                state = not state
                updateToggle()
                if tConfig.Callback then tConfig.Callback(state) end
            end)

            local obj = {}
            obj.Set = function(_, val) state = val updateToggle() end
            obj.SetTitle = function(_, t) tTitle.Text = t end
            obj.Destroy = function(_) frame:Destroy() end
            return obj
        end

        tab.Slider = function(sConfig)
            sConfig = sConfig or {}
            local min = sConfig.Min or (sConfig.Value and sConfig.Value.Min) or 0
            local max = sConfig.Max or (sConfig.Value and sConfig.Value.Max) or 100
            local default = sConfig.Default or (sConfig.Value and sConfig.Value.Default) or min
            local step = sConfig.Step or 1
            local current = default

            local frame = elementFrame(page, 48)

            local sTitle = makeText(frame, sConfig.Title or "Slider", 12, Colors.Text, Fonts.Medium)
            sTitle.Size = UDim2.new(0.6, 0, 0, 18)
            sTitle.Position = UDim2.new(0, 10, 0, 4)

            local valueLabel = makeText(frame, tostring(current), 11, Colors.SubText, Fonts.Medium, Enum.TextXAlignment.Right)
            valueLabel.Size = UDim2.new(0.3, 0, 0, 18)
            valueLabel.Position = UDim2.new(0.65, 0, 0, 4)

            local sliderBg = Instance.new("Frame", frame)
            sliderBg.BackgroundColor3 = Colors.SliderBg
            sliderBg.BorderSizePixel = 0
            sliderBg.Size = UDim2.new(1, -20, 0, 6)
            sliderBg.Position = UDim2.new(0, 10, 0, 30)
            makeCorner(sliderBg, 3)

            local sliderFill = Instance.new("Frame", sliderBg)
            sliderFill.BackgroundColor3 = Colors.Accent
            sliderFill.BorderSizePixel = 0
            local pct = math.clamp((current - min) / (max - min), 0, 1)
            sliderFill.Size = UDim2.new(pct, 0, 1, 0)
            makeCorner(sliderFill, 3)

            local sliderKnob = Instance.new("Frame", sliderFill)
            sliderKnob.BackgroundColor3 = Colors.Text
            sliderKnob.BorderSizePixel = 0
            sliderKnob.Size = UDim2.new(0, 12, 0, 12)
            sliderKnob.Position = UDim2.new(1, -6, 0.5, -6)
            sliderKnob.ZIndex = 5
            makeCorner(sliderKnob, 6)

            local sliderBtn = Instance.new("TextButton", sliderBg)
            sliderBtn.BackgroundTransparency = 1
            sliderBtn.Size = UDim2.new(1, 0, 1, 12)
            sliderBtn.Position = UDim2.new(0, 0, 0, -6)
            sliderBtn.Text = ""
            sliderBtn.ZIndex = 6

            local sliding = false

            local function updateSlider(inputX)
                local rel = math.clamp((inputX - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
                local raw = min + (max - min) * rel
                current = math.clamp(math.floor(raw / step + 0.5) * step, min, max)
                sliderFill.Size = UDim2.new((current - min) / (max - min), 0, 1, 0)
                valueLabel.Text = tostring(current)
            end

            sliderBtn.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    sliding = true
                    updateSlider(input.Position.X)
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    updateSlider(input.Position.X)
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and sliding then
                    sliding = false
                    if sConfig.Callback then sConfig.Callback(current) end
                end
            end)

            local obj = {}
            obj.Set = function(_, val)
                current = math.clamp(val, min, max)
                sliderFill.Size = UDim2.new((current - min) / (max - min), 0, 1, 0)
                valueLabel.Text = tostring(current)
            end
            obj.SetTitle = function(_, t) sTitle.Text = t end
            obj.Destroy = function(_) frame:Destroy() end
            return obj
        end

        tab.Input = function(iConfig)
            iConfig = iConfig or {}
            local frame = elementFrame(page, 36)

            local iTitle = makeText(frame, iConfig.Title or "Input", 12, Colors.Text, Fonts.Medium)
            iTitle.Size = UDim2.new(0.5, 0, 1, 0)
            iTitle.Position = UDim2.new(0, 10, 0, 0)

            local boxFrame = Instance.new("Frame", frame)
            boxFrame.BackgroundColor3 = Colors.SliderBg
            boxFrame.BorderSizePixel = 0
            boxFrame.Size = UDim2.new(0.4, -10, 0, 24)
            boxFrame.Position = UDim2.new(0.58, 0, 0.5, -12)
            makeCorner(boxFrame, 5)
            makeStroke(boxFrame, Colors.Border, 1)

            local textBox = Instance.new("TextBox", boxFrame)
            textBox.BackgroundTransparency = 1
            textBox.BorderSizePixel = 0
            textBox.Size = UDim2.new(1, -8, 1, 0)
            textBox.Position = UDim2.new(0, 4, 0, 0)
            textBox.Text = iConfig.Default or ""
            textBox.PlaceholderText = iConfig.Placeholder or "..."
            textBox.PlaceholderColor3 = Color3.fromRGB(80, 80, 80)
            textBox.TextColor3 = Colors.Text
            textBox.TextSize = 12
            textBox.FontFace = Fonts.Regular
            textBox.ClearTextOnFocus = false
            textBox.ClipsDescendants = true

            textBox.FocusLost:Connect(function(enter)
                if enter and iConfig.Callback then iConfig.Callback(textBox.Text) end
            end)

            local obj = {}
            obj.SetTitle = function(_, t) iTitle.Text = t end
            obj.SetValue = function(_, v) textBox.Text = v end
            obj.Destroy = function(_) frame:Destroy() end
            return obj
        end

        tab.Dropdown = function(dConfig)
            dConfig = dConfig or {}
            local options = dConfig.Options or {}
            local selected = dConfig.Default or (options[1] or "")
            local opened = false

            local frame = elementFrame(page, 36)

            local dTitle = makeText(frame, dConfig.Title or "Dropdown", 12, Colors.Text, Fonts.Medium)
            dTitle.Size = UDim2.new(0.5, 0, 0, 36)
            dTitle.Position = UDim2.new(0, 10, 0, 0)

            local dropBtn = Instance.new("TextButton", frame)
            dropBtn.BackgroundColor3 = Colors.SliderBg
            dropBtn.BorderSizePixel = 0
            dropBtn.Size = UDim2.new(0.4, -10, 0, 24)
            dropBtn.Position = UDim2.new(0.58, 0, 0, 6)
            dropBtn.Text = ""
            dropBtn.AutoButtonColor = false
            makeCorner(dropBtn, 5)
            makeStroke(dropBtn, Colors.Border, 1)

            local selectedLabel = makeText(dropBtn, selected, 11, Colors.Text, Fonts.Regular)
            selectedLabel.Size = UDim2.new(1, -20, 1, 0)
            selectedLabel.Position = UDim2.new(0, 6, 0, 0)

            local dropArrow = makeText(dropBtn, "v", 10, Colors.SubText, Fonts.Bold, Enum.TextXAlignment.Center)
            dropArrow.Size = UDim2.new(0, 16, 1, 0)
            dropArrow.Position = UDim2.new(1, -18, 0, 0)

            local dropList = Instance.new("Frame", frame)
            dropList.BackgroundColor3 = Colors.Surface
            dropList.BorderSizePixel = 0
            dropList.Size = UDim2.new(0.4, -10, 0, 0)
            dropList.Position = UDim2.new(0.58, 0, 1, 2)
            dropList.ClipsDescendants = true
            dropList.ZIndex = 50
            dropList.Visible = false
            makeCorner(dropList, 5)
            makeStroke(dropList, Colors.Border, 1)
            makePadding(dropList, 2, 2, 2, 2)
            makeList(dropList, 1)

            local function buildOptions()
                for _, child in ipairs(dropList:GetChildren()) do
                    if child:IsA("TextButton") then child:Destroy() end
                end
                for _, option in ipairs(options) do
                    local optBtn = Instance.new("TextButton", dropList)
                    optBtn.BackgroundColor3 = Colors.Element
                    optBtn.BackgroundTransparency = 1
                    optBtn.BorderSizePixel = 0
                    optBtn.Size = UDim2.new(1, 0, 0, 24)
                    optBtn.Text = ""
                    optBtn.AutoButtonColor = false
                    optBtn.ZIndex = 51
                    makeCorner(optBtn, 4)
                    local optLabel = makeText(optBtn, option, 11, Colors.Text, Fonts.Regular)
                    optLabel.Size = UDim2.new(1, -8, 1, 0)
                    optLabel.Position = UDim2.new(0, 4, 0, 0)
                    optLabel.ZIndex = 52
                    optBtn.MouseEnter:Connect(function() tween(optBtn, fastTI, {BackgroundTransparency = 0, BackgroundColor3 = Colors.ElementHover}) end)
                    optBtn.MouseLeave:Connect(function() tween(optBtn, fastTI, {BackgroundTransparency = 1}) end)
                    optBtn.MouseButton1Click:Connect(function()
                        selected = option
                        selectedLabel.Text = option
                        opened = false
                        dropList.Visible = false
                        frame.Size = UDim2.new(1, -8, 0, 36)
                        frame.ZIndex = 1
                        if dConfig.Callback then dConfig.Callback(option) end
                    end)
                end
            end

            buildOptions()

            dropBtn.MouseButton1Click:Connect(function()
                opened = not opened
                if opened then
                    local totalH = #options * 25 + 4
                    dropList.Visible = true
                    dropList.Size = UDim2.new(0.4, -10, 0, totalH)
                    frame.Size = UDim2.new(1, -8, 0, 36 + totalH + 4)
                    frame.ZIndex = 50
                else
                    dropList.Visible = false
                    frame.Size = UDim2.new(1, -8, 0, 36)
                    frame.ZIndex = 1
                end
            end)

            local obj = {}
            obj.Set = function(_, val) selected = val selectedLabel.Text = val end
            obj.SetOptions = function(_, newOpts) options = newOpts buildOptions() end
            obj.SetTitle = function(_, t) dTitle.Text = t end
            obj.Destroy = function(_) frame:Destroy() end
            return obj
        end

        tab.Keybind = function(kConfig)
            kConfig = kConfig or {}
            local currentKey = kConfig.Default or Enum.KeyCode.E
            local listening = false

            local frame = elementFrame(page, 36)

            local kTitle = makeText(frame, kConfig.Title or "Keybind", 12, Colors.Text, Fonts.Medium)
            kTitle.Size = UDim2.new(0.6, 0, 1, 0)
            kTitle.Position = UDim2.new(0, 10, 0, 0)

            local keyBtn = Instance.new("TextButton", frame)
            keyBtn.BackgroundColor3 = Colors.SliderBg
            keyBtn.BorderSizePixel = 0
            keyBtn.Size = UDim2.new(0, 70, 0, 24)
            keyBtn.Position = UDim2.new(1, -82, 0.5, -12)
            keyBtn.Text = currentKey.Name
            keyBtn.TextColor3 = Colors.Text
            keyBtn.TextSize = 11
            keyBtn.FontFace = Fonts.Medium
            keyBtn.AutoButtonColor = false
            makeCorner(keyBtn, 5)
            makeStroke(keyBtn, Colors.Border, 1)

            keyBtn.MouseButton1Click:Connect(function()
                listening = true
                keyBtn.Text = "..."
                tween(keyBtn, fastTI, {BackgroundColor3 = Colors.Accent})
            end)

            UserInputService.InputBegan:Connect(function(input, processed)
                if not listening then return end
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    if input.KeyCode == Enum.KeyCode.Escape then
                        listening = false
                        keyBtn.Text = currentKey.Name
                        tween(keyBtn, fastTI, {BackgroundColor3 = Colors.SliderBg})
                        return
                    end
                    currentKey = input.KeyCode
                    keyBtn.Text = currentKey.Name
                    listening = false
                    tween(keyBtn, fastTI, {BackgroundColor3 = Colors.SliderBg})
                    if kConfig.Callback then kConfig.Callback(currentKey) end
                end
            end)

            if kConfig.OnPress then
                UserInputService.InputBegan:Connect(function(input, processed)
                    if processed then return end
                    if input.KeyCode == currentKey then kConfig.OnPress() end
                end)
            end

            local obj = {}
            obj.Set = function(_, key) currentKey = key keyBtn.Text = key.Name end
            obj.SetTitle = function(_, t) kTitle.Text = t end
            obj.Destroy = function(_) frame:Destroy() end
            return obj
        end

        return tab
    end

    win.SetTitle = function(_, t) titleLabel.Text = t end
    win.Toggle = function(_) screenGui.Enabled = not screenGui.Enabled end
    win.Destroy = function(_) screenGui:Destroy() end

    mainFrame.Size = UDim2.new(0, 0, 0, 0)
    shadow.Size = UDim2.new(0, 40, 0, 40)
    tween(mainFrame, slideTI, {Size = UDim2.new(0, 520, 0, 320)})
    tween(shadow, slideTI, {Size = UDim2.new(0, 560, 0, 360)})

    return win
end

return AvUI
