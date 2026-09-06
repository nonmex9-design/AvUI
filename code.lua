local AvUI = {}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

local Theme = {
    Background = Color3.fromRGB(14, 14, 14),
    Surface = Color3.fromRGB(20, 20, 20),
    Element = Color3.fromRGB(26, 26, 26),
    ElementHover = Color3.fromRGB(34, 34, 34),
    Border = Color3.fromRGB(40, 40, 40),
    Text = Color3.fromRGB(240, 240, 240),
    SubText = Color3.fromRGB(150, 150, 150),
    Accent = Color3.fromRGB(120, 100, 255),
    AccentHover = Color3.fromRGB(140, 120, 255),
    ToggleOff = Color3.fromRGB(45, 45, 45),
    ToggleOn = Color3.fromRGB(120, 100, 255),
    SliderBg = Color3.fromRGB(35, 35, 35),
    Success = Color3.fromRGB(85, 220, 120),
    Error = Color3.fromRGB(255, 90, 90),
    Warning = Color3.fromRGB(255, 200, 80),
}

local FontRegular = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
local FontMedium = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
local FontSemiBold = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
local FontBold = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

local FastTween = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local SmoothTween = TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local SlideTween = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function Tween(obj, info, props)
    TweenService:Create(obj, info, props):Play()
end

local function Corner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 6)
    c.Parent = parent
    return c
end

local function Stroke(parent, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color or Theme.Border
    s.Thickness = thickness or 1
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = parent
    return s
end

local function Padding(parent, top, bottom, left, right)
    local p = Instance.new("UIPadding")
    p.PaddingTop = UDim.new(0, top or 0)
    p.PaddingBottom = UDim.new(0, bottom or 0)
    p.PaddingLeft = UDim.new(0, left or 0)
    p.PaddingRight = UDim.new(0, right or 0)
    p.Parent = parent
    return p
end

local function ListLayout(parent, padding)
    local l = Instance.new("UIListLayout")
    l.Padding = UDim.new(0, padding or 4)
    l.SortOrder = Enum.SortOrder.LayoutOrder
    l.HorizontalAlignment = Enum.HorizontalAlignment.Center
    l.Parent = parent
    return l
end

local function TextLabel(parent, text, size, color, font, align)
    local t = Instance.new("TextLabel")
    t.BackgroundTransparency = 1
    t.Text = text or ""
    t.TextSize = size or 13
    t.TextColor3 = color or Theme.Text
    t.FontFace = font or FontRegular
    t.TextXAlignment = align or Enum.TextXAlignment.Left
    t.TextWrapped = true
    t.BorderSizePixel = 0
    t.Parent = parent
    return t
end

local function ConnectCanvas(scroll)
    local layout = scroll:FindFirstChildOfClass("UIListLayout")
    if layout then
        layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
        end)
    end
end

local function ElementFrame(parent, height)
    local f = Instance.new("Frame")
    f.BackgroundColor3 = Theme.Element
    f.BorderSizePixel = 0
    f.Size = UDim2.new(1, -10, 0, height or 36)
    f.Parent = parent
    Corner(f, 6)
    Stroke(f, Theme.Border, 1)
    return f
end

local function HoverEffect(btn, frame, hoverColor)
    btn.MouseEnter:Connect(function()
        Tween(frame, FastTween, {BackgroundColor3 = hoverColor or Theme.ElementHover})
    end)
    btn.MouseLeave:Connect(function()
        Tween(frame, FastTween, {BackgroundColor3 = Theme.Element})
    end)
end

