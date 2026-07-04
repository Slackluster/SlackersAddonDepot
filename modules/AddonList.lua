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
		app.Flag.Changed = {}
		app.Flag.Search = ""

		app:CreateAddonList()
		app:HookGameMenu()
	end
end)

----------------
-- ADDON LIST --
----------------

function app:CreateAddonList()
	app.AddonListFrame = CreateFrame("Frame", "SlackersAddonDepotAddonList", UIParent, "DefaultPanelTemplate")
	app.AddonListFrame:SetSize(600, 600)
	app.AddonListFrame:SetPoint("CENTER")
	app.AddonListFrame:SetFrameStrata("HIGH")
	app.AddonListFrame:EnableMouse(true)
	app.AddonListFrame:SetMovable(true)
	app.AddonListFrame:RegisterForDrag("LeftButton")
	app.AddonListFrame:SetClampedToScreen(true)
	local inset = 300
	app.AddonListFrame:SetClampRectInsets(app.AddonListFrame:GetWidth()-inset, -(app.AddonListFrame:GetWidth()-inset), -(app.AddonListFrame:GetHeight()-inset), app.AddonListFrame:GetHeight()-inset)
	app.AddonListFrame:Hide()
	table.insert(UISpecialFrames, "SlackersAddonDepotAddonList")
	app.AddonListFrame:SetScript("OnShow", function()
		app.AddonListFrame:ClearAllPoints()
		app.AddonListFrame:SetPoint("CENTER")

		app.Flag.SelectedCharacter = app.Info.GUID
		app.AddonListFrame.CharListDropdown:SetDefaultText("|c" .. app.Data.Characters[app.Flag.SelectedCharacter].classColor .. app.Data.Characters[app.Flag.SelectedCharacter].name .. "-" .. app.Data.Characters[app.Flag.SelectedCharacter].realmNorm)
		app.AddonListFrame.CharListDropdown:SetupMenu(charListGenerator)

		app.AddonListFrame.SearchBar:SetText("")

		app:UpdateAddonList()
	end)
	app.AddonListFrame:SetScript("OnHide", function()
		app.Flag.Changed = {}
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

	function charListGenerator(owner, rootDescription)
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
					app.Flag.Changed = {}
					app:UpdateAddonList()
				end)
			end
		end

		rootDescription:SetGridMode(MenuConstants.VerticalGridDirection)
		rootDescription:CreateButton(L.ALL, function(data)
			owner:SetDefaultText(L.ALL)
			app.Flag.SelectedCharacter = L.ALL
			app.Flag.Changed = {}
			app:UpdateAddonList()
		end)

		if app.Settings["charListRealm"] then
			local realms = {}
			local seen = {}
			for _, char in pairs(app.Data.Characters) do
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
			for _, char in pairs(app.Data.Characters) do
				table.insert(characters, char)
			end
			sortChars(characters)
			addChars(characters, true)
		end
	end
	app.AddonListFrame.CharListDropdown = CreateFrame("DropdownButton", nil, app.AddonListFrame, "WowStyle1DropdownTemplate")
	app.AddonListFrame.CharListDropdown:SetWidth(200)
	app.AddonListFrame.CharListDropdown:SetPoint("TOPLEFT", 11, -26)

	local function isSelected(index)
		return app.Settings["headerStyle"] == index
	end
	local function setSelected(index)
		app.Settings["headerStyle"] = index
		app:UpdateAddonList()
	end
	function listStyleGenerator(owner, rootDescription)
		rootDescription:CreateRadio(L.ALPHABETICAL, isSelected, setSelected, 1)
		rootDescription:CreateRadio(L.CATEGORIES, isSelected, setSelected, 2)
		rootDescription:CreateRadio(L.CATEGORIES_WIKI, isSelected, setSelected, 3)
		rootDescription:CreateRadio(L.ENABLESTATE, isSelected, setSelected, 4)
	end
	app.AddonListFrame.ListStyleDropdown = CreateFrame("DropdownButton", nil, app.AddonListFrame, "WowStyle1DropdownTemplate")
	app.AddonListFrame.ListStyleDropdown:SetWidth(120)
	app.AddonListFrame.ListStyleDropdown:SetPoint("TOPRIGHT", -7, -26)
	app.AddonListFrame.ListStyleDropdown:SetupMenu(listStyleGenerator)

	function profilesGenerator(owner, rootDescription)
		local function makeProfileEntry(profileNo, profileInfo)
			local profile = rootDescription:CreateButton(profileInfo.name)
			if profileInfo.type == "Login" then
				profile:CreateButton("Set load conditions", function()
					app.Flag.SelectedProfile = profileNo
					app.LoadConditionsPanel:Show()
				end)
			elseif profileInfo.type == "Standard" then
				local label
				if app.Flag.SelectedCharacter == "All" then
					label = L.ALL
				else
					label = "|c" .. app.Data.Characters[app.Flag.SelectedCharacter].classColor .. app.Data.Characters[app.Flag.SelectedCharacter].name .. "-" .. app.Data.Characters[app.Flag.SelectedCharacter].realmNorm
				end
				profile:CreateButton(string.format(L.APPLY_PROFILE, label), function()
					for i, addon in pairs(app.Info.AddonList) do
						if profileInfo.addons[addon.name] and addon.enabled ~= 2 then
							app.Flag.Changed[i] = true
						elseif not profileInfo.addons[addon.name] and addon.enabled ~= 0 then
							app.Flag.Changed[i] = false
						end
					end
					app.AddonListFrame.SearchBar:SetText("")
					app:UpdateAddonList()
				end)
			end
			profile:CreateDivider()
			local addonCount = 0
			for _, _ in pairs(profileInfo.addons) do
				addonCount = addonCount + 1
			end
			local addons = profile:CreateButton(L.ADDONS .. " (" .. addonCount .. ")")
			profile:CreateButton(string.format(L.SAVE_ADDONS, app.Flag.SelectedNo), function()
				profileInfo.addons = {}
				for i, state in pairs(app.Flag.Changed) do
					if state then
						profileInfo.addons[app.Info.AddonList[i].name] = { title = app.Info.AddonList[i].title }
					end
				end
				for i, addon in ipairs(app.Info.AddonList) do
					if addon.enabled == 2 and app.Flag.Changed[i] == nil then
						profileInfo.addons[addon.name] = { title = addon.title }
					end
				end
				table.sort(profileInfo.addons, function(a, b) return a.id < b.id end)
			end)
			profile:CreateDivider()
			profile:CreateButton(L.RENAME_PROFILE, function() StaticPopup_Show("SLACKERSADDONDEPOT_RENAMEPROFILE", nil, nil, profileNo) end)
			profile:CreateButton(L.DELETE_PROFILE, function() StaticPopup_Show("SLACKERSADDONDEPOT_DELETEPROFILE", nil, nil, profileNo) end)

			for _, addon in pairs(profileInfo.addons) do
				addons:CreateButton(addon.title)
			end
		end

		local login, standard = false, false
		for profileNo, profileInfo in ipairs(app.Data.Profiles) do
			if profileInfo.type == "Login" then
				if not login then
					rootDescription:CreateTitle(L.LOGIN_PROFILES)
					login = true
				end
				makeProfileEntry(profileNo, profileInfo)
			end
		end
		for profileNo, profileInfo in ipairs(app.Data.Profiles) do
			if profileInfo.type == "Standard" then
				if not standard then
					rootDescription:CreateTitle(L.STANDARD_PROFILES)
					standard = true
				end
				makeProfileEntry(profileNo, profileInfo)
			end
		end

		rootDescription:CreateDivider()
		rootDescription:CreateButton(L.NEW_PROFILE, function()
			app.NewProfilePanel:Show()
		end)
	end
	local profilesMenu
	app.AddonListFrame.ProfilesButton = app:MakeButton(app.AddonListFrame, L.PROFILES)
	app.AddonListFrame.ProfilesButton:SetPoint("LEFT", app.AddonListFrame.CharListDropdown, "RIGHT", 6, 0)
	app.AddonListFrame.ProfilesButton:SetScript("OnClick", function(self)
		profilesMenu = MenuUtil.CreateContextMenu(self, profilesGenerator)
		profilesMenu:ClearAllPoints()
		profilesMenu:SetPoint("TOPLEFT", self, "BOTTOMLEFT")
	end)

	app.AddonListFrame.SearchBar = CreateFrame("EditBox", nil, app.AddonListFrame, "SearchBoxTemplate")
	app.AddonListFrame.SearchBar:SetSize(160, 20)
	app.AddonListFrame.SearchBar:SetPoint("RIGHT", app.AddonListFrame.ListStyleDropdown, "LEFT", -6, 0)
	app.AddonListFrame.SearchBar:SetPoint("LEFT", app.AddonListFrame.ProfilesButton, "RIGHT", 10, 0)
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

	app.AddonListFrame.RevertOrCancelButton = app:MakeButton(app.AddonListFrame, "")
	app.AddonListFrame.RevertOrCancelButton:SetPoint("BOTTOMRIGHT", app.AddonListFrame, -6, 8)
	app.AddonListFrame.RevertOrCancelButton:SetScript("OnClick", function()
		local next = next
		if next(app.Flag.Changed) == nil then
			app.AddonListFrame:Hide()
		else
			app.Flag.Changed = {}
			app:UpdateAddonList()
		end
	end)

	app.AddonListFrame.ApplyButton = app:MakeButton(app.AddonListFrame, "")
	app.AddonListFrame.ApplyButton:SetPoint("RIGHT", app.AddonListFrame.RevertOrCancelButton, "LEFT", -2, 0)
	app.AddonListFrame.ApplyButton:SetScript("OnClick", function()
		local guid = app.Flag.SelectedCharacter
		if app.Flag.SelectedCharacter == "All" then
			guid = nil
		end
		for i, state in pairs(app.Flag.Changed) do
			if state then
				C_AddOns.EnableAddOn(i, guid)
			else
				C_AddOns.DisableAddOn(i, guid)
			end
		end
		if app.Flag.SelectedCharacter == app.Info.GUID or app.Flag.SelectedCharacter == "All" then
			ReloadUI()
		else
			app.Flag.Changed = {}
			app:UpdateAddonList()
		end
	end)

	local function sendChangesAll(checkboxState)
		for i, addon in ipairs(app.Info.AddonList) do
			if addon.enabled == 1 or (addon.enabled == 0 and checkboxState == true) or (addon.enabled == 2 and checkboxState == false) then
				app.Flag.Changed[i] = checkboxState
			else
				app.Flag.Changed[i] = nil
			end
		end

		app:UpdateAddonList()
	end

	app.AddonListFrame.EnableAllButton = app:MakeButton(app.AddonListFrame, L.ENABLE_ALL)
	app.AddonListFrame.EnableAllButton:SetPoint("BOTTOMLEFT", app.AddonListFrame, 10, 8)
	app.AddonListFrame.EnableAllButton:SetScript("OnClick", function()
		sendChangesAll(true)
	end)

	app.AddonListFrame.DisableAllButton = app:MakeButton(app.AddonListFrame, L.DISABLE_ALL)
	app.AddonListFrame.DisableAllButton:SetPoint("LEFT", app.AddonListFrame.EnableAllButton, "RIGHT", 2, 0)
	app.AddonListFrame.DisableAllButton:SetScript("OnClick", function()
		sendChangesAll(false)
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
		listItem.toggleButton:SetPoint("LEFT", listItem, "LEFT", 2, 1)
		listItem.toggleButton:SetScript("OnClick", function()
			node:ToggleCollapsed()
			updateToggleButton()
		end)
		listItem:SetScript("OnClick", function()
			node:ToggleCollapsed()
			updateToggleButton()
		end)

		listItem.Text1:SetText("|cffFFFFFF" .. data.title)
	end

	local function addonInitializer(listItem, node)
		listItem:EnableMouse(true)
		listItem:RegisterForDrag("LeftButton")
		listItem:SetScript("OnDragStart", function() app.AddonListFrame:StartMoving() end)
		listItem:SetScript("OnDragStop", function() app.AddonListFrame:StopMovingOrSizing() end)

		local data = node:GetData()

		local function sendChanges(i, checkboxState)
			if app.Info.AddonList[i].enabled == 1 or (app.Info.AddonList[i].enabled == 0 and checkboxState == true) or (app.Info.AddonList[i].enabled == 2 and checkboxState == false) then
				app.Flag.Changed[i] = checkboxState
			else
				app.Flag.Changed[i] = nil
			end
			app:UpdateAddonList()
		end
		if data.enabled == 1 and app.Flag.Changed[data.id] == nil then
			listItem.Checkbox:SetCheckedTexture("checkmark-minimal-disabled")
		else
			listItem.Checkbox:SetCheckedTexture("checkmark-minimal")
		end
		if app.Flag.Changed[data.id] ~= nil then
			listItem.Checkbox:SetChecked(app.Flag.Changed[data.id])
		elseif data.enabled == 1 or data.enabled == 2 then
			listItem.Checkbox:SetChecked(true)
		elseif data.enabled == 0 then
			listItem.Checkbox:SetChecked(false)
		end
		listItem.Checkbox:SetScript("OnClick", function(self)
			sendChanges(data.id, self:GetChecked())
			app.Flag.LastClicked = { id = data.id, enabled = self:GetChecked() }
		end)

		listItem:SetScript("OnClick", function(self, button)
			if not data.id then return end

			if IsShiftKeyDown() and app.Flag.LastClicked then
				local oldIndex = app.Flag.LastClicked.id
				local newIndex = listItem:GetElementDataIndex()
				if newIndex == app.Flag.LastClicked then return end
				app.Flag.LastClicked.id = newIndex

				local a = math.min(oldIndex, newIndex)
				local b = math.max(oldIndex, newIndex)

				for i = a, b do
					local id = app.AddonList:FindElementData(i).data.id
					if id then
						sendChanges(id, app.Flag.LastClicked.enabled)
					end
				end
			else
				listItem.Checkbox:Click()
			end
			app:UpdateAddonList()
		end)

		if data.iconTexture then
			listItem.Icon:SetText(CreateSimpleTextureMarkup(data.iconTexture, 18, 18))
		elseif data.iconAtlas then
			listItem.Icon:SetText(CreateAtlasMarkup(data.iconAtlas, 18, 18))
		else
			listItem.Icon:SetText(CreateSimpleTextureMarkup(app.IconNone, 18, 18))
		end

		listItem.Text1:SetText(data.title)

		local _, _, _, interfaceVersion = GetBuildInfo()
		local dependencyData = app.AddonList:FindElementDataByPredicate(function(elementData)
			return elementData.data and elementData.data.name == data.dependencies
		end)
		local dependencyID, dependencyEnabled
		if dependencyData then
			dependencyID = dependencyData.data.id
			dependencyEnabled = dependencyData.data.enabled
		end

		if data.interface < 119999 or data.interface > interfaceVersion then
			listItem.Text2:SetText("|cffFF0000" .. L.INCOMPATIBLE)
		elseif data.dependencies and not app.Info.InstalledAddonsByName[data.dependencies] then
			listItem.Text2:SetText("|cffFF0000" .. L.DEPENDENCY_MISSING)
		elseif data.interface < interfaceVersion and not app.Settings["loadOutOfDate"] then
			listItem.Text2:SetText("|cffFF0000" .. L.OUT_OF_DATE)
		elseif data.dependencies and app.Flag.Changed[data.id] ~= false and (data.enabled ~= 0 or app.Flag.Changed[data.id]) and ((dependencyEnabled == 0 and app.Flag.Changed[dependencyID] ~= true) or (dependencyEnabled ~= 0 and app.Flag.Changed[dependencyID] == false)) then
			listItem.Text2:SetText("|cffFF0000" .. L.DEPENDENCY_DISABLED)
		elseif app.Flag.Changed[data.id] ~= nil then
			if app.Flag.SelectedCharacter == app.Info.GUID or app.Flag.SelectedCharacter == "All" then
				listItem.Text2:SetText("|cffFF0000" .. L.REQUIRES_RELOAD)
			else
				listItem.Text2:SetText("|cffFF0000" .. L.CHANGE_PENDING)
			end
		elseif data.interface < interfaceVersion then
			listItem.Text2:SetText("|cff9D9D9D" .. L.OUT_OF_DATE)
		else
			listItem.Text2:SetText("")
		end

		listItem:SetScript("OnEnter", function()
			local major = math.floor(data.interface / 10000)
			local minor = math.floor(data.interface / 100) % 100
			local patch = data.interface % 100

			GameTooltip:ClearLines()
			GameTooltip:ClearAllPoints()
			GameTooltip:SetOwner(UIParent, "ANCHOR_NONE")
			GameTooltip:AddDoubleLine(data.title, data.version)
			GameTooltip:AddDoubleLine(data.author or L.NOT_APPLICABLE, major .. "." .. minor .. "." .. patch)
			if data.dependencies or data.notes then
				GameTooltip:AddLine(" ")
			end
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
	local function addonSearch(addon, search)
		if search == "" then
			return true
		end

		search = search:lower()

		return addon.title:lower():find(search, 1, true) or addon.name:lower():find(search, 1, true) or addon.author:lower():find(search, 1, true)
	end

	if app.Settings["headerStyle"] == 1 then
		app.AddonListFrame.ListStyleDropdown:SetDefaultText(L.ALPHABETICAL)
	elseif app.Settings["headerStyle"] == 2 then
		app.AddonListFrame.ListStyleDropdown:SetDefaultText(L.CATEGORIES)
	elseif app.Settings["headerStyle"] == 3 then
		app.AddonListFrame.ListStyleDropdown:SetDefaultText(L.CATEGORIES_WIKI)
	elseif app.Settings["headerStyle"] == 4 then
		app.AddonListFrame.ListStyleDropdown:SetDefaultText(L.ENABLESTATE)
	end

	local next = next
	if next(app.Flag.Changed) == nil then
		app.AddonListFrame.ApplyButton:Disable()
		app:UpdateButton(app.AddonListFrame.RevertOrCancelButton, L.CANCEL)
	else
		app.AddonListFrame.ApplyButton:Enable()
		app:UpdateButton(app.AddonListFrame.RevertOrCancelButton, L.REVERT .. "  " .. CreateAtlasMarkup("common-icon-undo"))
	end

	if app.Flag.SelectedCharacter == app.Info.GUID or app.Flag.SelectedCharacter == "All" then
		app:UpdateButton(app.AddonListFrame.ApplyButton, L.RELOADUI)
	else
		app:UpdateButton(app.AddonListFrame.ApplyButton, L.APPLY_CHANGES)
	end

	app.Flag.SelectedNo = 0
	for _, addon in ipairs(app.Info.AddonList) do
		if app.Flag.SelectedCharacter == "All" then
			addon.enabled = C_AddOns.GetAddOnEnableState(addon.id)
		else
			addon.enabled = C_AddOns.GetAddOnEnableState(addon.id, app.Flag.SelectedCharacter)
		end
		if addon.enabled == 2 and app.Flag.Changed[addon.id] == nil then
			app.Flag.SelectedNo = app.Flag.SelectedNo + 1
		end
	end
	for _, state in pairs(app.Flag.Changed) do
		if state then
			app.Flag.SelectedNo = app.Flag.SelectedNo + 1
		end
	end

	-- Check for uninstalled dependencies
	app.Info.InstalledAddonsByName = {}
	for i, addon in ipairs(app.Info.AddonList) do
		app.Info.InstalledAddonsByName[addon.name] = addon
	end

	local addonList = {}
	local DataProvider = CreateTreeDataProvider()

	if app.Settings["headerStyle"] == 1 then -- Alphabetical
		for i, addon in ipairs(app.Info.AddonList) do
			if (not addon.dependencies or not app.Info.InstalledAddonsByName[addon.dependencies]) and addonSearch(addon, app.Flag.Search) then
				table.insert(addonList, { addon = addon, children = {} })
			end
		end

		for i, addon in ipairs(app.Info.AddonList) do
			if addon.dependencies and addonSearch(addon, app.Flag.Search) then
				for _, child in ipairs(addonList) do
					if addon.dependencies == child.addon.name then
						table.insert(child.children, { addon = addon })
					end
				end
			end
		end

		for _, addon1 in ipairs(addonList) do
			local addon = addon1.addon
			local row1 = DataProvider:Insert({ id = addon.id, nodeType = "addon", iconTexture = addon.iconTexture, iconAtlas = addon.iconAtlas, name = addon.name, title = addon.title, notes = addon.notes, interface = addon.interface, version = addon.version, author = addon.author, dependencies = addon.dependencies, enabled = addon.enabled })
			for _, addon2 in ipairs(addon1.children) do
				local addon = addon2.addon
				row1:Insert({ id = addon.id, nodeType = "dependency", iconTexture = addon.iconTexture, iconAtlas = addon.iconAtlas, name = addon.name, title = addon.title, notes = addon.notes, interface = addon.interface, version = addon.version, author = addon.author, dependencies = addon.dependencies, enabled = addon.enabled })
			end
		end
	elseif app.Settings["headerStyle"] == 2 then -- Categories
		local seen = {}

		for i, addon in ipairs(app.Info.AddonList) do
			if (not addon.dependencies or not app.Info.InstalledAddonsByName[addon.dependencies]) and addon.category and not seen[addon.category] then
				table.insert(addonList, { category = addon.category, children = {} })
				seen[addon.category] = true
			end
		end
		table.sort(addonList, function(a, b) return a.category < b.category end)
		table.insert(addonList, { category = L.UNCATEGORIZED, children = {} })

		for _, header in ipairs(addonList) do
			for i, addon in ipairs(app.Info.AddonList) do
				if (not addon.dependencies or not app.Info.InstalledAddonsByName[addon.dependencies]) and addonSearch(addon, app.Flag.Search) then
					if (not addon.category and header.category == L.UNCATEGORIZED) or addon.category == header.category then
						table.insert(header.children, { addon = addon, children = {} })
					end
				end
			end
		end

		for _, addon in ipairs(app.Info.AddonList) do
			if addon.dependencies and addonSearch(addon, app.Flag.Search) then
				for _, header in ipairs(addonList) do
					for _, child in ipairs(header.children) do
						if addon.dependencies == child.addon.name then
							table.insert(child.children, { addon = addon })
						end
					end
				end
			end
		end

		for _, header in ipairs(addonList) do
			local next = next
			if next(header.children) ~= nil then
				local row1 = DataProvider:Insert({ nodeType = "header", title = header.category })
				for _, addon1 in ipairs(header.children) do
					local addon = addon1.addon
					local row2 = row1:Insert({ id = addon.id, nodeType = "addon", iconTexture = addon.iconTexture, iconAtlas = addon.iconAtlas, name = addon.name, title = addon.title, notes = addon.notes, interface = addon.interface, version = addon.version, author = addon.author, dependencies = addon.dependencies, enabled = addon.enabled })
					for _, addon2 in ipairs(addon1.children) do
						local addon = addon2.addon
						row2:Insert({ id = addon.id, nodeType = "dependency", iconTexture = addon.iconTexture, iconAtlas = addon.iconAtlas, name = addon.name, title = addon.title, notes = addon.notes, interface = addon.interface, version = addon.version, author = addon.author, dependencies = addon.dependencies, enabled = addon.enabled })
					end
				end
			end
		end
	elseif app.Settings["headerStyle"] == 3 then -- Categories (Wiki)
		local seen = {}

		for i, addon in ipairs(app.Info.AddonList) do
			if (not addon.dependencies or not app.Info.InstalledAddonsByName[addon.dependencies]) and addon.category and app.WikiCategories[GetLocale()][addon.category] and not seen[addon.category] then
				table.insert(addonList, { category = addon.category, children = {} })
				seen[addon.category] = true
			end
		end
		table.sort(addonList, function(a, b) return a.category < b.category end)
		table.insert(addonList, { category = L.UNCATEGORIZED, children = {} })

		for _, header in ipairs(addonList) do
			for i, addon in ipairs(app.Info.AddonList) do
				if (not addon.dependencies or not app.Info.InstalledAddonsByName[addon.dependencies]) and addonSearch(addon, app.Flag.Search) then
					if ((not addon.category or not app.WikiCategories[GetLocale()][addon.category]) and header.category == L.UNCATEGORIZED) or addon.category == header.category then
						table.insert(header.children, { addon = addon, children = {} })
					end
				end
			end
		end

		for _, addon in ipairs(app.Info.AddonList) do
			if addon.dependencies and addonSearch(addon, app.Flag.Search) then
				for _, header in ipairs(addonList) do
					for _, child in ipairs(header.children) do
						if addon.dependencies == child.addon.name then
							table.insert(child.children, { addon = addon })
						end
					end
				end
			end
		end

		for _, header in ipairs(addonList) do
			local next = next
			if next(header.children) ~= nil then
				local row1 = DataProvider:Insert({ nodeType = "header", title = header.category })
				for _, addon1 in ipairs(header.children) do
					local addon = addon1.addon
					local row2 = row1:Insert({ id = addon.id, nodeType = "addon", iconTexture = addon.iconTexture, iconAtlas = addon.iconAtlas, name = addon.name, title = addon.title, notes = addon.notes, interface = addon.interface, version = addon.version, author = addon.author, dependencies = addon.dependencies, enabled = addon.enabled })
					for _, addon2 in ipairs(addon1.children) do
						local addon = addon2.addon
						row2:Insert({ id = addon.id, nodeType = "dependency", iconTexture = addon.iconTexture, iconAtlas = addon.iconAtlas, name = addon.name, title = addon.title, notes = addon.notes, interface = addon.interface, version = addon.version, author = addon.author, dependencies = addon.dependencies, enabled = addon.enabled })
					end
				end
			end
		end
	elseif app.Settings["headerStyle"] == 4 then -- Enable State
		table.insert(addonList, { category = L.ENABLED, children = {} })
		table.insert(addonList, { category = L.DISABLED, children = {} })

		for _, addon in ipairs(app.Info.AddonList) do
			if (not addon.dependencies or not app.Info.InstalledAddonsByName[addon.dependencies]) and addonSearch(addon, app.Flag.Search) then
				if addon.enabled == 0 then
					table.insert(addonList[2].children, { addon = addon, children = {} })
				else
					table.insert(addonList[1].children, { addon = addon, children = {} })
				end
			end
		end

		local seenDependencies = {}

		for i, addon in ipairs(app.Info.AddonList) do
			if addon.dependencies and addonSearch(addon, app.Flag.Search) then
				for _, header in ipairs(addonList) do
					for _, child in ipairs(header.children) do
						if addon.dependencies == child.addon.name and ((header.category == L.ENABLED and addon.enabled ~= 0) or (header.category == L.DISABLED and addon.enabled == 0)) then
							table.insert(child.children, { addon = addon })
							seenDependencies[i] = true
						end
					end
				end
			end
		end

		for i, addon in ipairs(app.Info.AddonList) do
			if addon.dependencies and addonSearch(addon, app.Flag.Search) and not seenDependencies[i] then
				if addon.enabled == 0 then
					table.insert(addonList[2].children, { addon = addon, children = {} })
				else
					table.insert(addonList[1].children, { addon = addon, children = {} })
				end
			end
		end

		for _, header in ipairs(addonList) do
			table.sort(header.children, function(a, b)
				return a.addon.id < b.addon.id
			end)
			for _, child in ipairs(header.children) do
				table.sort(child.children, function(a, b)
					return a.addon.id < b.addon.id
				end)
			end
		end

		for _, header in ipairs(addonList) do
			local next = next
			if next(header.children) ~= nil then
				local row1 = DataProvider:Insert({ nodeType = "header", title = header.category })
				for _, addon1 in ipairs(header.children) do
					local addon = addon1.addon
					local row2 = row1:Insert({ id = addon.id, nodeType = "addon", iconTexture = addon.iconTexture, iconAtlas = addon.iconAtlas, name = addon.name, title = addon.title, notes = addon.notes, interface = addon.interface, version = addon.version, author = addon.author, dependencies = addon.dependencies, enabled = addon.enabled })
					for _, addon2 in ipairs(addon1.children) do
						local addon = addon2.addon
						row2:Insert({ id = addon.id, nodeType = "dependency", iconTexture = addon.iconTexture, iconAtlas = addon.iconAtlas, name = addon.name, title = addon.title, notes = addon.notes, interface = addon.interface, version = addon.version, author = addon.author, dependencies = addon.dependencies, enabled = addon.enabled })
					end
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
