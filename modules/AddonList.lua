---------------------------------------
-- Slacker's Addon Depot: AddonList.lua
---------------------------------------

local appName, app = ...
local api = app.api
local L = app.locales

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		app:CreateAddonList()
		app:HookGameMenu()

		if not app.Settings["headerStyle"] then app.Settings["headerStyle"] = 1 end

		app.Flag.Changed = {}
		app.Flag.Search = ""
	end
end)

----------------
-- ADDON LIST --
----------------

function app:CreateAddonList()
	app.AddonListFrame = CreateFrame("Frame", nil, UIParent, "DefaultPanelTemplate")
	app.AddonListFrame:SetSize(600, 600)
	app.AddonListFrame:SetPoint("CENTER", UIParent)
	app.AddonListFrame:EnableMouse(true)
	app.AddonListFrame:SetMovable(true)
	app.AddonListFrame:RegisterForDrag("LeftButton")
	app.AddonListFrame:SetClampedToScreen(true)
	local inset = 300
	app.AddonListFrame:SetClampRectInsets(app.AddonListFrame:GetWidth()-inset, -(app.AddonListFrame:GetWidth()-inset), -(app.AddonListFrame:GetHeight()-inset), app.AddonListFrame:GetHeight()-inset)
	app.AddonListFrame:Hide()

	app.AddonListFrame:SetScript("OnShow", function()
		if app.Flag.SelectedCharacter == L.ALL then
			app.AddonListFrame.CharListDropdown:SetDefaultText(L.ALL)
		else
			app.AddonListFrame.CharListDropdown:SetDefaultText("|c" .. app.Cache.Characters[app.Flag.SelectedCharacter].classColor .. app.Cache.Characters[app.Flag.SelectedCharacter].name .. "-" .. app.Cache.Characters[app.Flag.SelectedCharacter].realmNorm)
		end

		app:UpdateAddonList()
		app.AddonListFrame.ReloadButton:Disable()
	end)
	app.AddonListFrame:SetScript("OnHide", function()
		app.Flag.Changed = {}
		app:GetAddonInfo()
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

	app.AddonListFrame.SettingsButton = CreateFrame("Button", nil, app.AddonListFrame, "UIPanelCloseButton")
	app.AddonListFrame.SettingsButton:SetPoint("TOPRIGHT", app.AddonListFrame.CloseButton, "TOPLEFT", -2, 0)
	app.AddonListFrame.SettingsButton:SetNormalTexture("Interface\\AddOns\\SlackersAddonDepot\\assets\\buttons.blp")
	app.AddonListFrame.SettingsButton:GetNormalTexture():SetTexCoord(112/256, 148/256, 1/128, 39/128)
	app.AddonListFrame.SettingsButton:SetDisabledTexture("Interface\\AddOns\\SlackersAddonDepot\\assets\\buttons.blp")
	app.AddonListFrame.SettingsButton:GetDisabledTexture():SetTexCoord(112/256, 148/256, 41/128, 79/128)
	app.AddonListFrame.SettingsButton:SetPushedTexture("Interface\\AddOns\\SlackersAddonDepot\\assets\\buttons.blp")
	app.AddonListFrame.SettingsButton:GetPushedTexture():SetTexCoord(112/256, 148/256, 81/128, 119/128)
	app.AddonListFrame.SettingsButton:SetScript("OnClick", function()
		app:OpenSettings()
	end)
	app.AddonListFrame.SettingsButton:SetScript("OnEnter", function(self)
		GameTooltip:ClearLines()
		GameTooltip:SetOwner(self)
		GameTooltip:AddLine(L.SLASH_OPEN_SETTINGS)
		GameTooltip:Show()
	end)
	app.AddonListFrame.SettingsButton:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)

	app.AddonListFrame.List = CreateFrame("Frame", nil, app.AddonListFrame, "InsetFrameTemplate")
	app.AddonListFrame.List:SetPoint("TOPLEFT", app.AddonListFrame, 10, -54)
	app.AddonListFrame.List:SetPoint("BOTTOMRIGHT", app.AddonListFrame, -6, 34)
	app.AddonListFrame.List.Background = app.AddonListFrame.List:CreateTexture(nil, "BACKGROUND")
	app.AddonListFrame.List.Background:SetAllPoints()
	app.AddonListFrame.List.Background:SetAtlas("CreditsScreen-Background-2")

	function generatorFunctionCharList(owner, rootDescription)
		local classSortOrder = {
			["MAGE"] = 1,
			["PRIEST"] = 2,
			["WARLOCK"] = 3,
			["DEMONHUNTER"] = 4,
			["DRUID"] = 5,
			["MONK"] = 6,
			["ROGUE"] = 7,
			["EVOKER"] = 8,
			["HUNTER"] = 9,
			["SHAMAN"] = 10,
			["DEATHKNIGHT"] = 11,
			["PALADIN"] = 12,
			["WARRIOR"] = 13,
		}

		local function sortChars(tableName)
			if app.Settings["charListSort"] == 1 then
				table.sort(tableName, function(a, b)
					if a.name == b.name then
						return (a.realmNorm) < (b.realmNorm)
					end
					return a.name < b.name
				end)
			elseif app.Settings["charListSort"] == 2 then
				table.sort(tableName, function(a, b)
					local class1 = classSortOrder[a.class] or 999
					local class2 = classSortOrder[b.class] or 999
					if class1 ~= class2 then
						return class1 < class2
					end
					if a.name ~= b.name then
						return a.name < b.name
					end
            	return (a.realmNorm) < (b.realmNorm)
				end)
			end
		end

		local function addChars(table, realmSuffix)
			for _, char in ipairs(table) do
				local label
				if realmSuffix then
					label = "|c" .. char.classColor .. char.name .. "-" .. char.realmNorm
				else
					label = "|c" .. char.classColor .. char.name
				end
				rootDescription:CreateButton(label, function(data)
					owner:SetDefaultText("|c" .. char.classColor .. char.name .. "-" .. char.realmNorm)
					app.Flag.SelectedCharacter = char.guid
					app:UpdateAddonList()
				end)
			end
		end

		rootDescription:SetGridMode(MenuConstants.VerticalGridDirection)
		rootDescription:CreateButton(L.ALL, function(data)
			owner:SetDefaultText(L.ALL)
			app.Flag.SelectedCharacter = L.ALL
			app:UpdateAddonList()
		end)

		if app.Settings["charListRealm"] then
			local realms = {}
			local seen = {}
			for _, char in pairs(app.Cache.Characters) do
				if not seen[char.realm] then
					table.insert(realms, { realm = char.realm, characters = {} })
					seen[char.realm] = true
				end
				for _, realm in ipairs(realms) do
					if realm.realm == char.realm then
						table.insert(realm.characters, char)
					end
				end

			end
			table.sort(realms, function(a, b) return a.realm < b.realm end)

			for _, realm in ipairs(realms) do
				sortChars(realm.characters)
				rootDescription:CreateTitle(realm.realm)
				addChars(realm.characters)
			end
		else
			local characters = {}
			for _, char in pairs(app.Cache.Characters) do
				table.insert(characters, char)
			end
			sortChars(characters)
			addChars(characters, true)
		end
	end
	app.AddonListFrame.CharListDropdown = CreateFrame("DropdownButton", nil, app.AddonListFrame, "WowStyle1DropdownTemplate")
	app.AddonListFrame.CharListDropdown:SetWidth(200)
	app.AddonListFrame.CharListDropdown:SetPoint("TOPLEFT", 11, -26)
	app.AddonListFrame.CharListDropdown:SetupMenu(generatorFunctionCharList)
	app:SetBorder(app.AddonListFrame.CharListDropdown, -1, 1, 1, 0)
	app.Flag.SelectedCharacter = app.Info.GUID

	function generatorFunctionListStyle(owner, rootDescription)
		rootDescription:CreateButton(L.LISTSTYLE_CATEGORIES, function(data)
			app.Settings["headerStyle"] = 1
			owner:SetDefaultText(L.LISTSTYLE_CATEGORIES)
			app:UpdateAddonList()
		end)
		rootDescription:CreateButton(L.LISTSTYLE_ENABLESTATE, function(data)
			app.Settings["headerStyle"] = 2
			owner:SetDefaultText(L.LISTSTYLE_ENABLESTATE)
			app:UpdateAddonList()
		end)
	end
	app.AddonListFrame.ListStyleDropdown = CreateFrame("DropdownButton", nil, app.AddonListFrame, "WowStyle1DropdownTemplate")
	if app.Settings["headerStyle"] == 1 then
		app.AddonListFrame.ListStyleDropdown:SetDefaultText(L.LISTSTYLE_CATEGORIES)
	elseif app.Settings["headerStyle"] == 2 then
		app.AddonListFrame.ListStyleDropdown:SetDefaultText(L.LISTSTYLE_ENABLESTATE)
	end
	app.AddonListFrame.ListStyleDropdown:SetWidth(120)
	app.AddonListFrame.ListStyleDropdown:SetPoint("TOPRIGHT", -7, -26)
	app.AddonListFrame.ListStyleDropdown:SetupMenu(generatorFunctionListStyle)
	app:SetBorder(app.AddonListFrame.ListStyleDropdown, -2, 1, 1, 0)

	app.AddonListFrame.SearchBar = CreateFrame("EditBox", nil, app.AddonListFrame, "SearchBoxTemplate")
	app.AddonListFrame.SearchBar:SetSize(160, 20)
	app.AddonListFrame.SearchBar:SetPoint("RIGHT", app.AddonListFrame.ListStyleDropdown, "LEFT", -6, 0)
	app.AddonListFrame.SearchBar:SetAutoFocus(false)
	app.AddonListFrame.SearchBar:SetCursorPosition(0)
	app.AddonListFrame.SearchBar:SetScript("OnEditFocusGained", function(self)
		self.Instructions:SetText("")
	end)
	app.AddonListFrame.SearchBar:SetScript("OnEditFocusLost", function(self)
		if self:GetText() == "" then
			self.Instructions:SetText(self.instructionText)
		end
	end)
	app.AddonListFrame.SearchBar:SetScript("OnTextChanged", function(self)
		app.Flag.Search = self:GetText()
		app.UpdateAddonList()
	end)
	app.AddonListFrame.SearchBar:SetScript("OnEnterPressed", function(self)
		self:ClearFocus()
	end)
	app.AddonListFrame.SearchBar:SetScript("OnEscapePressed", function(self)
		self:SetText("")
		self:ClearFocus()
	end)
	app:SetBorder(app.AddonListFrame.SearchBar, -7, 1, 2, -2)

	app.AddonListFrame.CancelButton = app:MakeButton(app.AddonListFrame, L.CANCEL)
	app.AddonListFrame.CancelButton:SetPoint("BOTTOMRIGHT", app.AddonListFrame, -10, 8)
	app.AddonListFrame.CancelButton:SetScript("OnClick", function()
		app.AddonListFrame:Hide()
	end)

	app.AddonListFrame.ReloadButton = app:MakeButton(app.AddonListFrame, L.RELOAD)
	app.AddonListFrame.ReloadButton:SetPoint("RIGHT", app.AddonListFrame.CancelButton, "LEFT", -2, 0)
	app.AddonListFrame.ReloadButton:SetScript("OnClick", function()
		local guid = UnitGUID("player")
		for i, addon in ipairs(app.Info.AddonList) do
			if addon.enabledCharacter == 2 then
				C_AddOns.EnableAddOn(i, guid)
			elseif addon.enabledCharacter == 0 then
				C_AddOns.DisableAddOn(i, guid)
			end
		end
		ReloadUI()
	end)

	local function checkChangesAll(i)
		if not app.Flag.Changed[i] then
			app.Flag.Changed[i] = true
		else
			app.Flag.Changed[i] = nil
		end

		local next = next
		if next(app.Flag.Changed) == nil then
			app.AddonListFrame.ReloadButton:Disable()
		else
			app.AddonListFrame.ReloadButton:Enable()
		end

		app:UpdateAddonList()
	end

	app.AddonListFrame.EnableAllButton = app:MakeButton(app.AddonListFrame, L.ENABLE_ALL)
	app.AddonListFrame.EnableAllButton:SetPoint("BOTTOMLEFT", app.AddonListFrame, 10, 8)
	app.AddonListFrame.EnableAllButton:SetScript("OnClick", function()
		for i, addon in ipairs(app.Info.AddonList) do
			if addon.enabledCharacter ~= 2 then
				addon.enabledCharacter = 2
				checkChangesAll(i)
			end
		end
	end)

	app.AddonListFrame.DisableAllButton = app:MakeButton(app.AddonListFrame, L.DISABLE_ALL)
	app.AddonListFrame.DisableAllButton:SetPoint("LEFT", app.AddonListFrame.EnableAllButton, "RIGHT", 2, 0)
	app.AddonListFrame.DisableAllButton:SetScript("OnClick", function()
		for i, addon in ipairs(app.Info.AddonList) do
			if addon.enabledCharacter ~= 0 then
				addon.enabledCharacter = 0
				checkChangesAll(i)
			end
		end
	end)

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

	local function headerInitializer(listItem, node)
		listItem:EnableMouse(true)
		listItem:RegisterForDrag("LeftButton")
		listItem:SetScript("OnDragStart", function() app.AddonListFrame:StartMoving() end)
		listItem:SetScript("OnDragStop", function() app.AddonListFrame:StopMovingOrSizing() end)

		local data = node:GetData()

		local function updateToggleButton()
			if node:IsCollapsed() then
				listItem.toggleButton.texture:SetTexture("Interface\\AddOns\\SlackersAddonDepot\\assets\\button-right.png")
			else
				listItem.toggleButton.texture:SetTexture("Interface\\AddOns\\SlackersAddonDepot\\assets\\button-down.png")
			end
		end

		if not listItem.toggleButton then
			listItem.toggleButton = CreateFrame("Button", nil, listItem)
			listItem.toggleButton:SetSize(22, 22)
			listItem.toggleButton:SetFrameLevel(listItem:GetFrameLevel() + 1)
			listItem.toggleButton:SetHighlightAtlas("common-button-collapseExpand-hover")
			listItem.toggleButton:SetPropagateMouseClicks(false)
			listItem.toggleButton.texture = listItem.toggleButton:CreateTexture(nil, "ARTWORK")
			listItem.toggleButton.texture:SetAllPoints()
		end
		updateToggleButton()
		listItem.toggleButton:Show()
		listItem.toggleButton:ClearAllPoints()
		listItem.toggleButton:SetPoint("LEFT", listItem, "LEFT", 0, 1)
		listItem.toggleButton:SetScript("OnClick", function()
			node:ToggleCollapsed()
			updateToggleButton()
		end)

		listItem.Text1:SetText("|cffFFFFFF" .. data.title)
		listItem.Text1:SetFont("Fonts\\FRIZQT__.TTF", 14)
	end

	local function addonInitializer(listItem, node)
		listItem:EnableMouse(true)
		listItem:RegisterForDrag("LeftButton")
		listItem:SetScript("OnDragStart", function() app.AddonListFrame:StartMoving() end)
		listItem:SetScript("OnDragStop", function() app.AddonListFrame:StopMovingOrSizing() end)

		local data = node:GetData()

		local function sendChanges(checkboxState)
			if checkboxState then
				app.Info.AddonList[data.id].enabledCharacter = 2
			else
				app.Info.AddonList[data.id].enabledCharacter = 0
			end
		end
		local function checkChanges()
			if not app.Flag.Changed[data.id] then
				app.Flag.Changed[data.id] = true
			else
				app.Flag.Changed[data.id] = nil
			end
			local next = next
			if next(app.Flag.Changed) == nil then
				app.AddonListFrame.ReloadButton:Disable()
			else
				app.AddonListFrame.ReloadButton:Enable()
			end
		end
		if data.enabled == 2 then
			listItem.Checkbox:SetChecked(true)
		elseif data.enabled == 0 then
			listItem.Checkbox:SetChecked(false)
		end
		listItem:SetScript("OnClick", function()
			listItem.Checkbox:SetChecked(not listItem.Checkbox:GetChecked())
			sendChanges(listItem.Checkbox:GetChecked())
			checkChanges()
		end)
		listItem.Checkbox:SetScript("OnClick", function(self)
			sendChanges(self:GetChecked())
			checkChanges()
		end)

		if data.iconTexture then
			listItem.Icon:SetText(CreateSimpleTextureMarkup(data.iconTexture, 18, 18))
		elseif data.iconAtlas then
			listItem.Icon:SetText(CreateAtlasMarkup(data.iconAtlas, 18, 18))
		else
			listItem.Icon:SetText(CreateSimpleTextureMarkup(app.IconNone, 18, 18))
		end

		listItem.Text1:SetText(data.title)
		listItem.Text1:SetFont("Fonts\\FRIZQT__.TTF", 14)

		local _, _, _, interfaceVersion = GetBuildInfo()
		if data.interface < 119999 or data.interface > interfaceVersion then
			listItem.Text2:SetText("|cffFF0000" .. L.INCOMPATIBLE)
		elseif data.interface < interfaceVersion and not app.Settings["loadOutOfDate"] then
			listItem.Text2:SetText("|cffFF0000" .. L.OUT_OF_DATE)
		elseif app.Flag.Changed[data.id] then
			listItem.Text2:SetText("|cffFF0000" .. L.REQUIRES_RELOAD)
		elseif data.interface < interfaceVersion then
			listItem.Text2:SetText("|cff9D9D9D" .. L.OUT_OF_DATE)
		else
			listItem.Text2:SetText("")
		end

		listItem:SetScript("OnEnter", function()
			GameTooltip:ClearLines()
			GameTooltip:ClearAllPoints()
			GameTooltip:SetOwner(UIParent, "ANCHOR_NONE")
			GameTooltip:AddDoubleLine(data.title, data.version)
			if data.dependencies then
				GameTooltip:AddLine(L.DEPENDENCIES .. data.dependencies)
			end
			GameTooltip:AddLine(data.notes, 1, 1, 1, true)
			if app.AddonListFrame:GetCenter() < GetScreenWidth() / 2 then
				GameTooltip:SetPoint("LEFT", app.AddonListFrame, "RIGHT", 5, 0)
			else
				GameTooltip:SetPoint("RIGHT", app.AddonListFrame, "LEFT", -5, 0)
			end
			GameTooltip:Show()
		end)
		listItem:SetScript("OnLeave", function()
			GameTooltip:Hide()
		end)
	end

	app.AddonList:SetElementFactory(function(factory, node)
		local data = node:GetData()

		if data.nodeType == "header" then
			factory("SlackersAddonDepot_AddonListHeader", headerInitializer)
		elseif data.nodeType == "addon" then
			factory("SlackersAddonDepot_AddonListAddon", addonInitializer)
		elseif data.nodeType == "dependency" then
			factory("SlackersAddonDepot_AddonListDependency", addonInitializer)
		end
	end)

	app.AddonListFrame:SetFlattensRenderLayers(true)
