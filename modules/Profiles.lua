--------------------------------------
-- Slacker's Addon Depot: Profiles.lua
--------------------------------------

local appName, app = ...
local api = app.api
local L = app.locales

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		app:CreateNewProfilePanel()
		app:CreateLoadConditionsPanel()
	end
end)

-----------------------
-- NEW PROFILE PANEL --
-----------------------

function app:CreateNewProfilePanel()
	app.NewProfilePanel = CreateFrame("Frame", nil, app.AddonListFrame, "DefaultPanelTemplate")
	app.NewProfilePanel:SetSize(560, 200)
	app.NewProfilePanel:SetPoint("CENTER")
	app.NewProfilePanel:SetFrameStrata("DIALOG")
	app.NewProfilePanel:EnableMouse(true)
	app.NewProfilePanel:Hide()
	app.NewProfilePanel:SetScript("OnShow", function()
	end)
	app.NewProfilePanel:SetScript("OnHide", function()
	end)

	app.NewProfilePanel.TitleContainer.TitleText:SetText(app:Colour(L.NEW_PROFILE))

	app.NewProfilePanel.CloseButton = CreateFrame("Button", nil, app.NewProfilePanel, "UIPanelCloseButton")
	app.NewProfilePanel.CloseButton:SetPoint("TOPRIGHT", app.NewProfilePanel)
	app.NewProfilePanel.CloseButton:SetScript("OnClick", function()
		app.NewProfilePanel:Hide()
	end)

	app.NewProfilePanel.ProfileNameEditbox = CreateFrame("EditBox", nil, app.NewProfilePanel, "InputBoxTemplate")
	app.NewProfilePanel.ProfileNameEditbox:SetSize(160, 20)
	app.NewProfilePanel.ProfileNameEditbox:SetPoint("TOP", 0, -40)
	app.NewProfilePanel.ProfileNameEditbox:SetAutoFocus(false)
	app.NewProfilePanel.ProfileNameEditbox:SetCursorPosition(0)
	app.NewProfilePanel.ProfileNameEditbox:SetText(L.PROFILE_NAME)
	app.NewProfilePanel.ProfileNameEditbox:SetScript("OnEnterPressed", function(self)
		self:ClearFocus()
	end)
	app.NewProfilePanel.ProfileNameEditbox:SetScript("OnEscapePressed", function(self)
		self:ClearFocus()
	end)
	app:SetBorder(app.NewProfilePanel.ProfileNameEditbox, -7, 1, 2, -2)

	app.NewProfilePanel.NewLoginProfileButton = app:MakeButton(app.NewProfilePanel, L.LOGIN_PROFILE)
	app.NewProfilePanel.NewLoginProfileButton:SetPoint("TOP", app.NewProfilePanel, -((app.NewProfilePanel:GetWidth()-20)/4), -70)
	app.NewProfilePanel.NewLoginProfileButton:SetScript("OnClick", function()
		table.insert(app.Data.Profiles, { name = app.NewProfilePanel.ProfileNameEditbox:GetText(), type = "Login", addons = {}, loadConditions = { primary = app.Enum.ConditionState.Any, {} } })
		table.sort(app.Data.Profiles, function(a, b)
			return a.name < b.name
		end)
		app.NewProfilePanel:Hide()
	end)

	app.NewProfilePanel.NewLoginProfileText = app.NewProfilePanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	app.NewProfilePanel.NewLoginProfileText:SetPoint("TOP", app.NewProfilePanel.NewLoginProfileButton, "BOTTOM", 0, -10)
	app.NewProfilePanel.NewLoginProfileText:SetText(L.LOGIN_PROFILE_DESC)
	app.NewProfilePanel.NewLoginProfileText:CanWordWrap(true)
	app.NewProfilePanel.NewLoginProfileText:SetWidth(250)

	app.NewProfilePanel.NewStandardProfileButton = app:MakeButton(app.NewProfilePanel, L.STANDARD_PROFILE)
	app.NewProfilePanel.NewStandardProfileButton:SetPoint("TOP", app.NewProfilePanel, (app.NewProfilePanel:GetWidth()-20)/4, -70)
	app.NewProfilePanel.NewStandardProfileButton:SetScript("OnClick", function()
		table.insert(app.Data.Profiles, { name = app.NewProfilePanel.ProfileNameEditbox:GetText(), type = "Standard", addons = {} })
		table.sort(app.Data.Profiles, function(a, b)
			return a.name < b.name
		end)
		app.NewProfilePanel:Hide()
	end)

	app.NewProfilePanel.NewStandardProfileText = app.NewProfilePanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	app.NewProfilePanel.NewStandardProfileText:SetPoint("TOP", app.NewProfilePanel.NewStandardProfileButton, "BOTTOM", 0, -10)
	app.NewProfilePanel.NewStandardProfileText:SetText(L.STANDARD_PROFILE_DESC)
	app.NewProfilePanel.NewStandardProfileText:CanWordWrap(true)
	app.NewProfilePanel.NewStandardProfileText:SetWidth(250)

	app.NewProfilePanel:SetScript("OnShow", function()
		RunNextFrame(function()
			app.NewProfilePanel:SetHeight(math.abs(math.min(app.NewProfilePanel.NewLoginProfileText:GetBottom(), app.NewProfilePanel.NewStandardProfileText:GetBottom()) - app.NewProfilePanel:GetTop()) + 20)
		end)
	end)

	StaticPopupDialogs["SLACKERSADDONDEPOT_RENAMEPROFILE"] = {
		text = L.PROFILE_NAME_NEW,
		button1 = APPLY,
		button2 = CANCEL,
		whileDead = true,
		hasEditBox = true,
		editBoxWidth = 240,
		OnShow = function(dialog, data)
			dialog:ClearAllPoints()
			dialog:SetPoint("CENTER", UIParent)

			local editBox = dialog.GetEditBox and dialog:GetEditBox() or dialog.editBox
			editBox:SetText(app.Data.Profiles[data].name)
			editBox:SetAutoFocus(true)
			editBox:HighlightText()
			editBox:SetScript("OnEditFocusLost", function()
				editBox:SetFocus()
			end)
			editBox:SetScript("OnEscapePressed", function()
				dialog:Hide()
			end)
		end,
		OnAccept = function(dialog, data)
			local editBox = dialog.GetEditBox and dialog:GetEditBox() or dialog.editBox
			app.Data.Profiles[data].name = editBox:GetText()
			table.sort(app.Data.Profiles, function(a, b)
				return a.name < b.name
			end)
		end,
	}

	StaticPopupDialogs["SLACKERSADDONDEPOT_DELETEPROFILE"] = {
		text = "",
		button1 = YES,
		button2 = NO,
		whileDead = true,
		hasEditBox = false,
		OnShow = function(dialog, data)
			dialog:ClearAllPoints()
			dialog:SetPoint("CENTER", UIParent)

			StaticPopup1Text:SetText(string.format(L.DELETE_PROFILE_Q, app.Data.Profiles[data].name))
		end,
		OnAccept = function(dialog, data)
			table.remove(app.Data.Profiles, data)
		end,
	}
