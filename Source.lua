--Library
local Players = game:GetService("Players")
local tween = game:GetService("TweenService")
local runService = game:GetService("RunService")
local coreService = game:GetService("CoreGui")
local uis = game:GetService("UserInputService")

local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local minimized = false

local Xniper = {
	CurrentTab = nil,
	GlobalObjects = {},
	TweenTypes = {
		Drag = TweenInfo.new(.08, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
		Minimize = TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	},
	ClickHandlerActive = false
}

wait(0.1)

function Xniper:validate(defaults, options)
	for i, v in pairs(defaults) do
		if options == nil then
			options = v
		end
	end
	return options
end

function Xniper:tween(object, goal, callback)
	local tween = tween:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Xniper:CreateWindow(options)
	options = Xniper:validate({
		Title = "Validation"
	}, options or {})

	do
		Xniper["1"] = Instance.new("ScreenGui", runService:IsStudio() and Players.LocalPlayer:WaitForChild("PlayerGui") or coreService);
		Xniper["1"]["Name"] = [[XniperLib]];
		Xniper["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
		Xniper["1"]["IgnoreGuiInset"] = true

		Xniper["2"] = Instance.new("Frame", Xniper["1"]);
		Xniper["2"]["BorderSizePixel"] = 0;
		Xniper["2"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
		Xniper["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		Xniper["2"]["Size"] = UDim2.new(0, 501, 0, 306);
		Xniper["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Xniper["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		Xniper["2"]["Name"] = [[Main]];

		Xniper["3"] = Instance.new("UICorner", Xniper["2"]);
		Xniper["3"]["CornerRadius"] = UDim.new(0, 6);

		Xniper["a"] = Instance.new("Frame", Xniper["2"]);
		Xniper["a"]["BorderSizePixel"] = 0;
		Xniper["a"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
		Xniper["a"]["Size"] = UDim2.new(0, 500, 0, 37);
		Xniper["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Xniper["a"]["Name"] = [[TopBar]];

		Xniper["b"] = Instance.new("UICorner", Xniper["a"]);
		Xniper["b"]["CornerRadius"] = UDim.new(0, 6);

		Xniper["c"] = Instance.new("Frame", Xniper["a"]);
		Xniper["c"]["BorderSizePixel"] = 0;
		Xniper["c"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
		Xniper["c"]["Size"] = UDim2.new(0, 501,0, 8);
		Xniper["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Xniper["c"]["Position"] = UDim2.new(0, 0, 0.8367342352867126, 0);

		Xniper["d"] = Instance.new("TextLabel", Xniper["a"]);
		Xniper["d"]["BorderSizePixel"] = 0;
		Xniper["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Xniper["d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		Xniper["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		Xniper["d"]["TextSize"] = 20;
		Xniper["d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		Xniper["d"]["Size"] = UDim2.new(0, 483,0, 38);
		Xniper["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Xniper["d"]["Text"] = options["Title"];
		Xniper["d"]["BackgroundTransparency"] = 1;
		Xniper["d"]["Position"] = UDim2.new(0.021864380687475204, 0, 0, 0);

		-- StarterGui.XniperLib.Main.TopBar.Exit
		Xniper["e"] = Instance.new("ImageButton", Xniper["a"]);
		Xniper["e"]["BorderSizePixel"] = 0;
		Xniper["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Xniper["e"]["Image"] = [[rbxassetid://10884453403]];
		Xniper["e"]["Size"] = UDim2.new(0, 17,0, 17);
		Xniper["e"]["HoverImage"] = [[rbxassetid://10884453403]];
		Xniper["e"]["Name"] = [[Exit]];
		Xniper["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Xniper["e"]["Position"] = UDim2.new(0.949999988079071, 0, 0.26899999380111694, 0);
		Xniper["e"]["BackgroundTransparency"] = 1;
		Xniper["e"].MouseButton1Down:Connect(function()
			Xniper["1"]:Destroy()
		end)

		-- StarterGui.XniperLib.Main.TopBar.Minimize
		Xniper["m"] = Instance.new("ImageButton", Xniper["a"]);
		Xniper["m"]["BorderSizePixel"] = 0;
		Xniper["m"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Xniper["m"]["Image"] = [[rbxassetid://15234010735]];
		Xniper["m"]["Size"] = UDim2.new(0, 17, 0, 17);
		Xniper["m"]["HoverImage"] = [[rbxassetid://15234010735]];
		Xniper["m"]["Name"] = [[Minimize]];
		Xniper["m"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Xniper["m"]["Position"] = UDim2.new(0.8999999761581421, 0, 0.26899999380111694, 0);
		Xniper["m"]["BackgroundTransparency"] = 1;
		Xniper["m"].MouseButton1Down:Connect(function()
			if minimized then
				minimized = false
				Xniper["2"]:TweenSize(UDim2.new(0, 501,0, 306), "InOut", "Linear", 0.1)
				Xniper["4"].Visible = true
				Xniper["f"].Visible = true
				Xniper["c"].Visible = true
			else
				minimized = true
				Xniper["2"]:TweenSize(UDim2.new(0, 492,0, 33), "InOut", "Linear", 0.1)
				Xniper["4"].Visible = false
				Xniper["f"].Visible = false
				Xniper["c"].Visible = false
			end
		end)

		Xniper["f"] = Instance.new("Frame", Xniper["2"]);
		Xniper["f"]["BorderSizePixel"] = 0;
		Xniper["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Xniper["f"]["BackgroundTransparency"] = 1;
		Xniper["f"]["Size"] = UDim2.new(0, 397, 0, 268);
		Xniper["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Xniper["f"]["Position"] = UDim2.new(0.20558907091617584, 0, 0.12418300658464432, 0);
		Xniper["f"]["Name"] = [[Container]];
	end

	-- DRAGIFY

	do
		function dragify()
			local Frame = Xniper["a"]
			local frame2 = Xniper["2"]

			dragToggle = nil
			dragSpeed = 0.15
			dragInput = nil
			dragStart = nil
			dragPos = nil
			function updateInput(input)
				Delta = input.Position - dragStart
				Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
				game:GetService("TweenService"):Create(frame2, TweenInfo.new(0.15), {Position = Position}):Play()
			end
			Frame.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and uis:GetFocusedTextBox() == nil then
					dragToggle = true
					dragStart = input.Position
					startPos = frame2.Position
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragToggle = false
						end
					end)
				end
			end)
			Frame.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					dragInput = input
				end
			end)
			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if input == dragInput and dragToggle then
					updateInput(input)
				end
			end)
		end
		dragify(Main)
	end

	do
		Xniper["4"] = Instance.new("Frame", Xniper["2"]);
		Xniper["4"]["BorderSizePixel"] = 0;
		Xniper["4"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
		Xniper["4"]["Size"] = UDim2.new(0, 100, 0, 269);
		Xniper["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Xniper["4"]["Position"] = UDim2.new(0, 0, 0.12091503292322159, 0);
		Xniper["4"]["Name"] = [[Tabs]];

		Xniper["5"] = Instance.new("UICorner", Xniper["4"]);
		Xniper["5"]["CornerRadius"] = UDim.new(0, 6);

		Xniper["6"] = Instance.new("UIPadding", Xniper["4"]);
		Xniper["6"]["PaddingTop"] = UDim.new(0.009999999776482582, 0);
		Xniper["6"]["PaddingLeft"] = UDim.new(0.15000000596046448, 0);

		Xniper["7"] = Instance.new("UIListLayout", Xniper["4"]);
		Xniper["7"]["Padding"] = UDim.new(0.009999999776482582, 0)
		Xniper["7"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
	end

	function Xniper:CreateTab(options)
		options = Xniper:validate({
			name = "Preview Tab"
		}, options or {})

		local Tab = {
			Hover = false,
			Active = false
		}

		do
			Tab["9"] = Instance.new("TextLabel", Xniper["4"]);
			Tab["9"]["TextWrapped"] = true;
			Tab["9"]["BorderSizePixel"] = 0;
			Tab["9"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
			Tab["9"]["TextSize"] = 22;
			Tab["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Tab["9"]["TextColor3"] = Color3.fromRGB(163, 163, 163);
			Tab["9"]["Size"] = UDim2.new(0, 74,0, 26);
			Tab["9"]["Name"] = [[InactiveTab]];
			Tab["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["9"]["Text"] = options.name;
			Tab["9"]["Position"] = UDim2.new(0.05999999865889549, 0, 0.14705882966518402, 0);
			Tab["9"]["BackgroundTransparency"] = 0;

			Tab["10"] = Instance.new("UICorner", Tab["9"]);
			Tab["10"]["CornerRadius"] = UDim.new(0,6)


			Tab["11"] = Instance.new("ScrollingFrame", Xniper["f"]);
			Tab["11"]["Active"] = true;
			Tab["11"]["BorderSizePixel"] = 0;
			Tab["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["11"]["BackgroundTransparency"] = 1;
			Tab["11"]["Size"] = UDim2.new(0, 397, 0, 268);
			Tab["11"]["CanvasSize"] = UDim2.new(0, 0, 10, 0)
			Tab["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["11"]["ScrollBarThickness"] = 6;
			Tab["11"]["Name"] = Tab["9"].Name;
			Tab["11"]["Visible"] = false;

			Tab["1b"] = Instance.new("UIListLayout", Tab["11"]);
			Tab["1b"]["Padding"] = UDim.new(0.009999999776482582, 0);
			Tab["1b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

			-- StarterGui.TabLib.Main.Container.Tab.UIPadding
			Tab["1c"] = Instance.new("UIPadding", Tab["11"]);
			Tab["1c"]["PaddingTop"] = UDim.new(0.009999999776482582, 0);
			Tab["1c"]["PaddingLeft"] = UDim.new(0.009999999776482582, 0);
		end

		function Tab:Activate()
			if not Tab.Active then
				if Xniper.CurrentTab ~= nil then
					Xniper.CurrentTab:Deactivate()	
				end

				Tab.Active = true
				Xniper:tween(Tab["9"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				Xniper:tween(Tab["9"], {BackgroundColor3 = Color3.fromRGB(71, 255, 83)})
				Tab["11"]["Visible"] = true

				Xniper.CurrentTab = Tab
			end
		end

		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false
				Xniper:tween(Tab["9"], {TextColor3 = Color3.fromRGB(162, 162, 162)})
				Xniper:tween(Tab["9"], {BackgroundColor3 = Color3.fromRGB(35, 35, 35)})
				Tab["11"]["Visible"] = false
			end
		end

		do
			Tab["9"].MouseEnter:Connect(function()
				Tab.Hover = true

				if not Tab.Active then
					Xniper:tween(Tab["9"], {TextColor3 = Color3.fromRGB(255,255,255)})
				end
			end)

			Tab["9"].MouseLeave:Connect(function()
				Tab.Hover = false
				if not Tab.Active then
					Xniper:tween(Tab["9"], {TextColor3 = Color3.fromRGB(162, 162, 162)})
				end
			end)

			uis.InputBegan:Connect(function(input, gpe)
				if gpe then return end

				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						Tab:Activate()
					end
				end
			end)

			if Xniper.CurrentTab == nil then
				Tab:Activate()
			end
		end

		function Tab:Button(options, value)
			options = Xniper:validate({
				name = "Button",
				callback = function() end
			}, options or {})

			local Button = {
				Hover = false,
				MouseDown = false
			}

			-- render

			do
				Button["ffc"] = Instance.new("Frame", Tab["11"]);
				Button["ffc"]["Active"] = false;
				Button["ffc"]["BorderSizePixel"] = 0;
				Button["ffc"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
				Button["ffc"]["Selectable"] = false;
				Button["ffc"]["Size"] = UDim2.new(0, 382, 0, 38);
				Button["ffc"]["Name"] = [[Button]];
				Button["ffc"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["ffc"]["Position"] = UDim2.new(0.013000027276575565, 0, 0.012582123279571533, 0);

				-- StarterGui.ButtonLib.Main.Container.Tab.Button.UICorner
				Button["12"] = Instance.new("UICorner", Button["ffc"]);
				Button["12"]["CornerRadius"] = UDim.new(0, 5);

				-- StarterGui.ButtonLib.Main.Container.Tab.Button.UIStroke
				Button["13"] = Instance.new("UIStroke", Button["ffc"]);
				Button["13"]["Color"] = Color3.fromRGB(148, 148, 148);
				Button["13"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.ButtonLib.Main.Container.Tab.Button.Title
				Button["14"] = Instance.new("TextLabel", Button["ffc"]);
				Button["14"]["TextWrapped"] = true;
				Button["14"]["BorderSizePixel"] = 0;
				Button["14"]["TextScaled"] = true;
				Button["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["14"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Button["14"]["TextSize"] = 20;
				Button["14"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Button["14"]["Size"] = UDim2.new(0, 200, 0, 19);
				Button["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["14"]["Text"] = options.name;
				Button["14"]["Name"] = [[Title]];
				Button["14"]["BackgroundTransparency"] = 1;
				Button["14"]["Position"] = UDim2.new(0.015706807374954224, 0, 0.25, 0);

				-- StarterGui.ButtonLib.Main.Container.Tab.Button.Icon
				Button["15"] = Instance.new("ImageLabel", Button["ffc"]);
				Button["15"]["BorderSizePixel"] = 0;
				Button["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["15"]["Image"] = [[rbxassetid://13126579577]];
				Button["15"]["Size"] = UDim2.new(0, 27, 0, 29);
				Button["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["15"]["Name"] = [[Icon]];
				Button["15"]["BackgroundTransparency"] = 1;
				Button["15"]["Position"] = UDim2.new(0.9136125445365906, 0, 0.10526315867900848, 0);
			end

			-- logic

			do
				Button["ffc"].MouseEnter:Connect(function()
					Button.Hover = true

					Xniper:tween(Button["13"], {Color = Color3.fromRGB(59, 59, 59)})
					Xniper:tween(Button["ffc"], {BackgroundColor3 = Color3.fromRGB(45,45,45)})
				end)

				Button["ffc"].MouseLeave:Connect(function()
					Button.Hover = false

					if not Button.MouseDown then
						Xniper:tween(Button["13"], {Color = Color3.fromRGB(148, 148, 148)})
						Xniper:tween(Button["ffc"], {BackgroundColor3 = Color3.fromRGB(35,35,35)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then			
						Button.MouseDown = true
						Xniper:tween(Button["ffc"], {BackgroundColor3 = Color3.fromRGB(55,55,55)})
						options.callback()
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false

						if Button.Hover then
							Xniper:tween(Button["ffc"], {BackgroundColor3 = Color3.fromRGB(45,45,45)})
						else
							Xniper:tween(Button["ffc"], {BackgroundColor3 = Color3.fromRGB(35,35,35)})
						end
					end
				end)
			end

			return Button
		end

		function Tab:Label(options)
			options = Xniper:validate({
				name = "Label"
			}, options or {})

			local Label = {
				Hover = false,
				MouseDown = false
			}
			-- render

			do 
				-- StarterGui.TabLib.Main.Container.Tab.Label
				Tab["16"] = Instance.new("Frame", Tab["11"]);
				Tab["16"]["BorderSizePixel"] = 0;
				Tab["16"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
				Tab["16"]["Size"] = UDim2.new(0, 382, 0, 38);
				Tab["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Tab["16"]["Position"] = UDim2.new(0.013000000268220901, 0, 0.0949999988079071, 0);
				Tab["16"]["Name"] = [[Label]];

				-- StarterGui.TabLib.Main.Container.Tab.Label.UICorner
				Tab["17"] = Instance.new("UICorner", Tab["16"]);
				Tab["17"]["CornerRadius"] = UDim.new(0, 5);

				-- StarterGui.TabLib.Main.Container.Tab.Label.UIStroke
				Tab["18"] = Instance.new("UIStroke", Tab["16"]);
				Tab["18"]["Color"] = Color3.fromRGB(148, 148, 148);
				Tab["18"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.TabLib.Main.Container.Tab.Label.Title
				Tab["19"] = Instance.new("TextLabel", Tab["16"]);
				Tab["19"]["TextWrapped"] = true;
				Tab["19"]["BorderSizePixel"] = 0;
				Tab["19"]["TextScaled"] = true;
				Tab["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Tab["19"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Tab["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Tab["19"]["TextSize"] = 20;
				Tab["19"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Tab["19"]["Size"] = UDim2.new(0, 200, 0, 19);
				Tab["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Tab["19"]["Text"] = options.name;
				Tab["19"]["Name"] = [[Title]];
				Tab["19"]["BackgroundTransparency"] = 1;
				Tab["19"]["Position"] = UDim2.new(0.015706807374954224, 0, 0.25, 0);

				-- StarterGui.TabLib.Main.Container.Tab.Label.Icon
				Tab["1a"] = Instance.new("ImageLabel", Tab["16"]);
				Tab["1a"]["BorderSizePixel"] = 0;
				Tab["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Tab["1a"]["Image"] = [[rbxassetid://13942628140]];
				Tab["1a"]["Size"] = UDim2.new(0, 27, 0, 29);
				Tab["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Tab["1a"]["Name"] = [[Icon]];
				Tab["1a"]["BackgroundTransparency"] = 1;
				Tab["1a"]["Position"] = UDim2.new(0.9136125445365906, 0, 0.10526315867900848, 0);
			end

			-- method 

			do

				Tab["16"].MouseEnter:Connect(function()
					Label.Hover = true

					Xniper:tween(Tab["18"], {Color = Color3.fromRGB(59, 59, 59)})
				end)

				Tab["16"].MouseLeave:Connect(function()
					Label.Hover = false

					if not Label.MouseDown then
						Xniper:tween(Tab["18"], {Color = Color3.fromRGB(148, 148, 148)})
					end
				end)
			end
		end

		function Tab:Toggle(options)
			options = Xniper:validate({
				name = "Toggle",
				callback = function() end
			}, options or {})

			local Toggle = {
				Hover = false,
				MouseDown = false,
				State = false
			}

			-- Render
			do
				Toggle["3b"] = Instance.new("Frame", Tab["11"]);
				Toggle["3b"]["BorderSizePixel"] = 0;
				Toggle["3b"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
				Toggle["3b"]["Size"] = UDim2.new(0, 382, 0, 38);
				Toggle["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["3b"]["Position"] = UDim2.new(0.013000000268220901, 0, 0.0949999988079071, 0);
				Toggle["3b"]["Name"] = [[ToggleInactive]];

				Toggle["3c"] = Instance.new("UICorner", Toggle["3b"]);
				Toggle["3c"]["CornerRadius"] = UDim.new(0, 5);

				-- StarterGui.ToggleLib.Main.Container.Tab.ToggleInactive.UIStroke
				Toggle["3d"] = Instance.new("UIStroke", Toggle["3b"]);
				Toggle["3d"]["Color"] = Color3.fromRGB(148, 148, 148);
				Toggle["3d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.ToggleLib.Main.Container.Tab.ToggleInactive.Title
				Toggle["3e"] = Instance.new("TextLabel", Toggle["3b"]);
				Toggle["3e"]["TextWrapped"] = true;
				Toggle["3e"]["BorderSizePixel"] = 0;
				Toggle["3e"]["TextScaled"] = true;
				Toggle["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["3e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["3e"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Toggle["3e"]["TextSize"] = 20;
				Toggle["3e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["3e"]["Size"] = UDim2.new(0, 200, 0, 19);
				Toggle["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["3e"]["Text"] = options.name;
				Toggle["3e"]["Name"] = [[Title]];
				Toggle["3e"]["BackgroundTransparency"] = 1;
				Toggle["3e"]["Position"] = UDim2.new(0.015706807374954224, 0, 0.25, 0);

				-- StarterGui.ToggleLib.Main.Container.Tab.ToggleInactive.Icon
				Toggle["3f"] = Instance.new("Frame", Toggle["3b"]);
				Toggle["3f"]["BorderSizePixel"] = 0;
				Toggle["3f"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
				Toggle["3f"]["Size"] = UDim2.new(0, 29, 0, 29);
				Toggle["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["3f"]["Position"] = UDim2.new(0.908376932144165, 0, 0.10526315867900848, 0);
				Toggle["3f"]["Name"] = [[Icon]];

				-- StarterGui.ToggleLib.Main.Container.Tab.ToggleInactive.Icon.UICorner
				Toggle["40"] = Instance.new("UICorner", Toggle["3f"]);
				Toggle["40"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.ToggleLib.Main.Container.Tab.ToggleActive
				Toggle["41"] = Instance.new("Frame", Toggle["10"]);
				Toggle["41"]["BorderSizePixel"] = 0;
				Toggle["41"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
				Toggle["41"]["Size"] = UDim2.new(0, 382, 0, 38);
				Toggle["41"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["41"]["Position"] = UDim2.new(0.013000000268220901, 0, 0.0949999988079071, 0);
				Toggle["41"]["Name"] = [[ToggleActive]];
			end

			-- Methods
			do
				function Toggle:Activate(bool)
					if bool == nil then
						Toggle.State = not Toggle.State
					else
						Toggle.State = bool
					end

					if Toggle.State then
						Xniper:tween(Toggle["3f"], {BackgroundColor3 = Color3.fromRGB(106, 255, 103)})
					else
						Xniper:tween(Toggle["3f"], {BackgroundColor3 = Color3.fromRGB(51, 51, 51)})
					end

					options.callback(Toggle.State)
				end
			end

			-- logic

			do
				Toggle["3b"].MouseEnter:Connect(function()
					Toggle.Hover = true

					Xniper:tween(Toggle["3d"], {Color = Color3.fromRGB(59, 59, 59)})
				end)

				Toggle["3b"].MouseLeave:Connect(function()
					Toggle.Hover = false

					if not Toggle.MouseDown then
						Xniper:tween(Toggle["3d"], {Color = Color3.fromRGB(148, 148, 148)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then			
						Toggle.MouseDown = true
						Xniper:tween(Toggle["3d"], {Color = Color3.fromRGB(65,65,65)})
						Toggle:Activate()
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Toggle.MouseDown = false

						if Toggle.Hover then
							Xniper:tween(Toggle["3d"], {Color = Color3.fromRGB(59, 59, 59)})
						else
							Xniper:tween(Toggle["3d"], {Color = Color3.fromRGB(148, 148, 148)})
						end
					end
				end)
			end

		end

		function Tab:Slider(options)
			options = Xniper:validate({
				name = "Slider",
				min = 0,
				max = 100,
				default = 50,
				callback = function() end
			}, options or {})


			local Slider = {
				MouseDown = false,
				HoverSlider = false,
				Connection = nil,
				Options = options
			}

			--Render

			do 
				-- StarterGui.TabLib.Main.Container.Tab.Slider
				Slider[options.name] = Instance.new("Frame", Tab["11"]);
				Slider[options.name]["BorderSizePixel"] = 0;
				Slider[options.name]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
				Slider[options.name]["Size"] = UDim2.new(0, 382, 0, 54);
				Slider[options.name]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider[options.name]["Position"] = UDim2.new(0.009999926201999187, 0, 0.3431819975376129, 0);
				Slider[options.name]["Name"] = options.name;

				-- StarterGui.TabLib.Main.Container.Tab.Slider.UICorner
				Tab["1e"] = Instance.new("UICorner", Slider[options.name]);
				Tab["1e"]["CornerRadius"] = UDim.new(0, 5);

				-- StarterGui.TabLib.Main.Container.Tab.Slider.UIStroke
				Tab["1f"] = Instance.new("UIStroke", Slider[options.name]);
				Tab["1f"]["Color"] = Color3.fromRGB(148, 148, 148);
				Tab["1f"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.TabLib.Main.Container.Tab.Slider.Title
				Tab["20"] = Instance.new("TextLabel", Slider[options.name]);
				Tab["20"]["TextWrapped"] = true;
				Tab["20"]["BorderSizePixel"] = 0;
				Tab["20"]["TextScaled"] = true;
				Tab["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Tab["20"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Tab["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Tab["20"]["TextSize"] = 20;
				Tab["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Tab["20"]["Size"] = UDim2.new(0, 72, 0, 19);
				Tab["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Tab["20"]["Text"] = options.name;
				Tab["20"]["Name"] = [[Title]];
				Tab["20"]["BackgroundTransparency"] = 1;
				Tab["20"]["Position"] = UDim2.new(0.015706805512309074, 0, 0.09375, 0);

				-- StarterGui.TabLib.Main.Container.Tab.Slider.Icon
				Tab["21"] = Instance.new("ImageLabel", Slider[options.name]);
				Tab["21"]["BorderSizePixel"] = 0;
				Tab["21"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Tab["21"]["Image"] = [[rbxassetid://13133193733]];
				Tab["21"]["Size"] = UDim2.new(0, 27, 0, 29);
				Tab["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Tab["21"]["Name"] = [[Icon]];
				Tab["21"]["BackgroundTransparency"] = 1;
				Tab["21"]["Position"] = UDim2.new(0.9136125445365906, 0, -0.004111841320991516, 0);

				-- StarterGui.TabLib.Main.Container.Tab.Slider.SliderIns
				Tab["22"] = Instance.new("Frame", Slider[options.name]);
				Tab["22"]["BorderSizePixel"] = 0;
				Tab["22"]["BackgroundColor3"] = Color3.fromRGB(61, 61, 61);
				Tab["22"]["Size"] = UDim2.new(0, 370, 0, 18);
				Tab["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Tab["22"]["Position"] = UDim2.new(0.015706805512309074, 0, 0.5329250693321228, 0);
				Tab["22"]["Name"] = [[SliderIns]];

				-- StarterGui.TabLib.Main.Container.Tab.Slider.SliderIns.UICorner
				Tab["23"] = Instance.new("UICorner", Tab["22"]);
				Tab["23"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.TabLib.Main.Container.Tab.Slider.SliderIns.Dragger
				Tab["24"] = Instance.new("Frame", Tab["22"]);
				Tab["24"]["BorderSizePixel"] = 0;
				Tab["24"]["BackgroundColor3"] = Color3.fromRGB(46, 46, 46);
				Tab["24"]["Size"] = UDim2.new(0, 72, 0, 18);
				--Tab["24"]["Text"] = "";
				Tab["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Tab["24"]["Name"] = [[Dragger]];

				-- StarterGui.TabLib.Main.Container.Tab.Slider.SliderIns.Dragger.UICorner
				Tab["25"] = Instance.new("UICorner", Tab["24"]);
				Tab["25"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.TabLib.Main.Container.Tab.Slider.Value
				Tab["26"] = Instance.new("TextLabel", Slider[options.name]);
				Tab["26"]["TextWrapped"] = true;
				Tab["26"]["BorderSizePixel"] = 0;
				Tab["26"]["TextScaled"] = true;
				Tab["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Tab["26"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Tab["26"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Tab["26"]["TextSize"] = 20;
				Tab["26"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Tab["26"]["Size"] = UDim2.new(0, 27, 0, 19);
				Tab["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Tab["26"]["Text"] = tostring(options.default);
				Tab["26"]["Name"] = [[Value]];
				Tab["26"]["BackgroundTransparency"] = 1;
				Tab["26"]["Position"] = UDim2.new(0.4397905766963959, 0, 0.09375, 0);
			end


			-- Methods
			local value;
			function Slider:SetValue(v)
				if v == nil then
					local percentage = math.clamp((mouse.X - Tab["22"].AbsolutePosition.X) / (Tab["22"].AbsoluteSize.X), 0, 1)
					local value = math.floor(((options.max - options.min) * percentage) + options.min)

					Tab["26"].Text = tostring(value)
					Tab["24"].Size = UDim2.fromScale(percentage, 1)

				else
					Tab["20"].Text = tostring(v)
					Tab["24"].Size = UDim2.fromScale(((v - options.min) / (options.max - options.min)), 1)
				end
				options.callback(Slider:GetValue())
			end

			function Slider:GetValue()
				return tonumber(Tab["26"].Text)
			end


			--Logic
			do
				Slider[options.name].MouseEnter:Connect(function()
					Slider.HoverSlider = true

					Xniper:tween(Tab["1f"], {Color = Color3.fromRGB(59, 59, 59)})
					Xniper:tween(Slider[options.name], {BackgroundColor3 = Color3.fromRGB(45,45,45)})
				end)

				Slider[options.name].MouseLeave:Connect(function()
					Slider.HoverSlider = false

					if not Slider.MouseDown then
						Xniper:tween(Tab["1f"], {Color = Color3.fromRGB(148, 148, 148)})
						Xniper:tween(Slider[options.name], {BackgroundColor3 = Color3.fromRGB(45,45,45)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.HoverSlider then			
						Slider.MouseDown = true
						Xniper:tween(Tab["24"], {BackgroundColor3 = Color3.fromRGB(55,55,55)})

						if not Slider.Connection then
							Slider.Connection = runService.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.MouseDown = false

						if Slider.HoverSlider then
							Xniper:tween(Tab["24"], {BackgroundColor3 = Color3.fromRGB(40, 40, 40)})
						else
							Xniper:tween(Tab["24"], {BackgroundColor3 = Color3.fromRGB(40, 40, 40)})
						end

						if Slider.Connection then Slider.Connection:Disconnect() end
						Slider.Connection = nil
					end
				end)

			end
		end

		function Xniper:Notify(options)
			options = Xniper:validate({
				text = "Notification",
				duration = 7
			}, options or {})

			local Notify = {}

			-- Render
			do
				Notify["4f"] = Instance.new("Frame", Xniper["1"]);
				Notify["4f"]["BorderSizePixel"] = 0;
				Notify["4f"]["BackgroundColor3"] = Color3.fromRGB(52, 52, 52);
				Notify["4f"]["Size"] = UDim2.new(0.15298260748386383, 0, 0.08526315540075302, 0);
				Notify["4f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Notify["4f"]["Position"] = UDim2.new(0.8299999833106995, 0, 0.8500000238418579, 0);
				Notify["4f"]["Name"] = [[NotificationFrame]];

				Notify["50"] = Instance.new("UICorner", Notify["4f"]);
				Notify["50"]["CornerRadius"] = UDim.new(0, 4);

				Notify["51"] = Instance.new("TextLabel", Notify["4f"]);
				Notify["51"]["TextWrapped"] = true;
				Notify["51"]["BorderSizePixel"] = 0;
				Notify["51"]["TextScaled"] = true;
				Notify["51"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Notify["51"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Notify["51"]["TextSize"] = 14;
				Notify["51"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Notify["51"]["Size"] = UDim2.new(0, 229, 0, 30);
				Notify["51"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Notify["51"]["Text"] = [[Notification]];
				Notify["51"]["Name"] = [[Title]];
				Notify["51"]["BackgroundTransparency"] = 1;

				Notify["52"] = Instance.new("TextLabel", Notify["4f"]);
				Notify["52"]["TextWrapped"] = true;
				Notify["52"]["BorderSizePixel"] = 0;
				Notify["52"]["RichText"] = true;
				Notify["52"]["TextScaled"] = true;
				Notify["52"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Notify["52"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Notify["52"]["TextSize"] = 25;
				Notify["52"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Notify["52"]["Size"] = UDim2.new(0, 229, 0, 36);
				Notify["52"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Notify["52"]["Text"] = options.text;
				Notify["52"]["Name"] = [[Text]];
				Notify["52"]["BackgroundTransparency"] = 1;
				Notify["52"]["Position"] = UDim2.new(0, 0, 0.45679011940956116, 0);

				Notify["53"] = Instance.new("UIStroke", Notify["4f"]);
				Notify["53"]["Thickness"] = 1.2000000476837158;
			end

			-- Logic

			do
				local duration = options.duration

				task.wait(tonumber(duration))
				Notify["4f"]:Destroy()
			end
		end

		return Tab
	end
	return Xniper
end
return Xniper