end

function app:UpdateAddonList()
	local function addonNameSearch(addon, search)
		if search == "" then
			return true
		end

		search = search:lower()

		return addon.title:lower():find(search, 1, true) or addon.name:lower():find(search, 1, true)
	end

	local addonList = {}

	if app.Settings["headerStyle"] == 1 then
		local seen = {}

		for i, addon in ipairs(app.Info.AddonList) do
			if not addon.dependencies and addon.category and not seen[addon.category] then
				table.insert(addonList, { category = addon.category, children = {} })
				seen[addon.category] = true
			end
		end
		table.sort(addonList, function(a, b) return a.category < b.category end)
		table.insert(addonList, { category = L.UNCATEGORIZED, children = {} })

		for _, header in ipairs(addonList) do
			for i, addon in ipairs(app.Info.AddonList) do
				if not addon.dependencies and addonNameSearch(addon, app.Flag.Search) then
					if (not addon.category and header.category == L.UNCATEGORIZED) or addon.category == header.category then
						table.insert(header.children, { addon = addon, children = {} })
					end
				end
			end
		end
	elseif app.Settings["headerStyle"] == 2 then
		table.insert(addonList, { category = L.ENABLED, children = {} })
		table.insert(addonList, { category = L.DISABLED, children = {} })

		for _, addon in ipairs(app.Info.AddonList) do
			if not addon.dependencies and addonNameSearch(addon, app.Flag.Search) then
				if addon.enabledCharacter == 2 then
					table.insert(addonList[1].children, { addon = addon, children = {} })
				elseif addon.enabledCharacter == 0 then
					table.insert(addonList[2].children, { addon = addon, children = {} })
				end
			end
		end
	end

	for _, addon in ipairs(app.Info.AddonList) do
		if addon.dependencies and addonNameSearch(addon, app.Flag.Search) then
			for _, header in ipairs(addonList) do
				for _, child in ipairs(header.children) do
					if addon.dependencies == child.addon.name then
						table.insert(child.children, { addon = addon })
					end
				end
			end
		end
	end

	local DataProvider = CreateTreeDataProvider()

	for _, header in ipairs(addonList) do
		local next = next
		if next(header.children) ~= nil then
			local row1 = DataProvider:Insert({ nodeType = "header", title = header.category })
			for _, addon1 in ipairs(header.children) do
				local addon = addon1.addon
				local row2 = row1:Insert({ id = addon.id, nodeType = "addon", iconTexture = addon.iconTexture, iconAtlas = addon.iconAtlas, name = addon.name, title = addon.title, notes = addon.notes, interface = addon.interface, version = addon.version, dependencies = addon.dependencies, enabled = addon.enabledCharacter })
				for _, addon2 in ipairs(addon1.children) do
					local addon = addon2.addon
					row2:Insert({ id = addon.id, nodeType = "dependency", iconTexture = addon.iconTexture, iconAtlas = addon.iconAtlas, name = addon.name, title = addon.title, notes = addon.notes, interface = addon.interface, version = addon.version, dependencies = addon.dependencies, enabled = addon.enabledCharacter })
				end
			end
		end
	end

	app.AddonList:SetDataProvider(DataProvider, true)
end

function api:ToggleAddonList()
	if app.AddonListFrame:IsShown() then
		app.AddonListFrame:Hide()
	else
		app.AddonListFrame:Show()
	end
end

--------------------
-- GAME MENU HOOK --
--------------------

function app:HookGameMenu()
	if not app.Flag.MenuHooked then
		local originalOnClick
		GameMenuFrame:HookScript("OnShow", function()
			for button in GameMenuFrame.buttonPool:EnumerateActive() do
				if button:GetText() == ADDONS then
					if not originalOnClick then
						originalOnClick = button:GetScript("OnClick")
					end
					if app.Settings["replaceMenuButton"] then
						button:SetScript("OnClick", function()
							HideUIPanel(GameMenuFrame)
							app.AddonListFrame:Show()
						end)
					else
						 button:SetScript("OnClick", originalOnClick)
					end
					break
				end
			end
		end)
		app.Flag.MenuHooked = true
	end
end
