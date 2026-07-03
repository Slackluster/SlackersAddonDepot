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
		table.insert(app.Data.Profiles, { name = app.NewProfilePanel.ProfileNameEditbox:GetText(), type = "Login", addons = {}, loadConditions = {} })
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

	app.LoadConditionsPanel.TitleContainer.TitleText:SetText(app.NameLong .. ": Load Conditions")

	app.LoadConditionsPanel.CloseButton = CreateFrame("Button", nil, app.LoadConditionsPanel, "UIPanelCloseButton")
	app.LoadConditionsPanel.CloseButton:SetPoint("TOPRIGHT", app.LoadConditionsPanel)
	app.LoadConditionsPanel.CloseButton:SetScript("OnClick", function()
		app.LoadConditionsPanel:Hide()
	end)

	app.LoadConditionsPanel.TopText1 = app.LoadConditionsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	app.LoadConditionsPanel.TopText1:SetPoint("TOPLEFT", 20, -40)
	app.LoadConditionsPanel.TopText1:SetText("Match")

	-- app.Flag.SelectedProfile

	function primaryAnyAllGenerator(owner, rootDescription, id)
		rootDescription:CreateButton("Any", function(data)
			print(owner:GetName())
		end)
		rootDescription:CreateButton("All", function(data)
			print(owner:GetName())
		end)
	end
	app.LoadConditionsPanel.ConditionDropdown = CreateFrame("DropdownButton", "Primary", app.LoadConditionsPanel, "WowStyle1DropdownTemplate")
	-- if app.Settings["headerStyle"] == 1 then
	-- 	app.AddonListFrame.ListStyleDropdown:SetDefaultText(L.CATEGORIES)
	-- elseif app.Settings["headerStyle"] == 2 then
	-- 	app.AddonListFrame.ListStyleDropdown:SetDefaultText(L.ENABLESTATE)
	-- end
	app.LoadConditionsPanel.ConditionDropdown:SetWidth(60)
	app.LoadConditionsPanel.ConditionDropdown:SetPoint("LEFT", app.LoadConditionsPanel.TopText1, "RIGHT", 10, 0)
	app.LoadConditionsPanel.ConditionDropdown:SetupMenu(primaryAnyAllGenerator)

	app.LoadConditionsPanel.TopText2 = app.LoadConditionsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	app.LoadConditionsPanel.TopText2:SetPoint("LEFT", app.LoadConditionsPanel.ConditionDropdown, "RIGHT", 10, 0)
	app.LoadConditionsPanel.TopText2:SetText("of these conditions:")
end
