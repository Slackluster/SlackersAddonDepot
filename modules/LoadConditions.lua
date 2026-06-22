-----------------------------------------------
-- Slacker's Addon Depot: LoadConditions.lua --
-----------------------------------------------

local appName, app = ...
local api = app.api
local L = app.locales

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		app.Cache.LoadConditions = app.Cache.LoadConditions or {}

		app:CreateLoadConditionsPanel()
	end
end)

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
