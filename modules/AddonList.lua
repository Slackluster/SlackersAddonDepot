---------------------------------------
-- Slacker's Addon Depot: AddonList.lua
---------------------------------------

local appName, app = ...
local L = app.locales

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		app:CreateAddonList()
		app:HookGameMenu()
	end
end)

----------------
-- ADDON LIST --
----------------

function app:CreateAddonList()
	app.AddonListFrame = CreateFrame("Frame", nil, UIParent, "DefaultPanelTemplate")
	app.AddonListFrame:SetSize(600, 600)
	app.AddonListFrame:SetPoint("CENTER", UIParent)
	--app.AddonListFrame:SetFrameStrata("DIALOG")
	app.AddonListFrame:EnableMouse(true)
	app.AddonListFrame:SetMovable(true)
	app.AddonListFrame:RegisterForDrag("LeftButton")
	app.AddonListFrame:SetClampedToScreen(true)
	local inset = 300
	app.AddonListFrame:SetClampRectInsets(app.AddonListFrame:GetWidth()-inset, -(app.AddonListFrame:GetWidth()-inset), -(app.AddonListFrame:GetHeight()-inset), app.AddonListFrame:GetHeight()-inset)
	app.AddonListFrame:Hide()

	app.AddonListFrame:SetScript("OnShow", function()
		app:UpdateAddonList()
	end)
	app.AddonListFrame:SetScript("OnMouseDown", function()
		app.AddonListFrame:SetToplevel(true)
	end)
	app.AddonListFrame:SetScript("OnDragStart", function()
		app.AddonListFrame:StartMoving()
	end)
	app.AddonListFrame:SetScript("OnDragStop", function()
		app.AddonListFrame:StopMovingOrSizing()
	end)

	app.AddonListFrame.TitleContainer.TitleText:SetText(app.NameLong)
	app.AddonListFrame.CloseButton = CreateFrame("Button", nil, app.AddonListFrame, "UIPanelCloseButton")
	app.AddonListFrame.CloseButton:SetPoint("TOPRIGHT", app.AddonListFrame)
	app.AddonListFrame.CloseButton:SetScript("OnClick", function()
		app.AddonListFrame:Hide()
	end)

	app.AddonListFrame.List = CreateFrame("Frame", nil, app.AddonListFrame, "InsetFrameTemplate")
	app.AddonListFrame.List:SetPoint("TOPLEFT", app.AddonListFrame, 10, -50)
	app.AddonListFrame.List:SetPoint("BOTTOMRIGHT", app.AddonListFrame, -6, 28)
	app.AddonListFrame.List.Background = app.AddonListFrame.List:CreateTexture(nil, "BACKGROUND")
	app.AddonListFrame.List.Background:SetAllPoints()
	app.AddonListFrame.List.Background:SetAtlas("CreditsScreen-Background-2")

	local scrollBox = CreateFrame("Frame", nil, app.AddonListFrame.List, "WowScrollBoxList")
	scrollBox:SetPoint("TOPLEFT", app.AddonListFrame.List, 2, -6)
	scrollBox:SetPoint("BOTTOMRIGHT", app.AddonListFrame.List, -18, 4)
	scrollBox:EnableMouse(true)
	scrollBox:RegisterForDrag("LeftButton")
	scrollBox:SetScript("OnDragStart", function() app.AddonListFrame:StartMoving() end)
	scrollBox:SetScript("OnDragStop", function() app.AddonListFrame:StopMovingOrSizing() end)

	local scrollBar = CreateFrame("EventFrame", nil, app.AddonListFrame.List, "MinimalScrollBar")
	scrollBar:SetPoint("TOPLEFT", scrollBox, "TOPRIGHT")
	scrollBar:SetPoint("BOTTOMLEFT", scrollBox, "BOTTOMRIGHT")

	app.AddonList = CreateScrollBoxListTreeListView()
	ScrollUtil.InitScrollBoxListWithScrollBar(scrollBox, scrollBar, app.AddonList)

	local function Initializer(listItem, node)
		local data = node:GetData()

		if data.iconTexture then
			listItem.LeftText1:SetText(CreateSimpleTextureMarkup(data.iconTexture, 18, 18))
		elseif data.iconAtlas then
			listItem.LeftText1:SetText(CreateAtlasMarkup(data.iconAtlas, 18, 18))
		end
		listItem.LeftText2:SetText(data.title)
		listItem.LeftText2:SetFont("Fonts\\FRIZQT__.TTF", 14)

		-- node:ToggleCollapsed()
		-- Watchtower_Flags[data.groupID].collapsed = node:IsCollapsed()
		-- app:UpdateStatusList()

		listItem:EnableMouse(true)
		listItem:RegisterForDrag("LeftButton")
		listItem:SetScript("OnDragStart", function() app.AddonListFrame:StartMoving() end)
		listItem:SetScript("OnDragStop", function() app.AddonListFrame:StopMovingOrSizing() end)
		-- listItem:SetScript("OnEnter", function(self)
		-- end)
		-- listItem:SetScript("OnLeave", function(self)
		-- end)
		-- listItem:SetScript("OnClick", function(self)
		-- end)
	end

	app.AddonList:SetElementInitializer("SlackersAddonDepot_ListButton", Initializer)

	app.AddonListFrame:SetFlattensRenderLayers(true)
end

function app:UpdateAddonList()
	local DataProvider = CreateTreeDataProvider()

	for i = 1, C_AddOns.GetNumAddOns() do
		DataProvider:Insert({ iconTexture = C_AddOns.GetAddOnMetadata(i, "IconTexture"), iconAtlas = C_AddOns.GetAddOnMetadata(i, "IconAtlas"), title = C_AddOns.GetAddOnTitle(i) })
	end

	app.AddonList:SetDataProvider(DataProvider, true)
end

--------------------
-- GAME MENU HOOK --
--------------------

function app:HookGameMenu()
	GameMenuFrame:HookScript("OnShow", function()
		for button in GameMenuFrame.buttonPool:EnumerateActive() do
			if button:GetText() == ADDONS then
				button:SetScript("OnClick", function()
					HideUIPanel(GameMenuFrame)
					app.AddonListFrame:Show()
				end)
				break
			end
		end
	end)
end
