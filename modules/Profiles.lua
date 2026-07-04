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
		app.Enum = {
			Condition = {
				Character = 1,
				Name = 2,
				Level = 3,
				Realm = 4,
				Profession = 5,
			},
			ConditionState = {
				Any = 1,
				All = 2,
				IsLessThan = 3,
				Is = 4,
				IsGreaterThan = 5,
				IsNot = 6,
				StartsWith = 7,
				EndsWith = 8,
				Contains = 9,
				DoesNotContain = 10,
			},
		}
		app.ValidStates = {
			[app.Enum.Condition.Character] = {
				[app.Enum.ConditionState.Is] = true,
				[app.Enum.ConditionState.IsNot] = true,
			},
			[app.Enum.Condition.Name] = {
				[app.Enum.ConditionState.Is] = true,
				[app.Enum.ConditionState.IsNot] = true,
				[app.Enum.ConditionState.StartsWith] = true,
				[app.Enum.ConditionState.EndsWith] = true,
				[app.Enum.ConditionState.Contains] = true,
				[app.Enum.ConditionState.DoesNotContain] = true,
			},
			[app.Enum.Condition.Level] = {
				[app.Enum.ConditionState.IsLessThan] = true,
				[app.Enum.ConditionState.Is] = true,
				[app.Enum.ConditionState.IsGreaterThan] = true,
			},
			[app.Enum.Condition.Realm] = {
				[app.Enum.ConditionState.Is] = true,
				[app.Enum.ConditionState.IsNot] = true,
				[app.Enum.ConditionState.StartsWith] = true,
				[app.Enum.ConditionState.EndsWith] = true,
				[app.Enum.ConditionState.Contains] = true,
				[app.Enum.ConditionState.DoesNotContain] = true,
			},
			[app.Enum.Condition.Profession] = {
				[app.Enum.ConditionState.Is] = true,
				[app.Enum.ConditionState.IsNot] = true,
			},
		}

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
		app.LoadConditionsPanel.TopText3:SetText(string.format(L.LOADCONDITION_MATCH2, "|cffFFFFFF" .. app.Data.Profiles[app.Flag.SelectedProfile].name .. "|R"))
		app:UpdateLoadConditionsList()
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

	app.LoadConditionsPanel.CloseButton = CreateFrame("Button", nil, app.LoadConditionsPanel, "UIPanelCloseButton")
	app.LoadConditionsPanel.CloseButton:SetPoint("TOPRIGHT", app.LoadConditionsPanel)
	app.LoadConditionsPanel.CloseButton:SetScript("OnClick", function()
		app.LoadConditionsPanel:Hide()
	end)

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
	app.LoadConditionsPanel.List:SetPoint("BOTTOMRIGHT", app.LoadConditionsPanel, 0, 4)

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

		if app.Flag.SelectedProfile and app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition and app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionState and app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionValue then
			listItem.Icon:SetText(app.IconReady)
			listItem.Icon:SetScript("OnEnter", function(self)
				GameTooltip:ClearLines()
				GameTooltip:SetOwner(self, "ANCHOR_NONE")
				GameTooltip:SetPoint("RIGHT", self, "LEFT")
				GameTooltip:AddLine(L.LOADCONDITION_VALID)
				GameTooltip:Show()
			end)
		else
			listItem.Icon:SetText(app.IconNotReady)
			listItem.Icon:SetScript("OnEnter", function(self)
				GameTooltip:ClearLines()
				GameTooltip:SetOwner(self, "ANCHOR_NONE")
				GameTooltip:SetPoint("RIGHT", self, "LEFT")
				GameTooltip:AddLine(L.LOADCONDITION_INCOMPLETE)
				GameTooltip:Show()
			end)
		end
		listItem.Icon:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
		end)

		local function isSelected(index)
			if app.Flag.SelectedProfile then
				return app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition == index
			end
		end
		local function setSelected(index)
			app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id] = app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id] or {}
			app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition = index
			app:UpdateLoadConditionsList()
		end
		function primaryConditionGenerator(owner, rootDescription)
			for i = 1, 5 do
				rootDescription:CreateRadio(L.CONDITION[i], isSelected, setSelected, i)
			end
		end
		listItem.Dropdown1:SetupMenu(primaryConditionGenerator)

		local function isSelected(index)
			if app.Flag.SelectedProfile then
				return app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionState == index
			end
		end
		local function setSelected(index)
			app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].conditionState = index
			app:UpdateLoadConditionsList()
		end
		function secondaryConditionGenerator(owner, rootDescription)
			if app.Flag.SelectedProfile then
				for i = 1, 10 do
					if app.ValidStates[app.Data.Profiles[app.Flag.SelectedProfile].loadConditions[data.id].condition][i] then
						rootDescription:CreateRadio(L.CONDITIONSTATE[i], isSelected, setSelected, i)
					end
				end
			end
		end
		listItem.Dropdown2:SetupMenu(secondaryConditionGenerator)

		--listItem.Dropdown3

		listItem.RemoveButton:SetScript("OnClick", function()
			table.remove(app.Data.Profiles[app.Flag.SelectedProfile].loadConditions, data.id)
			app:UpdateLoadConditionsList()
		end)
		listItem.AddButton:SetScript("OnClick", function()
			table.insert(app.Data.Profiles[app.Flag.SelectedProfile].loadConditions, {})
			app:UpdateLoadConditionsList()
		end)
		if data.id == 1 then
			listItem.RemoveButton:Disable()
		else
			listItem.RemoveButton:Enable()
		end
	end

	app.LoadConditionsList:SetElementInitializer("SlackersAddonDepot_LoadCondition", conditionInitializer)

	app.LoadConditionsPanel:SetFlattensRenderLayers(true)
end

function app:UpdateLoadConditionsList()
	local DataProvider = CreateTreeDataProvider()

	if #app.Data.Profiles[app.Flag.SelectedProfile].loadConditions > 0 then
		for i, loadCondition in ipairs(app.Data.Profiles[app.Flag.SelectedProfile].loadConditions) do
			DataProvider:Insert({ id = i })
		end
	else
		DataProvider:Insert({ id = 1 })
	end

	app.LoadConditionsList:SetDataProvider(DataProvider, true)
end
