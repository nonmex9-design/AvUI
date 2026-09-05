--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 72 | Scripts: 9 | Modules: 2 | Tags: 0
local G2L = {};

-- StarterGui.AvUI
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[AvUI]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.AvUI.Module
G2L["2"] = Instance.new("ModuleScript", G2L["1"]);
G2L["2"]["Name"] = [[Module]];


-- StarterGui.AvUI.Window
G2L["3"] = Instance.new("Frame", G2L["1"]);
G2L["3"]["ZIndex"] = 999999999;
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Name"] = [[Window]];
G2L["3"]["BackgroundTransparency"] = 1;


-- StarterGui.AvUI.Window.NotifAPI
G2L["4"] = Instance.new("LocalScript", G2L["3"]);
G2L["4"]["Name"] = [[NotifAPI]];


-- StarterGui.AvUI.Window.Icons
G2L["5"] = Instance.new("ModuleScript", G2L["3"]);
G2L["5"]["Name"] = [[Icons]];


-- StarterGui.AvUI.Window.ST
G2L["6"] = Instance.new("LocalScript", G2L["3"]);
G2L["6"]["Name"] = [[ST]];


-- StarterGui.AvUI.Window.UI
G2L["7"] = Instance.new("Frame", G2L["3"]);
G2L["7"]["ZIndex"] = 999999999;
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(16, 16, 16);
G2L["7"]["Size"] = UDim2.new(0.37475, 0, 0.40064, 0);
G2L["7"]["Position"] = UDim2.new(0.31229, 0, 0.29968, 0);
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["Name"] = [[UI]];


-- StarterGui.AvUI.Window.UI.UICorner
G2L["8"] = Instance.new("UICorner", G2L["7"]);
G2L["8"]["CornerRadius"] = UDim.new(0, 5);