function AvUI.CreateWindow(config)
    config = config or {}
    local Window = {}

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = config.Title or "AvUI"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = Player:WaitForChild("PlayerGui")

    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.BackgroundTransparency = 1
    Shadow.Image = "rbxassetid://6014261993"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.55
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    Shadow.Size = UDim2.new(0, 560, 0, 360)
    Shadow.Position = UDim2.new(0.5, -280, 0.5, -180)
    Shadow.ZIndex = 0
    Shadow.Parent = ScreenGui

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.BackgroundColor3 = Theme.Background
    Main.BorderSizePixel = 0
    Main.Size = UDim2.new(0, 520, 0, 320)
    Main.Position = UDim2.new(0.5, -260, 0.5, -160)
    Main.ClipsDescendants = true
    Main.ZIndex = 1
    Main.Parent = ScreenGui
    Corner(Main, 8)
    Stroke(Main, Theme.Border, 1.5)

    local Topbar = Instance.new("Frame")
    Topbar.Name = "Topbar"
    Topbar.BackgroundColor3 = Theme.Background
    Topbar.BorderSizePixel = 0
    Topbar.Size = UDim2.new(1, 0, 0, 40)
    Topbar.ZIndex = 10
    Topbar.Parent = Main

    local TopLine = Instance.new("Frame")
    TopLine.Name = "TopLine"
    TopLine.BackgroundColor3 = Theme.Border
    TopLine.BorderSizePixel = 0
    TopLine.Size = UDim2.new(1, 0, 0, 1)
    TopLine.Position = UDim2.new(0, 0, 1, -1)
    TopLine.Parent = Topbar

    local TitleText = TextLabel(Topbar, config.Title or "AvUI", 14, Theme.Text, FontSemiBold)
    TitleText.Name = "Title"

    if config.Author then
        TitleText.Size = UDim2.new(0.6, 0, 0, 20)
        TitleText.Position = UDim2.new(0, 14, 0, 3)
        local AuthorText = TextLabel(Topbar, config.Author, 10, Theme.SubText, FontRegular)
        AuthorText.Name = "Author"
        AuthorText.Size = UDim2.new(0.6, 0, 0, 14)
        AuthorText.Position = UDim2.new(0, 14, 0, 22)
    else
        TitleText.Size = UDim2.new(0.6, 0, 1, 0)
        TitleText.Position = UDim2.new(0, 14, 0, 0)
    end

    local function TopButton(offset, label, callback)
        local btn = Instance.new("TextButton")
        btn.Name = label .. "Btn"
        btn.BackgroundTransparency = 1
        btn.BorderSizePixel = 0
        btn.Size = UDim2.new(0, 30, 0, 30)
        btn.Position = UDim2.new(1, offset, 0, 5)
        btn.Text = label
        btn.TextSize = 16
        btn.TextColor3 = Theme.SubText
        btn.FontFace = FontBold
        btn.ZIndex = 11
        btn.Parent = Topbar
        btn.MouseEnter:Connect(function()
            Tween(btn, FastTween, {TextColor3 = Theme.Text})
        end)
        btn.MouseLeave:Connect(function()
            Tween(btn, FastTween, {TextColor3 = Theme.SubText})
        end)
        btn.MouseButton1Click:Connect(callback)
        return btn
    end

    TopButton(-40, "X", function()
        Tween(Main, SlideTween, {Size = UDim2.new(0, 520, 0, 0)})
        Tween(Shadow, SlideTween, {Size = UDim2.new(0, 560, 0, 0)})
        task.wait(0.4)
        ScreenGui:Destroy()
    end)

    local Minimized = false
    TopButton(-72, "-", function()
        Minimized = not Minimized
        if Minimized then
            Tween(Main, SlideTween, {Size = UDim2.new(0, 520, 0, 40)})
            Tween(Shadow, SlideTween, {Size = UDim2.new(0, 560, 0, 80)})
        else
            Tween(Main, SlideTween, {Size = UDim2.new(0, 520, 0, 320)})
            Tween(Shadow, SlideTween, {Size = UDim2.new(0, 560, 0, 360)})
        end
    end)

    local Dragging, DragInput, DragStart, StartPos

    Topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPos = Main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)

    Topbar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            DragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == DragInput and Dragging then
            local delta = input.Position - DragStart
            local newPos = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + delta.X, StartPos.Y.Scale, StartPos.Y.Offset + delta.Y)
            Main.Position = newPos
            Shadow.Position = UDim2.new(0, newPos.X.Offset + (newPos.X.Scale * ScreenGui.AbsoluteSize.X) - 20, 0, newPos.Y.Offset + (newPos.Y.Scale * ScreenGui.AbsoluteSize.Y) - 20)
        end
    end)

    local ToggleKey = config.ToggleKey or Enum.KeyCode.RightShift
    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == ToggleKey then
            ScreenGui.Enabled = not ScreenGui.Enabled
        end
    end)

    local Sidebar = Instance.new("Frame")
    Sidebar.Name = "Sidebar"
    Sidebar.BackgroundColor3 = Theme.Surface
    Sidebar.BorderSizePixel = 0
    Sidebar.Size = UDim2.new(0, 145, 1, -40)
    Sidebar.Position = UDim2.new(0, 0, 0, 40)
    Sidebar.Parent = Main

    local SidebarLine = Instance.new("Frame")
    SidebarLine.Name = "SidebarLine"
    SidebarLine.BackgroundColor3 = Theme.Border
    SidebarLine.BorderSizePixel = 0
    SidebarLine.Size = UDim2.new(0, 1, 1, 0)
    SidebarLine.Position = UDim2.new(1, -1, 0, 0)
    SidebarLine.Parent = Sidebar

    local TabScroll = Instance.new("ScrollingFrame")
    TabScroll.Name = "TabScroll"
    TabScroll.BackgroundTransparency = 1
    TabScroll.BorderSizePixel = 0
    TabScroll.Size = UDim2.new(1, -2, 1, -10)
    TabScroll.Position = UDim2.new(0, 0, 0, 5)
    TabScroll.ScrollBarThickness = 2
    TabScroll.ScrollBarImageColor3 = Theme.Border
    TabScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabScroll.Parent = Sidebar
    Padding(TabScroll, 4, 4, 8, 8)
    ListLayout(TabScroll, 3)
    ConnectCanvas(TabScroll)

    local ContentArea = Instance.new("Frame")
    ContentArea.Name = "ContentArea"
    ContentArea.BackgroundTransparency = 1
    ContentArea.BorderSizePixel = 0
    ContentArea.Size = UDim2.new(1, -145, 1, -40)
    ContentArea.Position = UDim2.new(0, 145, 0, 40)
    ContentArea.Parent = Main

    local ActiveTab = nil
    local TabPages = {}

    local NotifHolder = Instance.new("Frame")
    NotifHolder.Name = "NotifHolder"
    NotifHolder.BackgroundTransparency = 1
    NotifHolder.Size = UDim2.new(0, 270, 1, 0)
    NotifHolder.Position = UDim2.new(1, -280, 0, 0)
    NotifHolder.ZIndex = 100
    NotifHolder.Parent = ScreenGui
    local NList = Instance.new("UIListLayout")
    NList.Padding = UDim.new(0, 6)
    NList.VerticalAlignment = Enum.VerticalAlignment.Bottom
    NList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    NList.SortOrder = Enum.SortOrder.LayoutOrder
    NList.Parent = NotifHolder
    Padding(NotifHolder, 0, 10, 0, 0)

    function Window.Notify(nConfig)
        nConfig = nConfig or {}
        local notif = Instance.new("Frame")
        notif.Name = "Notification"
        notif.BackgroundColor3 = Theme.Surface
        notif.BorderSizePixel = 0
        notif.Size = UDim2.new(1, 0, 0, 64)
        notif.ZIndex = 100
        notif.Parent = NotifHolder
        Corner(notif, 8)
        Stroke(notif, Theme.Border, 1)

        local nTitle = TextLabel(notif, nConfig.Title or "Notification", 12, Theme.Text, FontSemiBold)
        nTitle.Name = "NTitle"
        nTitle.Size = UDim2.new(1, -16, 0, 18)
        nTitle.Position = UDim2.new(0, 10, 0, 8)
        nTitle.ZIndex = 101

        local nDesc = TextLabel(notif, nConfig.Description or "", 11, Theme.SubText, FontRegular)
        nDesc.Name = "NDesc"
        nDesc.Size = UDim2.new(1, -16, 0, 32)
        nDesc.Position = UDim2.new(0, 10, 0, 26)
        nDesc.ZIndex = 101

        local nBar = Instance.new("Frame")
        nBar.Name = "Bar"
        nBar.BackgroundColor3 = Theme.Accent
        nBar.BorderSizePixel = 0
        nBar.Size = UDim2.new(1, 0, 0, 2)
        nBar.Position = UDim2.new(0, 0, 1, -2)
        nBar.ZIndex = 102
        nBar.Parent = notif

        notif.Position = UDim2.new(1, 20, 0, 0)
        Tween(notif, SlideTween, {Position = UDim2.new(0, 0, 0, 0)})

        local duration = nConfig.Duration or 3
        Tween(nBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 0, 2)})

        task.delay(duration, function()
            Tween(notif, SmoothTween, {Position = UDim2.new(1, 20, 0, 0)})
            task.wait(0.3)
            notif:Destroy()
        end)
    end

    local function SelectTab(tabBtn)
        if ActiveTab == tabBtn then return end
        for t, page in pairs(TabPages) do
            page.Visible = false
            Tween(t, FastTween, {BackgroundTransparency = 1})
            local nm = t:FindFirstChild("TabName")
            if nm then Tween(nm, FastTween, {TextColor3 = Theme.SubText}) end
            local ic = t:FindFirstChild("TabIcon")
            if ic then Tween(ic, FastTween, {ImageColor3 = Theme.SubText}) end
        end
        ActiveTab = tabBtn
        TabPages[tabBtn].Visible = true
        Tween(tabBtn, FastTween, {BackgroundTransparency = 0.9, BackgroundColor3 = Theme.Accent})
        local nm = tabBtn:FindFirstChild("TabName")
        if nm then Tween(nm, FastTween, {TextColor3 = Theme.Text}) end
        local ic = tabBtn:FindFirstChild("TabIcon")
        if ic then Tween(ic, FastTween, {ImageColor3 = Theme.Accent}) end
    end

    function Window.Tab(tabConfig)
        tabConfig = tabConfig or {}
        local Tab = {}

        local tabBtn = Instance.new("TextButton")
        tabBtn.Name = tabConfig.Title or "Tab"
        tabBtn.BackgroundColor3 = Theme.Accent
        tabBtn.BackgroundTransparency = 1
        tabBtn.BorderSizePixel = 0
        tabBtn.Size = UDim2.new(1, 0, 0, 32)
        tabBtn.Text = ""
        tabBtn.AutoButtonColor = false
        tabBtn.Parent = TabScroll
        Corner(tabBtn, 5)

        local tabIcon = Instance.new("ImageLabel")
        tabIcon.Name = "TabIcon"
        tabIcon.BackgroundTransparency = 1
        tabIcon.BorderSizePixel = 0
        tabIcon.Size = UDim2.new(0, 16, 0, 16)
        tabIcon.Position = UDim2.new(0, 10, 0.5, -8)
        tabIcon.ImageColor3 = Theme.SubText
        tabIcon.Image = tabConfig.Icon or ""
        tabIcon.Parent = tabBtn

        local tabName = TextLabel(tabBtn, tabConfig.Title or "Tab", 12, Theme.SubText, FontMedium)
        tabName.Name = "TabName"
        tabName.Size = UDim2.new(1, -36, 1, 0)
        tabName.Position = UDim2.new(0, 32, 0, 0)

        tabBtn.MouseEnter:Connect(function()
            if ActiveTab ~= tabBtn then
                Tween(tabBtn, FastTween, {BackgroundTransparency = 0.92, BackgroundColor3 = Theme.ElementHover})
            end
        end)
        tabBtn.MouseLeave:Connect(function()
            if ActiveTab ~= tabBtn then
                Tween(tabBtn, FastTween, {BackgroundTransparency = 1})
            end
        end)

        local page = Instance.new("ScrollingFrame")
        page.Name = tabConfig.Title or "Page"
        page.BackgroundTransparency = 1
        page.BorderSizePixel = 0
        page.Size = UDim2.new(1, 0, 1, 0)
        page.ScrollBarThickness = 3
        page.ScrollBarImageColor3 = Theme.Border
        page.Visible = false
        page.CanvasSize = UDim2.new(0, 0, 0, 0)
        page.Parent = ContentArea
        Padding(page, 8, 8, 10, 10)
        ListLayout(page, 5)
        ConnectCanvas(page)

        TabPages[tabBtn] = page
        tabBtn.MouseButton1Click:Connect(function() SelectTab(tabBtn) end)
        if not ActiveTab then SelectTab(tabBtn) end

        function Tab.Section(sConfig)
            sConfig = sConfig or {}
            local section = Instance.new("Frame")
            section.Name = "Section"
            section.BackgroundTransparency = 1
            section.BorderSizePixel = 0
            section.Size = UDim2.new(1, 0, 0, 24)
            section.Parent = page
            local sLabel = TextLabel(section, sConfig.Title or "Section", 11, Theme.SubText, FontSemiBold)
            sLabel.Size = UDim2.new(1, -4, 0, 16)
            sLabel.Position = UDim2.new(0, 4, 0, 6)
            sLabel.TextTransparency = 0.15
        end

        function Tab.Divider()
            local div = Instance.new("Frame")
            div.Name = "Divider"
            div.BackgroundColor3 = Theme.Border
            div.BorderSizePixel = 0
            div.Size = UDim2.new(1, -16, 0, 1)
            div.Parent = page
        end

        function Tab.Paragraph(pConfig)
            pConfig = pConfig or {}
            local frame = ElementFrame(page, pConfig.Content and 56 or 36)
            local pTitle = TextLabel(frame, pConfig.Title or "", 12, Theme.Text, FontSemiBold)
            pTitle.Size = UDim2.new(1, -16, 0, 16)
            pTitle.Position = UDim2.new(0, 10, 0, 7)
            if pConfig.Content or pConfig.Desc then
                local pDesc = TextLabel(frame, pConfig.Content or pConfig.Desc or "", 11, Theme.SubText, FontRegular)
                pDesc.Size = UDim2.new(1, -16, 0, 26)
                pDesc.Position = UDim2.new(0, 10, 0, 24)
            end
            local obj = {}
            obj.SetTitle = function(_, t) pTitle.Text = t end
            obj.SetContent = function(_, c)
                local d = frame:FindFirstChild("TextLabel")
                if d then d.Text = c end
            end
            obj.Destroy = function(_) frame:Destroy() end
            return obj
        end

        function Tab.Label(lConfig)
            lConfig = lConfig or {}
            local lbl = TextLabel(page, lConfig.Text or "Label", 12, lConfig.Color or Theme.Text, lConfig.Bold and FontSemiBold or FontRegular)
            lbl.Size = UDim2.new(1, -10, 0, 22)
            local obj = {}
            obj.Set = function(_, t) lbl.Text = t end
            obj.Destroy = function(_) lbl:Destroy() end
            return obj
        end

        function Tab.Button(bConfig)
            bConfig = bConfig or {}
            local frame = ElementFrame(page, bConfig.Desc and 50 or 36)
            local btn = Instance.new("TextButton")
            btn.Name = "Button"
            btn.BackgroundTransparency = 1
            btn.BorderSizePixel = 0
            btn.Size = UDim2.new(1, 0, 1, 0)
            btn.Text = ""
            btn.Parent = frame

            local bTitle = TextLabel(btn, bConfig.Title or "Button", 12, Theme.Text, FontMedium)
            if bConfig.Desc then
                bTitle.Size = UDim2.new(0.7, 0, 0, 18)
                bTitle.Position = UDim2.new(0, 10, 0, 5)
                local bDesc = TextLabel(btn, bConfig.Desc, 10, Theme.SubText, FontRegular)
                bDesc.Size = UDim2.new(0.7, 0, 0, 16)
                bDesc.Position = UDim2.new(0, 10, 0, 23)
            else
                bTitle.Size = UDim2.new(0.7, 0, 1, 0)
                bTitle.Position = UDim2.new(0, 10, 0, 0)
            end

            local arrow = TextLabel(btn, ">", 14, Theme.SubText, FontBold, Enum.TextXAlignment.Center)
            arrow.Size = UDim2.new(0, 20, 1, 0)
            arrow.Position = UDim2.new(1, -28, 0, 0)

            HoverEffect(btn, frame)
            btn.MouseButton1Click:Connect(function()
                Tween(frame, TweenInfo.new(0.08), {BackgroundColor3 = Theme.Accent})
                task.wait(0.08)
                Tween(frame, FastTween, {BackgroundColor3 = Theme.Element})
                if bConfig.Callback then bConfig.Callback() end
            end)

            local obj = {}
            obj.SetTitle = function(_, t) bTitle.Text = t end
            obj.Destroy = function(_) frame:Destroy() end
            return obj
        end

        function Tab.Toggle(tConfig)
            tConfig = tConfig or {}
            local state = tConfig.Value or false
            local frame = ElementFrame(page, tConfig.Desc and 50 or 36)
            local btn = Instance.new("TextButton")
            btn.Name = "Toggle"
            btn.BackgroundTransparency = 1
            btn.BorderSizePixel = 0
            btn.Size = UDim2.new(1, 0, 1, 0)
            btn.Text = ""
            btn.Parent = frame

            local tTitle = TextLabel(btn, tConfig.Title or "Toggle", 12, Theme.Text, FontMedium)
            if tConfig.Desc then
                tTitle.Size = UDim2.new(0.65, 0, 0, 18)
                tTitle.Position = UDim2.new(0, 10, 0, 5)
                local tDesc = TextLabel(btn, tConfig.Desc, 10, Theme.SubText, FontRegular)
                tDesc.Size = UDim2.new(0.65, 0, 0, 16)
                tDesc.Position = UDim2.new(0, 10, 0, 23)
            else
                tTitle.Size = UDim2.new(0.7, 0, 1, 0)
                tTitle.Position = UDim2.new(0, 10, 0, 0)
            end

            local toggleBg = Instance.new("Frame")
            toggleBg.Name = "ToggleBg"
            toggleBg.BackgroundColor3 = state and Theme.ToggleOn or Theme.ToggleOff
            toggleBg.BorderSizePixel = 0
            toggleBg.Size = UDim2.new(0, 38, 0, 20)
            toggleBg.Position = UDim2.new(1, -50, 0.5, -10)
            toggleBg.Parent = btn
            Corner(toggleBg, 10)

            local toggleCircle = Instance.new("Frame")
            toggleCircle.Name = "Circle"
            toggleCircle.BackgroundColor3 = Theme.Text
            toggleCircle.BorderSizePixel = 0
            toggleCircle.Size = UDim2.new(0, 14, 0, 14)
            toggleCircle.Position = state and UDim2.new(1, -17, 0, 3) or UDim2.new(0, 3, 0, 3)
            toggleCircle.Parent = toggleBg
            Corner(toggleCircle, 7)

            local function UpdateToggle()
                Tween(toggleBg, SmoothTween, {BackgroundColor3 = state and Theme.ToggleOn or Theme.ToggleOff})
                Tween(toggleCircle, SmoothTween, {Position = state and UDim2.new(1, -17, 0, 3) or UDim2.new(0, 3, 0, 3)})
            end

            HoverEffect(btn, frame)
            btn.MouseButton1Click:Connect(function()
                state = not state
                UpdateToggle()
                if tConfig.Callback then tConfig.Callback(state) end
            end)

            local obj = {}
            obj.Set = function(_, val) state = val UpdateToggle() end
            obj.Get = function(_) return state end
            obj.SetTitle = function(_, t) tTitle.Text = t end
            obj.Destroy = function(_) frame:Destroy() end
            return obj
        end

        function Tab.Slider(sConfig)
            sConfig = sConfig or {}
            local min = sConfig.Min or (sConfig.Value and sConfig.Value.Min) or 0
            local max = sConfig.Max or (sConfig.Value and sConfig.Value.Max) or 100
            local default = sConfig.Default or (sConfig.Value and sConfig.Value.Default) or min
            local step = sConfig.Step or 1
            local current = default

            local frame = ElementFrame(page, 50)
            local sTitle = TextLabel(frame, sConfig.Title or "Slider", 12, Theme.Text, FontMedium)
            sTitle.Size = UDim2.new(0.55, 0, 0, 18)
            sTitle.Position = UDim2.new(0, 10, 0, 4)

            local valueLabel = TextLabel(frame, tostring(current), 11, Theme.SubText, FontMedium, Enum.TextXAlignment.Right)
            valueLabel.Size = UDim2.new(0.35, 0, 0, 18)
            valueLabel.Position = UDim2.new(0.58, 0, 0, 4)

            local sliderBg = Instance.new("Frame")
            sliderBg.Name = "SliderBg"
            sliderBg.BackgroundColor3 = Theme.SliderBg
            sliderBg.BorderSizePixel = 0
            sliderBg.Size = UDim2.new(1, -20, 0, 6)
            sliderBg.Position = UDim2.new(0, 10, 0, 32)
            sliderBg.Parent = frame
            Corner(sliderBg, 3)

            local sliderFill = Instance.new("Frame")
            sliderFill.Name = "SliderFill"
            sliderFill.BackgroundColor3 = Theme.Accent
            sliderFill.BorderSizePixel = 0
            local pct = math.clamp((current - min) / (max - min), 0, 1)
            sliderFill.Size = UDim2.new(pct, 0, 1, 0)
            sliderFill.Parent = sliderBg
            Corner(sliderFill, 3)

            local sliderKnob = Instance.new("Frame")
            sliderKnob.Name = "Knob"
            sliderKnob.BackgroundColor3 = Theme.Text
            sliderKnob.BorderSizePixel = 0
            sliderKnob.Size = UDim2.new(0, 12, 0, 12)
            sliderKnob.Position = UDim2.new(1, -6, 0.5, -6)
            sliderKnob.ZIndex = 5
            sliderKnob.Parent = sliderFill
            Corner(sliderKnob, 6)

            local sliderBtn = Instance.new("TextButton")
            sliderBtn.Name = "SliderBtn"
            sliderBtn.BackgroundTransparency = 1
            sliderBtn.Size = UDim2.new(1, 0, 1, 14)
            sliderBtn.Position = UDim2.new(0, 0, 0, -7)
            sliderBtn.Text = ""
            sliderBtn.ZIndex = 6
            sliderBtn.Parent = sliderBg

            local sliding = false

            local function UpdateSlider(inputX)
                local rel = math.clamp((inputX - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
                local raw = min + (max - min) * rel
                current = math.clamp(math.floor(raw / step + 0.5) * step, min, max)
                sliderFill.Size = UDim2.new((current - min) / (max - min), 0, 1, 0)
                valueLabel.Text = tostring(current)
            end

            sliderBtn.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    sliding = true
                    UpdateSlider(input.Position.X)
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    UpdateSlider(input.Position.X)
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
            obj.Get = function(_) return current end
            obj.SetTitle = function(_, t) sTitle.Text = t end
            obj.Destroy = function(_) frame:Destroy() end
            return obj
        end

        function Tab.Input(iConfig)
            iConfig = iConfig or {}
            local frame = ElementFrame(page, 36)
            local iTitle = TextLabel(frame, iConfig.Title or "Input", 12, Theme.Text, FontMedium)
            iTitle.Size = UDim2.new(0.5, 0, 1, 0)
            iTitle.Position = UDim2.new(0, 10, 0, 0)

            local boxFrame = Instance.new("Frame")
            boxFrame.Name = "BoxFrame"
            boxFrame.BackgroundColor3 = Theme.SliderBg
            boxFrame.BorderSizePixel = 0
            boxFrame.Size = UDim2.new(0.42, -10, 0, 24)
            boxFrame.Position = UDim2.new(0.56, 0, 0.5, -12)
            boxFrame.Parent = frame
            Corner(boxFrame, 5)
            Stroke(boxFrame, Theme.Border, 1)

            local textBox = Instance.new("TextBox")
            textBox.Name = "TextBox"
            textBox.BackgroundTransparency = 1
            textBox.BorderSizePixel = 0
            textBox.Size = UDim2.new(1, -8, 1, 0)
            textBox.Position = UDim2.new(0, 4, 0, 0)
            textBox.Text = iConfig.Default or ""
            textBox.PlaceholderText = iConfig.Placeholder or "..."
            textBox.PlaceholderColor3 = Color3.fromRGB(80, 80, 80)
            textBox.TextColor3 = Theme.Text
            textBox.TextSize = 12
            textBox.FontFace = FontRegular
            textBox.ClearTextOnFocus = false
            textBox.ClipsDescendants = true
            textBox.Parent = boxFrame

            textBox.FocusLost:Connect(function(enter)
                if iConfig.Callback then iConfig.Callback(textBox.Text, enter) end
            end)

            local obj = {}
            obj.SetTitle = function(_, t) iTitle.Text = t end
            obj.SetValue = function(_, v) textBox.Text = v end
            obj.GetValue = function(_) return textBox.Text end
            obj.Destroy = function(_) frame:Destroy() end
            return obj
        end

        function Tab.Dropdown(dConfig)
            dConfig = dConfig or {}
            local options = dConfig.Options or {}
            local selected = dConfig.Default or (options[1] or "")
            local opened = false

            local frame = ElementFrame(page, 36)
            frame.ClipsDescendants = false

            local dTitle = TextLabel(frame, dConfig.Title or "Dropdown", 12, Theme.Text, FontMedium)
            dTitle.Size = UDim2.new(0.5, 0, 0, 36)
            dTitle.Position = UDim2.new(0, 10, 0, 0)

            local dropBtn = Instance.new("TextButton")
            dropBtn.Name = "DropBtn"
            dropBtn.BackgroundColor3 = Theme.SliderBg
            dropBtn.BorderSizePixel = 0
            dropBtn.Size = UDim2.new(0.42, -10, 0, 24)
            dropBtn.Position = UDim2.new(0.56, 0, 0, 6)
            dropBtn.Text = ""
            dropBtn.AutoButtonColor = false
            dropBtn.Parent = frame
            Corner(dropBtn, 5)
            Stroke(dropBtn, Theme.Border, 1)

            local selectedLabel = TextLabel(dropBtn, selected, 11, Theme.Text, FontRegular)
            selectedLabel.Size = UDim2.new(1, -22, 1, 0)
            selectedLabel.Position = UDim2.new(0, 6, 0, 0)

            local dropArrow = TextLabel(dropBtn, "v", 10, Theme.SubText, FontBold, Enum.TextXAlignment.Center)
            dropArrow.Size = UDim2.new(0, 16, 1, 0)
            dropArrow.Position = UDim2.new(1, -18, 0, 0)

            local dropList = Instance.new("Frame")
            dropList.Name = "DropList"
            dropList.BackgroundColor3 = Theme.Surface
            dropList.BorderSizePixel = 0
            dropList.Size = UDim2.new(0.42, -10, 0, 0)
            dropList.Position = UDim2.new(0.56, 0, 1, 4)
            dropList.ClipsDescendants = true
            dropList.ZIndex = 50
            dropList.Visible = false
            dropList.Parent = frame
            Corner(dropList, 6)
            Stroke(dropList, Theme.Border, 1)
            Padding(dropList, 3, 3, 3, 3)
            ListLayout(dropList, 2)

            local function BuildOptions()
                for _, child in ipairs(dropList:GetChildren()) do
                    if child:IsA("TextButton") then child:Destroy() end
                end
                for _, option in ipairs(options) do
                    local optBtn = Instance.new("TextButton")
                    optBtn.Name = option
                    optBtn.BackgroundColor3 = Theme.Element
                    optBtn.BackgroundTransparency = 1
                    optBtn.BorderSizePixel = 0
                    optBtn.Size = UDim2.new(1, 0, 0, 24)
                    optBtn.Text = ""
                    optBtn.AutoButtonColor = false
                    optBtn.ZIndex = 51
                    optBtn.Parent = dropList
                    Corner(optBtn, 4)
                    local optLabel = TextLabel(optBtn, option, 11, Theme.Text, FontRegular)
                    optLabel.Size = UDim2.new(1, -8, 1, 0)
                    optLabel.Position = UDim2.new(0, 4, 0, 0)
                    optLabel.ZIndex = 52
                    optBtn.MouseEnter:Connect(function()
                        Tween(optBtn, FastTween, {BackgroundTransparency = 0, BackgroundColor3 = Theme.ElementHover})
                    end)
                    optBtn.MouseLeave:Connect(function()
                        Tween(optBtn, FastTween, {BackgroundTransparency = 1})
                    end)
                    optBtn.MouseButton1Click:Connect(function()
                        selected = option
                        selectedLabel.Text = option
                        opened = false
                        dropList.Visible = false
                        dropList.Size = UDim2.new(0.42, -10, 0, 0)
                        if dConfig.Callback then dConfig.Callback(option) end
                    end)
                end
            end

            BuildOptions()

            dropBtn.MouseButton1Click:Connect(function()
                opened = not opened
                if opened then
                    local totalH = math.min(#options * 26 + 6, 160)
                    dropList.Visible = true
                    dropList.Size = UDim2.new(0.42, -10, 0, totalH)
                else
                    dropList.Visible = false
                    dropList.Size = UDim2.new(0.42, -10, 0, 0)
                end
            end)

            local obj = {}
            obj.Set = function(_, val) selected = val selectedLabel.Text = val end
            obj.Get = function(_) return selected end
            obj.SetOptions = function(_, newOpts) options = newOpts BuildOptions() end
            obj.SetTitle = function(_, t) dTitle.Text = t end
            obj.Destroy = function(_) frame:Destroy() end
            return obj
        end

        function Tab.Keybind(kConfig)
            kConfig = kConfig or {}
            local currentKey = kConfig.Default or Enum.KeyCode.E
            local listening = false

            local frame = ElementFrame(page, 36)
            local kTitle = TextLabel(frame, kConfig.Title or "Keybind", 12, Theme.Text, FontMedium)
            kTitle.Size = UDim2.new(0.6, 0, 1, 0)
            kTitle.Position = UDim2.new(0, 10, 0, 0)

            local keyBtn = Instance.new("TextButton")
            keyBtn.Name = "KeyBtn"
            keyBtn.BackgroundColor3 = Theme.SliderBg
            keyBtn.BorderSizePixel = 0
            keyBtn.Size = UDim2.new(0, 70, 0, 24)
            keyBtn.Position = UDim2.new(1, -82, 0.5, -12)
            keyBtn.Text = currentKey.Name
            keyBtn.TextColor3 = Theme.Text
            keyBtn.TextSize = 11
            keyBtn.FontFace = FontMedium
            keyBtn.AutoButtonColor = false
            keyBtn.Parent = frame
            Corner(keyBtn, 5)
            Stroke(keyBtn, Theme.Border, 1)

            keyBtn.MouseButton1Click:Connect(function()
                listening = true
                keyBtn.Text = "..."
                Tween(keyBtn, FastTween, {BackgroundColor3 = Theme.Accent})
            end)

            local inputConn = UserInputService.InputBegan:Connect(function(input, processed)
                if not listening then return end
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    if input.KeyCode == Enum.KeyCode.Escape then
                        listening = false
                        keyBtn.Text = currentKey.Name
                        Tween(keyBtn, FastTween, {BackgroundColor3 = Theme.SliderBg})
                        return
                    end
                    currentKey = input.KeyCode
                    keyBtn.Text = currentKey.Name
                    listening = false
                    Tween(keyBtn, FastTween, {BackgroundColor3 = Theme.SliderBg})
                    if kConfig.Callback then kConfig.Callback(currentKey) end
                end
            end)

            local pressConn
            if kConfig.OnPress then
                pressConn = UserInputService.InputBegan:Connect(function(input, processed)
                    if processed then return end
                    if input.KeyCode == currentKey then kConfig.OnPress() end
                end)
            end

            local obj = {}
            obj.Set = function(_, key) currentKey = key keyBtn.Text = key.Name end
            obj.Get = function(_) return currentKey end
            obj.SetTitle = function(_, t) kTitle.Text = t end
            obj.Destroy = function(_)
                frame:Destroy()
                inputConn:Disconnect()
                if pressConn then pressConn:Disconnect() end
            end
            return obj
        end

        function Tab.ColorPicker(cConfig)
            cConfig = cConfig or {}
            local currentColor = cConfig.Default or Color3.fromRGB(120, 100, 255)
            local opened = false

            local frame = ElementFrame(page, 36)
            frame.ClipsDescendants = false

            local cTitle = TextLabel(frame, cConfig.Title or "Color", 12, Theme.Text, FontMedium)
            cTitle.Size = UDim2.new(0.6, 0, 1, 0)
            cTitle.Position = UDim2.new(0, 10, 0, 0)

            local colorPreview = Instance.new("TextButton")
            colorPreview.Name = "ColorPreview"
            colorPreview.BackgroundColor3 = currentColor
            colorPreview.BorderSizePixel = 0
            colorPreview.Size = UDim2.new(0, 50, 0, 22)
            colorPreview.Position = UDim2.new(1, -62, 0.5, -11)
            colorPreview.Text = ""
            colorPreview.AutoButtonColor = false
            colorPreview.Parent = frame
            Corner(colorPreview, 5)
            Stroke(colorPreview, Theme.Border, 1)

            local pickerFrame = Instance.new("Frame")
            pickerFrame.Name = "PickerFrame"
            pickerFrame.BackgroundColor3 = Theme.Surface
            pickerFrame.BorderSizePixel = 0
            pickerFrame.Size = UDim2.new(0, 220, 0, 0)
            pickerFrame.Position = UDim2.new(1, -232, 1, 6)
            pickerFrame.ClipsDescendants = true
            pickerFrame.ZIndex = 60
            pickerFrame.Visible = false
            pickerFrame.Parent = frame
            Corner(pickerFrame, 8)
            Stroke(pickerFrame, Theme.Border, 1)

            local hueFrame = Instance.new("Frame")
            hueFrame.Name = "HueFrame"
            hueFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            hueFrame.BorderSizePixel = 0
            hueFrame.Size = UDim2.new(0, 180, 0, 100)
            hueFrame.Position = UDim2.new(0, 10, 0, 10)
            hueFrame.ZIndex = 61
            hueFrame.Parent = pickerFrame
            Corner(hueFrame, 4)

            local satValOverlay = Instance.new("Frame")
            satValOverlay.Name = "SatVal"
            satValOverlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            satValOverlay.BackgroundTransparency = 0
            satValOverlay.BorderSizePixel = 0
            satValOverlay.Size = UDim2.new(1, 0, 1, 0)
            satValOverlay.ZIndex = 62
            satValOverlay.Parent = hueFrame
            Corner(satValOverlay, 4)

            local satGradient = Instance.new("UIGradient")
            satGradient.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255))
            satGradient.Transparency = NumberSequence.new(0, 1)
            satGradient.Rotation = 0
            satGradient.Parent = satValOverlay

            local valOverlay = Instance.new("Frame")
            valOverlay.Name = "ValOverlay"
            valOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            valOverlay.BackgroundTransparency = 0.5
            valOverlay.BorderSizePixel = 0
            valOverlay.Size = UDim2.new(1, 0, 1, 0)
            valOverlay.ZIndex = 63
            valOverlay.Parent = hueFrame
            Corner(valOverlay, 4)

            local hueSlider = Instance.new("Frame")
            hueSlider.Name = "HueSlider"
            hueSlider.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            hueSlider.BorderSizePixel = 0
            hueSlider.Size = UDim2.new(0, 12, 0, 100)
            hueSlider.Position = UDim2.new(0, 196, 0, 10)
            hueSlider.ZIndex = 61
            hueSlider.Parent = pickerFrame
            Corner(hueSlider, 4)

            local hueGradient = Instance.new("UIGradient")
            hueGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(0.167, Color3.fromRGB(255, 255, 0)),
                ColorSequenceKeypoint.new(0.333, Color3.fromRGB(0, 255, 0)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
                ColorSequenceKeypoint.new(0.667, Color3.fromRGB(0, 0, 255)),
                ColorSequenceKeypoint.new(0.833, Color3.fromRGB(255, 0, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)),
            })
            hueGradient.Rotation = 90
            hueGradient.Parent = hueSlider

            local hueKnob = Instance.new("Frame")
            hueKnob.Name = "HueKnob"
            hueKnob.BackgroundColor3 = Theme.Text
            hueKnob.BorderSizePixel = 0
            hueKnob.Size = UDim2.new(1, 4, 0, 4)
            hueKnob.Position = UDim2.new(0, -2, 0, 0)
            hueKnob.ZIndex = 64
            hueKnob.Parent = hueSlider

            local svKnob = Instance.new("Frame")
            svKnob.Name = "SvKnob"
            svKnob.BackgroundColor3 = Theme.Text
            svKnob.BorderSizePixel = 0
            svKnob.Size = UDim2.new(0, 6, 0, 6)
            svKnob.Position = UDim2.new(0.5, -3, 0.5, -3)
            svKnob.ZIndex = 64
            svKnob.Parent = hueFrame
            Corner(svKnob, 3)

            local rBox = Instance.new("TextBox")
            rBox.Name = "R"
            rBox.BackgroundColor3 = Theme.Element
            rBox.BorderSizePixel = 0
            rBox.Size = UDim2.new(0, 50, 0, 20)
            rBox.Position = UDim2.new(0, 10, 0, 120)
            rBox.Text = tostring(math.floor(currentColor.R * 255))
            rBox.TextColor3 = Theme.Text
            rBox.TextSize = 11
            rBox.FontFace = FontRegular
            rBox.ZIndex = 61
            rBox.Parent = pickerFrame
            Corner(rBox, 4)
            Stroke(rBox, Theme.Border, 1)

            local gBox = Instance.new("TextBox")
            gBox.Name = "G"
            gBox.BackgroundColor3 = Theme.Element
            gBox.BorderSizePixel = 0
            gBox.Size = UDim2.new(0, 50, 0, 20)
            gBox.Position = UDim2.new(0, 70, 0, 120)
            gBox.Text = tostring(math.floor(currentColor.G * 255))
            gBox.TextColor3 = Theme.Text
            gBox.TextSize = 11
            gBox.FontFace = FontRegular
            gBox.ZIndex = 61
            gBox.Parent = pickerFrame
            Corner(gBox, 4)
            Stroke(gBox, Theme.Border, 1)

            local bBox = Instance.new("TextBox")
            bBox.Name = "B"
            bBox.BackgroundColor3 = Theme.Element
            bBox.BorderSizePixel = 0
            bBox.Size = UDim2.new(0, 50, 0, 20)
            bBox.Position = UDim2.new(0, 130, 0, 120)
            bBox.Text = tostring(math.floor(currentColor.B * 255))
            bBox.TextColor3 = Theme.Text
            bBox.TextSize = 11
            bBox.FontFace = FontRegular
            bBox.ZIndex = 61
            bBox.Parent = pickerFrame
            Corner(bBox, 4)
            Stroke(bBox, Theme.Border, 1)

            local h, s, v = currentColor:ToHSV()
            hueKnob.Position = UDim2.new(0, -2, h, -2)
            svKnob.Position = UDim2.new(s, -3, 1 - v, -3)
            hueFrame.BackgroundColor3 = Color3.fromHSV(h, 1, 1)

            local function UpdateFromRGB()
                local r = math.clamp(tonumber(rBox.Text) or 0, 0, 255)
                local g = math.clamp(tonumber(gBox.Text) or 0, 0, 255)
                local b = math.clamp(tonumber(bBox.Text) or 0, 0, 255)
                currentColor = Color3.fromRGB(r, g, b)
                colorPreview.BackgroundColor3 = currentColor
                local nh, ns, nv = currentColor:ToHSV()
                hueKnob.Position = UDim2.new(0, -2, nh, -2)
                svKnob.Position = UDim2.new(ns, -3, 1 - nv, -3)
                hueFrame.BackgroundColor3 = Color3.fromHSV(nh, 1, 1)
                if cConfig.Callback then cConfig.Callback(currentColor) end
            end

            local function UpdateFromHSV(nh, ns, nv)
                currentColor = Color3.fromHSV(nh, ns, nv)
                colorPreview.BackgroundColor3 = currentColor
                rBox.Text = tostring(math.floor(currentColor.R * 255))
                gBox.Text = tostring(math.floor(currentColor.G * 255))
                bBox.Text = tostring(math.floor(currentColor.B * 255))
                if cConfig.Callback then cConfig.Callback(currentColor) end
            end

            local pickingSV = false
            local pickingHue = false

            hueFrame.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    pickingSV = true
                    local relX = math.clamp((input.Position.X - hueFrame.AbsolutePosition.X) / hueFrame.AbsoluteSize.X, 0, 1)
                    local relY = math.clamp((input.Position.Y - hueFrame.AbsolutePosition.Y) / hueFrame.AbsoluteSize.Y, 0, 1)
                    svKnob.Position = UDim2.new(relX, -3, relY, -3)
                    local nh = hueKnob.Position.Y.Scale
                    UpdateFromHSV(nh, relX, 1 - relY)
                end
            end)

            hueSlider.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    pickingHue = true
                    local relY = math.clamp((input.Position.Y - hueSlider.AbsolutePosition.Y) / hueSlider.AbsoluteSize.Y, 0, 1)
                    hueKnob.Position = UDim2.new(0, -2, relY, -2)
                    hueFrame.BackgroundColor3 = Color3.fromHSV(relY, 1, 1)
                    local ns = svKnob.Position.X.Scale
                    local nv = 1 - svKnob.Position.Y.Scale
                    UpdateFromHSV(relY, ns, nv)
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if pickingSV and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    local relX = math.clamp((input.Position.X - hueFrame.AbsolutePosition.X) / hueFrame.AbsoluteSize.X, 0, 1)
                    local relY = math.clamp((input.Position.Y - hueFrame.AbsolutePosition.Y) / hueFrame.AbsoluteSize.Y, 0, 1)
                    svKnob.Position = UDim2.new(relX, -3, relY, -3)
                    local nh = hueKnob.Position.Y.Scale
                    UpdateFromHSV(nh, relX, 1 - relY)
                end
                if pickingHue and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    local relY = math.clamp((input.Position.Y - hueSlider.AbsolutePosition.Y) / hueSlider.AbsoluteSize.Y, 0, 1)
                    hueKnob.Position = UDim2.new(0, -2, relY, -2)
                    hueFrame.BackgroundColor3 = Color3.fromHSV(relY, 1, 1)
                    local ns = svKnob.Position.X.Scale
                    local nv = 1 - svKnob.Position.Y.Scale
                    UpdateFromHSV(relY, ns, nv)
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    pickingSV = false
                    pickingHue = false
                end
            end)

            rBox.FocusLost:Connect(UpdateFromRGB)
            gBox.FocusLost:Connect(UpdateFromRGB)
            bBox.FocusLost:Connect(UpdateFromRGB)

            colorPreview.MouseButton1Click:Connect(function()
                opened = not opened
                if opened then
                    pickerFrame.Visible = true
                    pickerFrame.Size = UDim2.new(0, 220, 0, 150)
                else
                    pickerFrame.Size = UDim2.new(0, 220, 0, 0)
                    task.wait(0.2)
                    pickerFrame.Visible = false
                end
            end)

            local obj = {}
            obj.Set = function(_, color)
                currentColor = color
                colorPreview.BackgroundColor3 = color
                rBox.Text = tostring(math.floor(color.R * 255))
                gBox.Text = tostring(math.floor(color.G * 255))
                bBox.Text = tostring(math.floor(color.B * 255))
                local nh, ns, nv = color:ToHSV()
                hueKnob.Position = UDim2.new(0, -2, nh, -2)
                svKnob.Position = UDim2.new(ns, -3, 1 - nv, -3)
                hueFrame.BackgroundColor3 = Color3.fromHSV(nh, 1, 1)
            end
            obj.Get = function(_) return currentColor end
            obj.SetTitle = function(_, t) cTitle.Text = t end
            obj.Destroy = function(_) frame:Destroy() end
            return obj
        end

        return Tab
    end

    function Window.SetTitle(_, t) TitleText.Text = t end
    function Window.Toggle(_) ScreenGui.Enabled = not ScreenGui.Enabled end
    function Window.Destroy(_) ScreenGui:Destroy() end

    Main.Size = UDim2.new(0, 0, 0, 0)
    Shadow.Size = UDim2.new(0, 40, 0, 40)
    Tween(Main, SlideTween, {Size = UDim2.new(0, 520, 0, 320)})
    Tween(Shadow, SlideTween, {Size = UDim2.new(0, 560, 0, 360)})

    return Window
end

return AvUI