end

---------------------------
-- LOAD CONDITIONS PANEL --
---------------------------

function app:CreateLoadConditionsPanel()
	app.LoadConditionsPanel = CreateFrame("Frame", nil, app.AddonListFrame, "DefaultPanelTemplate")
	app.LoadConditionsPanel:SetAllPoints(app.AddonListFrame)
	app.LoadConditionsPanel:SetPoint("CENTER")
	app.LoadConditionsPanel:SetFrameStrata("DIALOG")
	app.LoadConditionsPanel:EnableMouse(true)
	app.LoadConditionsPanel:RegisterForDrag("LeftButton")
	app.LoadConditionsPanel:Hide()
	app.LoadConditionsPanel:SetScript("OnShow", function()
		app.CachedLoadConditions = CopyTable(app.Data.Profiles[app.Flag.SelectedProfile].loadConditions, false)
		app.LoadConditionsPanel.TopText3:SetText(string.format(L.LOADCONDITION_MATCH2, "|cffFFFFFF" .. app.Data.Profiles[app.Flag.SelectedProfile].name .. "|R"))
		app:UpdateLoadConditionsList(true)
	end)
	app.LoadConditionsPanel:SetScript("OnHide", function()
	end)
	app.LoadConditionsPanel:SetScript("OnMouseDown", function()
	end)
	app.LoadConditionsPanel:SetScript("OnDragStart", function()
		app.AddonListFrame:StartMoving()
	end)
	app.LoadConditionsPanel:SetScript("OnDragStop", function()
		app.AddonListFrame:StopMovingOrSizing()
	end)

	app.LoadConditionsPanel.TitleContainer.TitleText:SetText(app.NameLong)

	app.LoadConditionsPanel.TopText1 = app.LoadConditionsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	app.LoadConditionsPanel.TopText1:SetPoint("TOPLEFT", 14, -36)
	app.LoadConditionsPanel.TopText1:SetPoint("TOPRIGHT", -14, -36)
	app.LoadConditionsPanel.TopText1:CanWordWrap(true)
	app.LoadConditionsPanel.TopText1:SetText("|cffFF0000" .. L.LOADCONDITION_WARNING1 .. "|R " .. L.LOADCONDITION_WARNING2)

	app.LoadConditionsPanel.TopText2 = app.LoadConditionsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	app.LoadConditionsPanel.TopText2:SetPoint("TOPLEFT", app.LoadConditionsPanel.TopText1, "BOTTOMLEFT", 8, -20)
	app.LoadConditionsPanel.TopText2:SetText(L.LOADCONDITION_MATCH1)

	app.LoadConditionsPanel.ConditionDropdown = CreateFrame("DropdownButton", "Primary", app.LoadConditionsPanel, "WowStyle1DropdownTemplate")
	local function isSelected(index)
		if app.Flag.SelectedProfile then
			return app.Data.Profiles[app.Flag.SelectedProfile].loadConditions.primary == index
		end
	end
	local function setSelected(index)
		app.Data.Profiles[app.Flag.SelectedProfile].loadConditions.primary = index
	end
	function primaryConditionGenerator(owner, rootDescription)
		rootDescription:CreateRadio(L.CONDITIONSTATE[app.Enum.ConditionState.Any], isSelected, setSelected, app.Enum.ConditionState.Any)
		rootDescription:CreateRadio(L.CONDITIONSTATE[app.Enum.ConditionState.All], isSelected, setSelected, app.Enum.ConditionState.All)
	end

	app.LoadConditionsPanel.ConditionDropdown:SetWidth(60)
	app.LoadConditionsPanel.ConditionDropdown:SetPoint("LEFT", app.LoadConditionsPanel.TopText2, "RIGHT", 6, 0)
	app.LoadConditionsPanel.ConditionDropdown:SetupMenu(primaryConditionGenerator)

	app.LoadConditionsPanel.TopText3 = app.LoadConditionsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	app.LoadConditionsPanel.TopText3:SetPoint("LEFT", app.LoadConditionsPanel.ConditionDropdown, "RIGHT", 6, 0)

	app.LoadConditionsPanel.List = CreateFrame("Frame", nil, app.LoadConditionsPanel)
	app.LoadConditionsPanel.List:SetPoint("LEFT", app.LoadConditionsPanel, 18, 0)
	app.LoadConditionsPanel.List:SetPoint("TOP", app.LoadConditionsPanel.ConditionDropdown, "BOTTOM")
	app.LoadConditionsPanel.List:SetPoint("BOTTOMRIGHT", app.LoadConditionsPanel, 0, 30)

	local scrollBox = CreateFrame("Frame", nil, app.LoadConditionsPanel.List, "WowScrollBoxList")
	scrollBox:SetPoint("TOPLEFT", app.LoadConditionsPanel.List, 2, -6)
	scrollBox:SetPoint("BOTTOMRIGHT", app.LoadConditionsPanel.List, -18, 4)
	scrollBox:EnableMouse(true)
	scrollBox:RegisterForDrag("LeftButton")
	scrollBox:SetScript("OnDragStart", function() app.AddonListFrame:StartMoving() end)
	scrollBox:SetScript("OnDragStop", function() app.AddonListFrame:StopMovingOrSizing() end)

	local scrollBar = CreateFrame("EventFrame", nil, app.LoadConditionsPanel.List, "MinimalScrollBar")
	scrollBar:SetPoint("TOPLEFT", scrollBox, "TOPRIGHT")
	scrollBar:SetPoint("BOTTOMLEFT", scrollBox, "BOTTOMRIGHT")

	app.LoadConditionsList = CreateScrollBoxListTreeListView()
	ScrollUtil.InitScrollBoxListWithScrollBar(scrollBox, scrollBar, app.LoadConditionsList)

	local function conditionInitializer(listItem, node)
		listItem:EnableMouse(true)
		listItem:RegisterForDrag("LeftButton")
		listItem:SetScript("OnDragStart", function() app.AddonListFrame:StartMoving() end)
		listItem:SetScript("OnDragStop", function() app.AddonListFrame:StopMovingOrSizing() end)

		local data = node:GetData()

		if app.Flag.SelectedProfile then
			if app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition and app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionState and
			((type(app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionValue) == "string" and app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionValue ~= "") or (type(app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionValue) == "table" and next(app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionValue) ~= nil) or type(app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionValue) == "number") then
				listItem.Icon:SetText(app.IconReady)
				listItem.Icon:SetScript("OnEnter", function(self)
					GameTooltip:ClearLines()
					GameTooltip:SetOwner(self, "ANCHOR_NONE")
					GameTooltip:SetPoint("RIGHT", self, "LEFT")
					GameTooltip:AddLine(L.LOADCONDITION_VALID)
					GameTooltip:Show()
				end)
				app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].valid = true
			else
				listItem.Icon:SetText(app.IconNotReady)
				listItem.Icon:SetScript("OnEnter", function(self)
					GameTooltip:ClearLines()
					GameTooltip:SetOwner(self, "ANCHOR_NONE")
					GameTooltip:SetPoint("RIGHT", self, "LEFT")
					GameTooltip:AddLine(L.LOADCONDITION_INCOMPLETE)
					GameTooltip:Show()
				end)
				app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].valid = false
			end
			listItem.Icon:SetScript("OnLeave", function(self)
				GameTooltip:Hide()
			end)

			local function isSelected(index)
				return app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition == index
			end
			local function setSelected(index)
				app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id] = app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id] or {}
				app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition = index
				app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionState = nil
				if index == app.Enum.Condition.Character or index == app.Enum.Condition.Profession then
					app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionValue = {}
				elseif index == app.Enum.Condition.Name or index == app.Enum.Condition.Level or index == app.Enum.Condition.Realm then
					app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionValue = ""
				end
				app:UpdateLoadConditionsList()
			end
			function primaryConditionGenerator(owner, rootDescription)
				for i = 1, 100 do
					if not L.CONDITION[i] then break end
					rootDescription:CreateRadio(L.CONDITION[i], isSelected, setSelected, i)
				end
			end
			listItem.Dropdown1:SetupMenu(primaryConditionGenerator)

			local function isSelected(index)
				return app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionState == index
			end
			local function setSelected(index)
				app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionState = index
				app:UpdateLoadConditionsList()
			end
			function secondaryConditionGenerator(owner, rootDescription)
				for i = 1, 100 do
					if not L.CONDITIONSTATE[i] then break end
					if app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition and app.ValidStates[app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition][i] then
						rootDescription:CreateRadio(L.CONDITIONSTATE[i], isSelected, setSelected, i)
					end
				end
			end
			listItem.Dropdown2:SetupMenu(secondaryConditionGenerator)

			if app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition then
				if app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition == app.Enum.Condition.Character
				or app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition == app.Enum.Condition.Profession then
					listItem.Dropdown3:Show()
					listItem.Editbox1:Hide()
				elseif app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition == app.Enum.Condition.Name
				or app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition == app.Enum.Condition.Level
				or app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition == app.Enum.Condition.Realm then
					listItem.Dropdown3:Hide()
					listItem.Editbox1:Show()
					listItem.Editbox1:SetText(app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionValue)
				end
			else
				listItem.Dropdown3:Hide()
				listItem.Editbox1:Hide()
			end

			listItem.Editbox1:SetScript("OnEditFocusLost", function(self)
				local value = self:GetText() or ""
				value = value:match("^%s*(.-)%s*$") -- Trim trailing whitespaces
				if app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition == app.Enum.Condition.Level and value ~= "" then
					value = tonumber(value)
					if not value then value = 0 end
				elseif app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition == app.Enum.Condition.Name and value ~= "" then
					value = value:gsub("[%d%p]", "") -- Remove numbers and punctuation
					value = value:match("^%s*(.-)%s*$") -- Trim trailing whitespaces
				elseif app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition == app.Enum.Condition.Realm and value ~= "" then
					value = value:gsub("%d", "") -- Remove numbers
					value = value:match("^%s*(.-)%s*$") -- Trim trailing whitespaces
				end
				app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionValue = value
				app:UpdateLoadConditionsList()
			end)

			local function isSelected(index)
				return app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionValue[index]
			end
			local function setSelected(index)
				if not app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionValue[index] then
					app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionValue[index] = true
				else
					app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionValue[index] = nil
				end
				app:UpdateLoadConditionsList()
			end
			function tertiaryConditionGenerator(owner, rootDescription)
				if app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition then
					if app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition == app.Enum.Condition.Character then
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
								rootDescription:CreateCheckbox(label, isSelected, setSelected, char.guid)
							end
						end

						rootDescription:SetGridMode(MenuConstants.VerticalGridDirection)
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
					elseif app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition == app.Enum.Condition.Profession then
						rootDescription:SetGridMode(MenuConstants.VerticalGridDirection)
						for _, profession in ipairs(app.Professions) do
							rootDescription:CreateCheckbox(profession.icon .. " " .. C_TradeSkillUI.GetProfessionInfoBySkillLineID(profession.tradeSkillLineID).professionName, isSelected, setSelected, profession.tradeSkillLineID)
						end
					end
				end
			end
			listItem.Dropdown3:SetupMenu(tertiaryConditionGenerator)

			listItem.RemoveButton:SetScript("OnClick", function()
				table.remove(app.Data.Profiles[app.Flag.SelectedProfile].loadConditions, data.id)
				app:UpdateLoadConditionsList()
			end)
			listItem.AddButton:SetScript("OnClick", function()
				table.insert(app.Data.Profiles[app.Flag.SelectedProfile].loadConditions, {})
				app:UpdateLoadConditionsList()
			end)
			if data.id == 1 and #app.Data.Profiles[app.Flag.SelectedProfile].loadConditions == 1 then
				listItem.RemoveButton:Disable()
			else
				listItem.RemoveButton:Enable()
			end
		end
	end

	app.LoadConditionsList:SetElementInitializer("SlackersAddonDepot_LoadCondition", conditionInitializer)

	app.LoadConditionsPanel.RevertOrCancelButton = app:MakeButton(app.LoadConditionsPanel, "")
	app.LoadConditionsPanel.RevertOrCancelButton:SetPoint("BOTTOMRIGHT", app.LoadConditionsPanel, -6, 8)

	app.LoadConditionsPanel.ApplyButton = app:MakeButton(app.LoadConditionsPanel, L.APPLY_CHANGES)
	app.LoadConditionsPanel.ApplyButton:SetPoint("RIGHT", app.LoadConditionsPanel.RevertOrCancelButton, "LEFT", -2, 0)
	app.LoadConditionsPanel.ApplyButton:SetScript("OnClick", function()
		-- Update load conditions execution
		app.LoadConditionsPanel:Hide()
	end)

	app.LoadConditionsPanel:SetFlattensRenderLayers(true)
end

function app:UpdateLoadConditionsList(onShow)
	if onShow then
		app.LoadConditionsPanel.ApplyButton:Disable()
		app:UpdateButton(app.LoadConditionsPanel.RevertOrCancelButton, L.CANCEL)
		app.LoadConditionsPanel.RevertOrCancelButton:SetScript("OnClick", function()
			app.LoadConditionsPanel:Hide()
		end)
	else
		app.LoadConditionsPanel.ApplyButton:Enable()
		app:UpdateButton(app.LoadConditionsPanel.RevertOrCancelButton, L.REVERT .. "  " .. CreateAtlasMarkup("common-icon-undo"))
		app.LoadConditionsPanel.RevertOrCancelButton:SetScript("OnClick", function()
			app.Data.Profiles[app.Flag.SelectedProfile].loadConditions = CopyTable(app.CachedLoadConditions, false)
			app:UpdateLoadConditionsList(true)
		end)
	end

	local DataProvider = CreateTreeDataProvider()

	for i, loadCondition in ipairs(app.Data.Profiles[app.Flag.SelectedProfile].loadConditions) do
		DataProvider:Insert({ id = i })
	end

	app.LoadConditionsList:SetDataProvider(DataProvider, true)
end