-- StarterGui.AvUI.Window.UI.UIStroke
G2L["9"] = Instance.new("UIStroke", G2L["7"]);
G2L["9"]["Thickness"] = 1.5;
G2L["9"]["Color"] = Color3.fromRGB(26, 26, 26);
G2L["9"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.AvUI.Window.UI.Top
G2L["a"] = Instance.new("Frame", G2L["7"]);
G2L["a"]["ZIndex"] = 2;
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(16, 16, 16);
G2L["a"]["Size"] = UDim2.new(1, 0, 0.14, 0);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Name"] = [[Top]];


-- StarterGui.AvUI.Window.UI.Top.UICorner
G2L["b"] = Instance.new("UICorner", G2L["a"]);
G2L["b"]["CornerRadius"] = UDim.new(0, 5);


-- StarterGui.AvUI.Window.UI.Top.UIStroke
G2L["c"] = Instance.new("UIStroke", G2L["a"]);
G2L["c"]["Color"] = Color3.fromRGB(21, 21, 21);
G2L["c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.AvUI.Window.UI.Top.Close
G2L["d"] = Instance.new("TextButton", G2L["a"]);
G2L["d"]["BorderSizePixel"] = 0;
G2L["d"]["TextTransparency"] = 1;
G2L["d"]["TextSize"] = 14;
G2L["d"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
G2L["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["d"]["Size"] = UDim2.new(0.05556, 0, 0.71429, 0);
G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["d"]["Text"] = [[]];
G2L["d"]["Name"] = [[Close]];
G2L["d"]["Position"] = UDim2.new(0.92222, 0, 0.14286, 0);


-- StarterGui.AvUI.Window.UI.Top.Close.Hover
G2L["e"] = Instance.new("LocalScript", G2L["d"]);
G2L["e"]["Name"] = [[Hover]];


-- StarterGui.AvUI.Window.UI.Top.Close.UICorner
G2L["f"] = Instance.new("UICorner", G2L["d"]);
G2L["f"]["CornerRadius"] = UDim.new(0, 5);


-- StarterGui.AvUI.Window.UI.Top.Close.Icon
G2L["10"] = Instance.new("ImageLabel", G2L["d"]);
G2L["10"]["BorderSizePixel"] = 0;
G2L["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["10"]["ImageColor3"] = Color3.fromRGB(201, 201, 201);
G2L["10"]["Image"] = [[rbxasset://textures/ui/GuiImagePlaceholder.png]];
G2L["10"]["Size"] = UDim2.new(0, 15, 0, 15);
G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["10"]["BackgroundTransparency"] = 1;
G2L["10"]["Name"] = [[Icon]];
G2L["10"]["Position"] = UDim2.new(0.2, 0, 0.16, 0);


-- StarterGui.AvUI.Window.UI.Top.Minimize
G2L["11"] = Instance.new("TextButton", G2L["a"]);
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["TextTransparency"] = 1;
G2L["11"]["TextSize"] = 14;
G2L["11"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["11"]["Size"] = UDim2.new(0.05556, 0, 0.71429, 0);
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Text"] = [[]];
G2L["11"]["Name"] = [[Minimize]];
G2L["11"]["Position"] = UDim2.new(0.84444, 0, 0.14286, 0);


-- StarterGui.AvUI.Window.UI.Top.Minimize.Hover
G2L["12"] = Instance.new("LocalScript", G2L["11"]);
G2L["12"]["Name"] = [[Hover]];


-- StarterGui.AvUI.Window.UI.Top.Minimize.UICorner
G2L["13"] = Instance.new("UICorner", G2L["11"]);
G2L["13"]["CornerRadius"] = UDim.new(0, 5);


-- StarterGui.AvUI.Window.UI.Top.Minimize.Icon
G2L["14"] = Instance.new("ImageLabel", G2L["11"]);
G2L["14"]["BorderSizePixel"] = 0;
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["14"]["ImageColor3"] = Color3.fromRGB(201, 201, 201);
G2L["14"]["Image"] = [[rbxasset://textures/ui/GuiImagePlaceholder.png]];
G2L["14"]["Size"] = UDim2.new(0, 15, 0, 15);
G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["BackgroundTransparency"] = 1;
G2L["14"]["Name"] = [[Icon]];
G2L["14"]["Position"] = UDim2.new(0.2, 0, 0.16, 0);


-- StarterGui.AvUI.Window.UI.Top.Discord
G2L["15"] = Instance.new("ImageButton", G2L["a"]);
G2L["15"]["BorderSizePixel"] = 0;
G2L["15"]["BackgroundTransparency"] = 1;
G2L["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["15"]["ImageColor3"] = Color3.fromRGB(201, 201, 201);
G2L["15"]["Image"] = [[rbxassetid://121871608951855]];
G2L["15"]["Size"] = UDim2.new(0.04444, 0, 0.57143, 0);
G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["15"]["Name"] = [[Discord]];
G2L["15"]["Position"] = UDim2.new(0.77589, 0, 0.17157, 0);


-- StarterGui.AvUI.Window.UI.Top.Discord.Hover
G2L["16"] = Instance.new("LocalScript", G2L["15"]);
G2L["16"]["Name"] = [[Hover]];


-- StarterGui.AvUI.Window.UI.Top.Discord.UICorner
G2L["17"] = Instance.new("UICorner", G2L["15"]);
G2L["17"]["CornerRadius"] = UDim.new(0, 5);


-- StarterGui.AvUI.Window.UI.Top.Youtube
G2L["18"] = Instance.new("ImageButton", G2L["a"]);
G2L["18"]["BorderSizePixel"] = 0;
G2L["18"]["BackgroundTransparency"] = 1;
G2L["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["18"]["ImageColor3"] = Color3.fromRGB(201, 201, 201);
G2L["18"]["Image"] = [[rbxassetid://121871608951855]];
G2L["18"]["Size"] = UDim2.new(0.04444, 0, 0.57143, 0);
G2L["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["18"]["Name"] = [[Youtube]];
G2L["18"]["Position"] = UDim2.new(0.70922, 0, 0.17157, 0);


-- StarterGui.AvUI.Window.UI.Top.Youtube.Hover
G2L["19"] = Instance.new("LocalScript", G2L["18"]);
G2L["19"]["Name"] = [[Hover]];


-- StarterGui.AvUI.Window.UI.Top.Youtube.UICorner
G2L["1a"] = Instance.new("UICorner", G2L["18"]);
G2L["1a"]["CornerRadius"] = UDim.new(0, 5);


-- StarterGui.AvUI.Window.UI.Top.Seperator
G2L["1b"] = Instance.new("Frame", G2L["a"]);
G2L["1b"]["BorderSizePixel"] = 0;
G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
G2L["1b"]["Size"] = UDim2.new(0.00444, 0, 0.28571, 0);
G2L["1b"]["Position"] = UDim2.new(0.835, 0, 0.343, 0);
G2L["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1b"]["Name"] = [[Seperator]];


-- StarterGui.AvUI.Window.UI.Top.Name
G2L["1c"] = Instance.new("TextLabel", G2L["a"]);
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["TextSize"] = 14;
G2L["1c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["BackgroundTransparency"] = 1;
G2L["1c"]["Size"] = UDim2.new(0.44444, 0, 0.57143, 0);
G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["Text"] = [[This is the name of script yea]];
G2L["1c"]["Name"] = [[Name]];
G2L["1c"]["Position"] = UDim2.new(0.02222, 0, 0.2, 0);


-- StarterGui.AvUI.Window.UI.Main
G2L["1d"] = Instance.new("Frame", G2L["7"]);
G2L["1d"]["BorderSizePixel"] = 0;
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1d"]["Size"] = UDim2.new(1, 0, 0.86, 0);
G2L["1d"]["Position"] = UDim2.new(0, 0, 0.14, 0);
G2L["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1d"]["Name"] = [[Main]];
G2L["1d"]["BackgroundTransparency"] = 1;


-- StarterGui.AvUI.Window.UI.Main.Tabs
G2L["1e"] = Instance.new("Frame", G2L["1d"]);
G2L["1e"]["BorderSizePixel"] = 0;
G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(18, 18, 18);
G2L["1e"]["Size"] = UDim2.new(0.23333, 0, 0.93023, 0);
G2L["1e"]["Position"] = UDim2.new(0.02222, 0, 0.02791, 0);
G2L["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1e"]["Name"] = [[Tabs]];


-- StarterGui.AvUI.Window.UI.Main.Tabs.UICorner
G2L["1f"] = Instance.new("UICorner", G2L["1e"]);
G2L["1f"]["CornerRadius"] = UDim.new(0, 5);


-- StarterGui.AvUI.Window.UI.Main.Tabs.YOoooBro
G2L["20"] = Instance.new("ScrollingFrame", G2L["1e"]);
G2L["20"]["Active"] = true;
G2L["20"]["BorderSizePixel"] = 0;
G2L["20"]["Name"] = [[YOoooBro]];
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["Size"] = UDim2.new(0.95238, 0, 0.925, 0);
G2L["20"]["ScrollBarImageColor3"] = Color3.fromRGB(26, 26, 26);
G2L["20"]["Position"] = UDim2.new(0.01905, 0, 0.035, 0);
G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["ScrollBarThickness"] = 5;
G2L["20"]["BackgroundTransparency"] = 1;


-- StarterGui.AvUI.Window.UI.Main.Tabs.YOoooBro.UIListLayout
G2L["21"] = Instance.new("UIListLayout", G2L["20"]);
G2L["21"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["21"]["Padding"] = UDim.new(0, 5);
G2L["21"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.AvUI.Window.UI.Main.Tabs.YOoooBro.TabTemplate
G2L["22"] = Instance.new("Frame", G2L["20"]);
G2L["22"]["BorderSizePixel"] = 0;
G2L["22"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
G2L["22"]["Size"] = UDim2.new(0.85, 0, 0.0625, 0);
G2L["22"]["Position"] = UDim2.new(0.075, 0, 0, 0);
G2L["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["22"]["Name"] = [[TabTemplate]];


-- StarterGui.AvUI.Window.UI.Main.Tabs.YOoooBro.TabTemplate.UICorner
G2L["23"] = Instance.new("UICorner", G2L["22"]);
G2L["23"]["CornerRadius"] = UDim.new(0, 5);


-- StarterGui.AvUI.Window.UI.Main.Tabs.YOoooBro.TabTemplate.UIStroke
G2L["24"] = Instance.new("UIStroke", G2L["22"]);
G2L["24"]["Thickness"] = 1.5;
G2L["24"]["Color"] = Color3.fromRGB(26, 26, 26);
G2L["24"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["24"]["BorderStrokePosition"] = Enum.BorderStrokePosition.Inner;


-- StarterGui.AvUI.Window.UI.Main.Tabs.YOoooBro.TabTemplate.UIStroke.UIGradient
G2L["25"] = Instance.new("UIGradient", G2L["24"]);
G2L["25"]["Rotation"] = 90;
G2L["25"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0),NumberSequenceKeypoint.new(0.500, 0),NumberSequenceKeypoint.new(1.000, 1),NumberSequenceKeypoint.new(1.000, 0)};


-- StarterGui.AvUI.Window.UI.Main.Tabs.YOoooBro.TabTemplate.Icon
G2L["26"] = Instance.new("ImageLabel", G2L["22"]);
G2L["26"]["BorderSizePixel"] = 0;
G2L["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["26"]["Image"] = [[rbxassetid://121871608951855]];
G2L["26"]["Size"] = UDim2.new(0.17647, 0, 0.6, 0);
G2L["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["26"]["BackgroundTransparency"] = 1;
G2L["26"]["Name"] = [[Icon]];
G2L["26"]["Position"] = UDim2.new(0.02353, 0, 0.2, 0);


-- StarterGui.AvUI.Window.UI.Main.Tabs.YOoooBro.TabTemplate.Icon.UICorner
G2L["27"] = Instance.new("UICorner", G2L["26"]);
G2L["27"]["CornerRadius"] = UDim.new(0, 2);


-- StarterGui.AvUI.Window.UI.Main.Tabs.YOoooBro.TabTemplate.Name
G2L["28"] = Instance.new("TextLabel", G2L["22"]);
G2L["28"]["TextWrapped"] = true;
G2L["28"]["BorderSizePixel"] = 0;
G2L["28"]["TextSize"] = 14;
G2L["28"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["28"]["TextScaled"] = true;
G2L["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["28"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["28"]["BackgroundTransparency"] = 1;
G2L["28"]["RichText"] = true;
G2L["28"]["Size"] = UDim2.new(0.72941, 0, 0.6, 0);
G2L["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["28"]["Text"] = [[Tab Name Yea]];
G2L["28"]["Name"] = [[Name]];
G2L["28"]["Position"] = UDim2.new(0.24706, 0, 0.2, 0);


-- StarterGui.AvUI.Window.UI.Main.Contents
G2L["29"] = Instance.new("Frame", G2L["1d"]);
G2L["29"]["BorderSizePixel"] = 0;
G2L["29"]["BackgroundColor3"] = Color3.fromRGB(17, 17, 17);
G2L["29"]["Size"] = UDim2.new(0, 315, 0, 200);
G2L["29"]["Position"] = UDim2.new(0.27778, 0, 0.02791, 0);
G2L["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["Name"] = [[Contents]];


-- StarterGui.AvUI.Window.UI.Main.Contents.UICorner
G2L["2a"] = Instance.new("UICorner", G2L["29"]);
G2L["2a"]["CornerRadius"] = UDim.new(0, 5);


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr
G2L["2b"] = Instance.new("ScrollingFrame", G2L["29"]);
G2L["2b"]["Active"] = true;
G2L["2b"]["BorderSizePixel"] = 0;
G2L["2b"]["Name"] = [[Alr]];
G2L["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2b"]["Size"] = UDim2.new(0, 307, 0, 188);
G2L["2b"]["ScrollBarImageColor3"] = Color3.fromRGB(26, 26, 26);
G2L["2b"]["Position"] = UDim2.new(0.00952, 0, 0.035, 0);
G2L["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2b"]["ScrollBarThickness"] = 5;
G2L["2b"]["BackgroundTransparency"] = 1;


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.Icons
G2L["2c"] = Instance.new("LocalScript", G2L["2b"]);
G2L["2c"]["Name"] = [[Icons]];


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.UIListLayout
G2L["2d"] = Instance.new("UIListLayout", G2L["2b"]);
G2L["2d"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["2d"]["Padding"] = UDim.new(0, 5);
G2L["2d"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.Button
G2L["2e"] = Instance.new("Frame", G2L["2b"]);
G2L["2e"]["BorderSizePixel"] = 0;
G2L["2e"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
G2L["2e"]["Size"] = UDim2.new(0.37459, 0, 0.075, 0);
G2L["2e"]["Position"] = UDim2.new(0.35342, 0, 0, 0);
G2L["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2e"]["Name"] = [[Button]];


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.Button.UICorner
G2L["2f"] = Instance.new("UICorner", G2L["2e"]);
G2L["2f"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.Button.BOxBru
G2L["30"] = Instance.new("TextButton", G2L["2e"]);
G2L["30"]["BorderSizePixel"] = 0;
G2L["30"]["TextTransparency"] = 1;
G2L["30"]["TextSize"] = 14;
G2L["30"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["30"]["BackgroundTransparency"] = 1;
G2L["30"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["30"]["Text"] = [[]];
G2L["30"]["Name"] = [[BOxBru]];


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.Button.BOxBru.Hover
G2L["31"] = Instance.new("LocalScript", G2L["30"]);
G2L["31"]["Name"] = [[Hover]];


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.Button.BOxBru.Title
G2L["32"] = Instance.new("TextLabel", G2L["30"]);
G2L["32"]["TextWrapped"] = true;
G2L["32"]["BorderSizePixel"] = 0;
G2L["32"]["TextSize"] = 14;
G2L["32"]["TextXAlignment"] = Enum.TextXAlignment.Right;
G2L["32"]["TextScaled"] = true;
G2L["32"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["32"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["32"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["32"]["BackgroundTransparency"] = 1;
G2L["32"]["RichText"] = true;
G2L["32"]["Size"] = UDim2.new(0.65217, 0, 0.43333, 0);
G2L["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["32"]["Text"] = [[Button]];
G2L["32"]["Name"] = [[Title]];
G2L["32"]["Position"] = UDim2.new(-0.02174, 0, 0.3, 0);


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.Button.BOxBru.Cursor
G2L["33"] = Instance.new("ImageLabel", G2L["30"]);
G2L["33"]["BorderSizePixel"] = 0;
G2L["33"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["33"]["Image"] = [[rbxassetid://121871608951855]];
G2L["33"]["Size"] = UDim2.new(0.14783, 0, 0.56667, 0);
G2L["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["33"]["BackgroundTransparency"] = 1;
G2L["33"]["Name"] = [[Cursor]];
G2L["33"]["Position"] = UDim2.new(0.79332, 0, 0.23333, 0);


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.ButtonDescription
G2L["34"] = Instance.new("Frame", G2L["2b"]);
G2L["34"]["BorderSizePixel"] = 0;
G2L["34"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
G2L["34"]["Size"] = UDim2.new(0.45603, 0, 0.075, 0);
G2L["34"]["Position"] = UDim2.new(0.29642, 0, 0.0875, 0);
G2L["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["34"]["Name"] = [[ButtonDescription]];


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.ButtonDescription.UICorner
G2L["35"] = Instance.new("UICorner", G2L["34"]);
G2L["35"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.ButtonDescription.BOxBru
G2L["36"] = Instance.new("TextButton", G2L["34"]);
G2L["36"]["BorderSizePixel"] = 0;
G2L["36"]["TextTransparency"] = 1;
G2L["36"]["TextSize"] = 14;
G2L["36"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["36"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["36"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["36"]["BackgroundTransparency"] = 1;
G2L["36"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["36"]["Text"] = [[]];
G2L["36"]["Name"] = [[BOxBru]];


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.ButtonDescription.BOxBru.Hover
G2L["37"] = Instance.new("LocalScript", G2L["36"]);
G2L["37"]["Name"] = [[Hover]];


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.ButtonDescription.BOxBru.Title
G2L["38"] = Instance.new("TextLabel", G2L["36"]);
G2L["38"]["TextWrapped"] = true;
G2L["38"]["BorderSizePixel"] = 0;
G2L["38"]["TextSize"] = 14;
G2L["38"]["TextXAlignment"] = Enum.TextXAlignment.Right;
G2L["38"]["TextScaled"] = true;
G2L["38"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["38"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["38"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["38"]["BackgroundTransparency"] = 1;
G2L["38"]["RichText"] = true;
G2L["38"]["Size"] = UDim2.new(0.53571, 0, 0.43333, 0);
G2L["38"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["38"]["Text"] = [[Button]];
G2L["38"]["Name"] = [[Title]];
G2L["38"]["Position"] = UDim2.new(0.09286, 0, 0.1, 0);


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.ButtonDescription.BOxBru.Cursor
G2L["39"] = Instance.new("ImageLabel", G2L["36"]);
G2L["39"]["BorderSizePixel"] = 0;
G2L["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["39"]["Image"] = [[rbxassetid://121871608951855]];
G2L["39"]["Size"] = UDim2.new(0.12143, 0, 0.56667, 0);
G2L["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["39"]["BackgroundTransparency"] = 1;
G2L["39"]["Name"] = [[Cursor]];
G2L["39"]["Position"] = UDim2.new(0.79829, 0, 0.2, 0);


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.ButtonDescription.BOxBru.Description
G2L["3a"] = Instance.new("TextLabel", G2L["36"]);
G2L["3a"]["TextWrapped"] = true;
G2L["3a"]["BorderSizePixel"] = 0;
G2L["3a"]["TextSize"] = 14;
G2L["3a"]["TextScaled"] = true;
G2L["3a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["3a"]["TextColor3"] = Color3.fromRGB(176, 176, 176);
G2L["3a"]["BackgroundTransparency"] = 1;
G2L["3a"]["RichText"] = true;
G2L["3a"]["Size"] = UDim2.new(0.53571, 0, 0.36667, 0);
G2L["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3a"]["Text"] = [[This is a button]];
G2L["3a"]["Name"] = [[Description]];
G2L["3a"]["Position"] = UDim2.new(0.21429, 0, 0.53333, 0);


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.Textbox
G2L["3b"] = Instance.new("Frame", G2L["2b"]);
G2L["3b"]["BorderSizePixel"] = 0;
G2L["3b"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
G2L["3b"]["Size"] = UDim2.new(0.36156, 0, 0.075, 0);
G2L["3b"]["Position"] = UDim2.new(0.27199, 0, 0.175, 0);
G2L["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3b"]["Name"] = [[Textbox]];


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.Textbox.UICorner
G2L["3c"] = Instance.new("UICorner", G2L["3b"]);
G2L["3c"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.Textbox.Title
G2L["3d"] = Instance.new("TextLabel", G2L["3b"]);
G2L["3d"]["TextWrapped"] = true;
G2L["3d"]["BorderSizePixel"] = 0;
G2L["3d"]["TextSize"] = 14;
G2L["3d"]["TextScaled"] = true;
G2L["3d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3d"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["3d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3d"]["BackgroundTransparency"] = 1;
G2L["3d"]["RichText"] = true;
G2L["3d"]["Size"] = UDim2.new(0.64865, 0, 0.43333, 0);
G2L["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3d"]["Text"] = [[Textbox]];
G2L["3d"]["Name"] = [[Title]];
G2L["3d"]["Position"] = UDim2.new(0.00618, 0, 0.26667, 0);


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.Textbox.Box
G2L["3e"] = Instance.new("Frame", G2L["3b"]);
G2L["3e"]["BorderSizePixel"] = 0;
G2L["3e"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
G2L["3e"]["Size"] = UDim2.new(0.27027, 0, 0.46667, 0);
G2L["3e"]["Position"] = UDim2.new(0.68468, 0, 0.26667, 0);
G2L["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3e"]["Name"] = [[Box]];


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.Textbox.Box.UIStroke
G2L["3f"] = Instance.new("UIStroke", G2L["3e"]);
G2L["3f"]["Color"] = Color3.fromRGB(31, 31, 31);
G2L["3f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["3f"]["BorderStrokePosition"] = Enum.BorderStrokePosition.Inner;


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.Textbox.Box.UICorner
G2L["40"] = Instance.new("UICorner", G2L["3e"]);
G2L["40"]["CornerRadius"] = UDim.new(0, 5);


-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.Textbox.Box.Text
G2L["41"] = Instance.new("TextBox", G2L["3e"]);
G2L["41"]["Name"] = [[Text]];
G2L["41"]["PlaceholderColor3"] = Color3.fromRGB(151, 151, 151);
G2L["41"]["BorderSizePixel"] = 0;
G2L["41"]["TextWrapped"] = true;
G2L["41"]["TextSize"] = 14;
G2L["41"]["TextColor3"] = Color3.fromRGB(201, 201, 201);
G2L["41"]["TextScaled"] = true;
G2L["41"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["41"]["RichText"] = true;
G2L["41"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["41"]["ClearTextOnFocus"] = false;
G2L["41"]["PlaceholderText"] = [[.]];
G2L["41"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["41"]["Text"] = [[]];
G2L["41"]["BackgroundTransparency"] = 1;


-- StarterGui.AvUI.Window.Notification
G2L["42"] = Instance.new("Frame", G2L["3"]);
G2L["42"]["ZIndex"] = 999999999;
G2L["42"]["BorderSizePixel"] = 0;
G2L["42"]["BackgroundColor3"] = Color3.fromRGB(16, 16, 16);
G2L["42"]["Size"] = UDim2.new(0.10826, 0, 0.05609, 0);
G2L["42"]["Position"] = UDim2.new(0.87858, 0, 0.91987, 0);
G2L["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["42"]["Name"] = [[Notification]];


-- StarterGui.AvUI.Window.Notification.UICorner
G2L["43"] = Instance.new("UICorner", G2L["42"]);
G2L["43"]["CornerRadius"] = UDim.new(0, 5);


-- StarterGui.AvUI.Window.Notification.UIStroke
G2L["44"] = Instance.new("UIStroke", G2L["42"]);
G2L["44"]["Thickness"] = 1.5;
G2L["44"]["Color"] = Color3.fromRGB(26, 26, 26);
G2L["44"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.AvUI.Window.Notification.Title
G2L["45"] = Instance.new("TextLabel", G2L["42"]);
G2L["45"]["TextWrapped"] = true;
G2L["45"]["BorderSizePixel"] = 0;
G2L["45"]["TextSize"] = 14;
G2L["45"]["TextScaled"] = true;
G2L["45"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["45"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["45"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["45"]["BackgroundTransparency"] = 1;
G2L["45"]["RichText"] = true;
G2L["45"]["Size"] = UDim2.new(0.92308, 0, 0.4, 0);
G2L["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["45"]["Text"] = [[Title]];
G2L["45"]["Name"] = [[Title]];
G2L["45"]["Position"] = UDim2.new(0.03846, 0, 0.08571, 0);


-- StarterGui.AvUI.Window.Notification.Description
G2L["46"] = Instance.new("TextLabel", G2L["42"]);
G2L["46"]["TextWrapped"] = true;
G2L["46"]["BorderSizePixel"] = 0;
G2L["46"]["TextSize"] = 14;
G2L["46"]["TextScaled"] = true;
G2L["46"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["46"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["46"]["TextColor3"] = Color3.fromRGB(176, 176, 176);
G2L["46"]["BackgroundTransparency"] = 1;
G2L["46"]["RichText"] = true;
G2L["46"]["Size"] = UDim2.new(0.92308, 0, 0.31429, 0);
G2L["46"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["46"]["Text"] = [[Description]];
G2L["46"]["Name"] = [[Description]];
G2L["46"]["Position"] = UDim2.new(0.03846, 0, 0.57143, 0);


-- StarterGui.AvUI.Window.Notification.UIAspectRatioConstraint
G2L["47"] = Instance.new("UIAspectRatioConstraint", G2L["42"]);
G2L["47"]["AspectRatio"] = 3.71429;
G2L["47"]["AspectType"] = Enum.AspectType.ScaleWithParentSize;


-- StarterGui.AvUI.Window.GSYIDFBUEJS
G2L["48"] = Instance.new("BindableEvent", G2L["3"]);
G2L["48"]["Name"] = [[GSYIDFBUEJS]];


-- Require G2L wrapper
local G2L_REQUIRE = require;
local G2L_MODULES = {};
local function require(Module:ModuleScript)
    local ModuleState = G2L_MODULES[Module];
    if ModuleState then
        if not ModuleState.Required then
            ModuleState.Required = true;
            ModuleState.Value = ModuleState.Closure();
        end
        return ModuleState.Value;
    end;
    return G2L_REQUIRE(Module);
end

G2L_MODULES[G2L["2"]] = {
Closure = function()
    local script = G2L["2"];local AvUI = {}

local ts = game:GetService("TweenService")
local uis = game:GetService("UserInputService")

local hoverTI = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local slideTI = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

local Window = script.Parent:WaitForChild("Window")
local UI = Window:WaitForChild("UI")
local Topbar = UI:WaitForChild("Top")
local Main = UI:WaitForChild("Main")
local TabScroll = Main:WaitForChild("Tabs"):WaitForChild("YOoooBro")
local TabTemplate = TabScroll:WaitForChild("TabTemplate")
local Contents = Main:WaitForChild("Contents")
local ContentScroll = Contents:WaitForChild("Alr")
local NotifEvent = Window:WaitForChild("GSYIDFBUEJS")

local Icons = require(Window:WaitForChild("Icons"))

TabTemplate.Visible = false
ContentScroll.Visible = false

for _, v in ipairs(ContentScroll:GetChildren()) do
	if v:IsA("Frame") then
		v.Visible = false
	end
end

local activeTab = nil
local tabPages = {}

local function refreshCanvas(scroll)
	local layout = scroll:FindFirstChildOfClass("UIListLayout")
	if layout then
		scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
	end
end

local function applyHover(btn, frame)
	btn.MouseEnter:Connect(function()
		ts:Create(frame, hoverTI, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
	end)
	btn.MouseLeave:Connect(function()
		ts:Create(frame, hoverTI, {BackgroundColor3 = Color3.fromRGB(21, 21, 21)}):Play()
	end)
end

local function loadCursorIcon(imageLabel)
	task.spawn(function()
		for i = 1, 20 do
			if isfile and isfile("MonkeysStorage/cursor.png") then
				Icons.Load("cursor", imageLabel)
				return
			end
			task.wait(0.5)
		end
	end)
end

local function selectTab(tab)
	if activeTab == tab then return end

	for t, page in pairs(tabPages) do
		page.Visible = false
		ts:Create(t, hoverTI, {BackgroundColor3 = Color3.fromRGB(21, 21, 21)}):Play()
		ts:Create(t:FindFirstChild("Name"), hoverTI, {TextColor3 = Color3.fromRGB(180, 180, 180)}):Play()
	end

	activeTab = tab
	tabPages[tab].Visible = true
	ts:Create(tab, hoverTI, {BackgroundColor3 = Color3.fromRGB(26, 26, 26)}):Play()
	ts:Create(tab:FindFirstChild("Name"), hoverTI, {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
end

local tabLayout = TabScroll:FindFirstChildOfClass("UIListLayout")
if tabLayout then
	tabLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		TabScroll.CanvasSize = UDim2.new(0, 0, 0, tabLayout.AbsoluteContentSize.Y + 10)
	end)
end

AvUI.CreateWindow = function(config)
	config = config or {}
	local win = {}

	Topbar:FindFirstChild("Name").Text = config.Name or "AvUI"

	local dragging, dragInput, dragStart, startPos

	Topbar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = UI.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	Topbar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	uis.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			UI.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)

	Topbar:FindFirstChild("Close").MouseButton1Click:Connect(function()
		ts:Create(UI, slideTI, {Size = UDim2.new(0, 0, 0, 0)}):Play()
		task.wait(0.4)
		script.Parent.Enabled = false
	end)

	local minimized = false
	Topbar:FindFirstChild("Minimize").MouseButton1Click:Connect(function()
		minimized = not minimized
		if minimized then
			ts:Create(Main, slideTI, {Size = UDim2.new(1, 0, 0, 0)}):Play()
		else
			ts:Create(Main, slideTI, {Size = UDim2.new(1, 0, 0.86, 0)}):Play()
		end
	end)

	if config.Discord then
		Topbar:FindFirstChild("Discord").MouseButton1Click:Connect(function()
			if setclipboard then
				setclipboard(config.Discord)
			end
		end)
	end

	if config.Youtube then
		Topbar:FindFirstChild("Youtube").MouseButton1Click:Connect(function()
			if setclipboard then
				setclipboard(config.Youtube)
			end
		end)
	end

	win.CreateTab = function(tabConfig)
		return AvUI.CreateTab(tabConfig)
	end

	win.Notif = function(notifConfig)
		AvUI.Notif(notifConfig)
	end

	return win
end

AvUI.CreateTab = function(config)
	config = config or {}
	local tab = {}

	local tabBtn = TabTemplate:Clone()
	tabBtn.Name = config.Name or "Tab"
	tabBtn:FindFirstChild("Name").Text = config.Name or "Tab"
	tabBtn.Visible = true
	tabBtn.Parent = TabScroll

	if config.Icon then
		task.spawn(function()
			for i = 1, 20 do
				if isfile and isfile("MonkeysStorage/" .. config.Icon .. ".png") then
					Icons.Load(config.Icon, tabBtn:FindFirstChild("Icon"))
					break
				end
				task.wait(0.5)
			end
		end)
	end

	local page = Instance.new("ScrollingFrame")
	page.Name = config.Name or "Tab"
	page.Active = true
	page.BorderSizePixel = 0
	page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	page.BackgroundTransparency = 1
	page.Size = UDim2.new(0, 307, 0, 188)
	page.Position = UDim2.new(0.00952, 0, 0.035, 0)
	page.ScrollBarImageColor3 = Color3.fromRGB(26, 26, 26)
	page.ScrollBarThickness = 5
	page.Visible = false
	page.Parent = Contents

	local listLayout = Instance.new("UIListLayout", page)
	listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	listLayout.Padding = UDim.new(0, 5)
	listLayout.SortOrder = Enum.SortOrder.LayoutOrder

	listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		page.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 10)
	end)

	tabPages[tabBtn] = page

	tabBtn.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			selectTab(tabBtn)
		end
	end)

	tabBtn.MouseEnter:Connect(function()
		if activeTab ~= tabBtn then
			ts:Create(tabBtn, hoverTI, {BackgroundColor3 = Color3.fromRGB(24, 24, 24)}):Play()
		end
	end)

	tabBtn.MouseLeave:Connect(function()
		if activeTab ~= tabBtn then
			ts:Create(tabBtn, hoverTI, {BackgroundColor3 = Color3.fromRGB(21, 21, 21)}):Play()
		end
	end)

	if not activeTab then
		selectTab(tabBtn)
	end

	tab.CreateButton = function(btnConfig)
		btnConfig = btnConfig or {}
		local btn = ContentScroll:FindFirstChild("Button"):Clone()
		btn.Visible = true
		btn.Parent = page

		local trigger = btn:FindFirstChild("BOxBru")
		trigger:FindFirstChild("Title").Text = btnConfig.Name or "Button"

		loadCursorIcon(trigger:FindFirstChild("Cursor"))
		applyHover(trigger, btn)

		trigger.MouseButton1Click:Connect(function()
			if btnConfig.Callback then
				btnConfig.Callback()
			end
		end)

		refreshCanvas(page)
		return btn
	end

	tab.CreateButtonDESCRIPTION = function(btnConfig)
		btnConfig = btnConfig or {}
		local btn = ContentScroll:FindFirstChild("ButtonDescription"):Clone()
		btn.Visible = true
		btn.Parent = page

		local trigger = btn:FindFirstChild("BOxBru")
		trigger:FindFirstChild("Title").Text = btnConfig.Name or "Button"
		trigger:FindFirstChild("Description").Text = btnConfig.Description or ""

		loadCursorIcon(trigger:FindFirstChild("Cursor"))
		applyHover(trigger, btn)

		trigger.MouseButton1Click:Connect(function()
			if btnConfig.Callback then
				btnConfig.Callback()
			end
		end)

		refreshCanvas(page)
		return btn
	end

	tab.CreateTextBox = function(tbConfig)
		tbConfig = tbConfig or {}
		local tb = ContentScroll:FindFirstChild("Textbox"):Clone()
		tb.Visible = true
		tb.Parent = page

		tb:FindFirstChild("Title").Text = tbConfig.Name or "Textbox"

		local textbox = tb:FindFirstChild("Box"):FindFirstChild("Text")
		textbox.PlaceholderText = tbConfig.Placeholder or "..."

		textbox.FocusLost:Connect(function(enterPressed)
			if enterPressed and tbConfig.Callback then
				tbConfig.Callback(textbox.Text)
			end
		end)

		refreshCanvas(page)
		return tb
	end

	return tab
end

AvUI.Notif = function(config)
	config = config or {}
	NotifEvent:Fire(config.Title or "Notification", config.Description or "", config.Duration or 3)
end

return AvUI
end;
};
G2L_MODULES[G2L["5"]] = {
Closure = function()
    local script = G2L["5"];local HttpService = game:GetService("HttpService")

local Icons = {}

local Repo = "https://github.com/nonmex9-design/PublicAssetsBcImBored/tree/main/icons"
local Api = "https://api.github.com/repos/nonmex9-design/PublicAssetsBcImBored/contents/icons"
local Raw = "https://raw.githubusercontent.com/nonmex9-design/PublicAssetsBcImBored/main/icons/"
local StorageFolder = "MonkeysStorage"

local GetAsset = getcustomasset or getsynasset

local function EnsureStorage()
	if not isfolder(StorageFolder) then
		makefolder(StorageFolder)
	end
end

local function GetIcons()
	if not Repo then
		warn("No icons found inside of the Repo :(")
		warn("Try using a VPN like one.one.one.one and if that doesnt work then make a ticket in the Discord Server!")
		return
	end

	EnsureStorage()

	local Success, Response = pcall(function()
		return request({
			Url = Api,
			Method = "GET",
			Headers = {["User-Agent"] = "Roblox"}
		})
	end)

	if not Success or not Response or not Response.Body then
		warn("No icons found inside of the Repo :(")
		warn("Try using a VPN like one.one.one.one and if that doesnt work then make a ticket in the Discord Server!")
		return
	end

	local Files = HttpService:JSONDecode(Response.Body)
	local Downloaded = 0

	for _, File in ipairs(Files) do
		if File.type == "file" and File.name:match("%.png$") then
			local Path = StorageFolder .. "/" .. File.name

			if not isfile(Path) then
				local Got, IconData = pcall(function()
					return game:HttpGet(Raw .. File.name)
				end)

				if Got and IconData then
					writefile(Path, IconData)
					Downloaded += 1
				end
			end
		end
	end

	print("Downloaded " .. Downloaded .. " icons into " .. StorageFolder)
end

local function GetIcon(Name)
	local Path = StorageFolder .. "/" .. Name

	if not Path:match("%.png$") then
		Path = Path .. ".png"
	end

	if isfile(Path) then
		return GetAsset(Path)
	end

	warn("Icon '" .. Name .. "' was not found inside of " .. StorageFolder)
	return nil
end

Icons.GetIcons = function()
	task.spawn(GetIcons)
end

Icons.Get = function(Name)
	return GetIcon(Name)
end

Icons.Load = function(Name, Image)
	local Asset = GetIcon(Name)

	if Asset and Image then
		Image.Image = Asset
	end

	return Asset
end

return Icons
end;
};
-- StarterGui.AvUI.Window.NotifAPI
local function C_4()
local script = G2L["4"];
	local Icons = require(script.Parent:WaitForChild("Icons"))
	Icons.GetIcons()
	
	if game:GetService("RunService"):IsStudio() then
		warn("Script running in Studio Environment, Icons will not load twin")
	end
	
	local CloseIcon = script.Parent:WaitForChild("UI"):WaitForChild("Top"):WaitForChild("Close"):WaitForChild("Icon")
	local MinimizeIcon = script.Parent:WaitForChild("UI"):WaitForChild("Top"):WaitForChild("Minimize"):WaitForChild("Icon")
	local DiscordBtn = script.Parent:WaitForChild("UI"):WaitForChild("Top"):WaitForChild("Discord")
	local YoutubeBtn = script.Parent:WaitForChild("UI"):WaitForChild("Top"):WaitForChild("Youtube")
	
	task.spawn(function()
		for i = 1, 10 do
			if isfile("MonkeysStorage/close.png") and isfile("MonkeysStorage/minimize.png") and isfile("MonkeysStorage/discord.png") and isfile("MonkeysStorage/youtube.png") then
				break
			end
			task.wait(0.5)
		end
		Icons.Load("close", CloseIcon)
		Icons.Load("minimize", MinimizeIcon)
		Icons.Load("discord", DiscordBtn)
		Icons.Load("youtube", YoutubeBtn)
	end)
end;
task.spawn(C_4);
-- StarterGui.AvUI.Window.ST
local function C_6()
local script = G2L["6"];
	local Icons = require(script.Parent:WaitForChild("Icons"))
	Icons.GetIcons()
	
	if game:GetService("RunService"):IsStudio() then
		warn("Script running in Studio Enivorment, Icons will not load twin 😔")
	end
	
	local Close = script.Parent:WaitForChild("UI"):WaitForChild("Top"):WaitForChild("Close")
	local CloseI = Close:WaitForChild("Icon").Image
	
	local Minimize = script.Parent:WaitForChild("UI"):WaitForChild("Top"):WaitForChild("Minimize")
	local MinimizeI = Minimize:WaitForChild("Icon").Image
	
	local Discord = script.Parent:WaitForChild("UI"):WaitForChild("Top"):WaitForChild("Discord")
	local Youtube = script.Parent:WaitForChild("UI"):WaitForChild("Top"):WaitForChild("Youtube")
	
	task.spawn(function()
		for i = 1, 10 do
			if  isfile("MonkeysStorage/close.png") and isfile("MonkeysStorage/minimize.png") and isfile("MonkeysStorage/discord.png") and isfile("MonkeysStorage/youtube.png") then
				break
			end
			task.wait(0.5)
		end
		Icons.Load("close", CloseI)
		Icons.Load("minimize", MinimizeI)
		Icons.Load("discord", Discord)
		Icons.Load("youtube", Youtube)
	end)
end;
task.spawn(C_6);
-- StarterGui.AvUI.Window.UI.Top.Close.Hover
local function C_e()
local script = G2L["e"];
	local ts = game:GetService("TweenService")
	local ti = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	
	script.Parent.MouseEnter:Connect(function()
		ts:Create(script.Parent, ti, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
		ts:Create(script.Parent:WaitForChild("Icon"), ti, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	end)
	
	script.Parent.MouseLeave:Connect(function()
		ts:Create(script.Parent, ti, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}):Play()
		ts:Create(script.Parent:WaitForChild("Icon"), ti, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	end)
end;
task.spawn(C_e);
-- StarterGui.AvUI.Window.UI.Top.Minimize.Hover
local function C_12()
local script = G2L["12"];
	local ts = game:GetService("TweenService")
	local ti = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	
	script.Parent.MouseEnter:Connect(function()
		ts:Create(script.Parent, ti, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
		ts:Create(script.Parent:WaitForChild("Icon"), ti, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	end)
	
	script.Parent.MouseLeave:Connect(function()
		ts:Create(script.Parent, ti, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}):Play()
		ts:Create(script.Parent:WaitForChild("Icon"), ti, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	end)
end;
task.spawn(C_12);
-- StarterGui.AvUI.Window.UI.Top.Discord.Hover
local function C_16()
local script = G2L["16"];
	local ts = game:GetService("TweenService")
	local ti = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	
	script.Parent.MouseEnter:Connect(function()
		ts:Create(script.Parent, ti, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
		ts:Create(script.Parent, ti, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	end)
	
	script.Parent.MouseLeave:Connect(function()
		ts:Create(script.Parent, ti, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}):Play()
		ts:Create(script.Parent, ti, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	end)
end;
task.spawn(C_16);
-- StarterGui.AvUI.Window.UI.Top.Youtube.Hover
local function C_19()
local script = G2L["19"];
	local ts = game:GetService("TweenService")
	local ti = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	
	script.Parent.MouseEnter:Connect(function()
		ts:Create(script.Parent, ti, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
		ts:Create(script.Parent, ti, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	end)
	
	script.Parent.MouseLeave:Connect(function()
		ts:Create(script.Parent, ti, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}):Play()
		ts:Create(script.Parent, ti, {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
	end)
end;
task.spawn(C_19);
-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.Icons
local function C_2c()
local script = G2L["2c"];
	local Icons = require(script.Parent.Parent.Parent.Parent.Parent:WaitForChild("Icons"))
	Icons.GetIcons()
	
	task.spawn(function()
		for i = 1, 20 do
			if isfile("MonkeysStorage/cursor.png") then
				break
			end
			task.wait(0.5)
		end
	
		if not isfile("MonkeysStorage/cursor.png") then
			return
		end
	
		for _, Button in ipairs(script.Parent:GetDescendants()) do
			if Button:IsA("Frame") and (Button.Name == "Button" or Button.Name == "ButtonDescription") then
				local BoxBru = Button:FindFirstChild("BOxBru", true)
	
				if BoxBru and BoxBru:IsA("TextButton") then
					local Cursor = BoxBru:FindFirstChild("Cursor", true)
	
					if Cursor and Cursor:IsA("ImageLabel") then
						Icons.Load("cursor", Cursor)
					end
				end
			end
		end
	end)
end;
task.spawn(C_2c);
-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.Button.BOxBru.Hover
local function C_31()
local script = G2L["31"];
	local ts = game:GetService("TweenService")
	local ti = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	
	script.Parent.MouseEnter:Connect(function()
		ts:Create(script.Parent.Parent, ti, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
	end)
	
	script.Parent.MouseLeave:Connect(function()
		ts:Create(script.Parent.Parent, ti, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}):Play()
	end)
end;
task.spawn(C_31);
-- StarterGui.AvUI.Window.UI.Main.Contents.Alr.ButtonDescription.BOxBru.Hover
local function C_37()
local script = G2L["37"];
	local ts = game:GetService("TweenService")
	local ti = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
	
	script.Parent.MouseEnter:Connect(function()
		ts:Create(script.Parent.Parent, ti, {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play()
	end)
	
	script.Parent.MouseLeave:Connect(function()
		ts:Create(script.Parent.Parent, ti, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}):Play()
	end)
end;
task.spawn(C_37);

return G2L["1"], require;
