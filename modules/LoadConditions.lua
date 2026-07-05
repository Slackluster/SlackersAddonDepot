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
		-- Earlier version cleanup
		app.Data.LoadConditions = nil

		app:HookLogout()
		app:CreateNewCharPopup()
	end
end)

---------------------
-- LOAD CONDITIONS --
---------------------

function app:ShouldApplyLoadConditions()
	for _, profile in ipairs(app.Data.Profiles) do
		if profile.type == "Login" then
			for i, loadCondition in ipairs(profile.loadConditions) do
				if loadCondition.valid then
					return true
				end
			end
		end
	end
	return false
end

function app:CharacterMatchesLoadCondition(loadCondition, guid)
	local function character()
		if loadCondition.conditionState == app.Enum.ConditionState.IsAnyOf then
			return loadCondition.conditionValue[guid] and true or false
		elseif loadCondition.conditionState == app.Enum.ConditionState.IsNotAnyOf then
			return loadCondition.conditionValue[guid] and false or true
		end
	end

	local function nameOrRealm(name, realm)
		local charValue, conditionValue
		if name then
			charValue = app.Data.Characters[guid].name
			conditionValue = name
		elseif realm then
			charValue = app.Data.Characters[guid].realmNorm
			conditionValue = realm:gsub("[ %-.]", "")
		end

		if loadCondition.conditionState == app.Enum.ConditionState.Is then
			return charValue == conditionValue
		elseif loadCondition.conditionState == app.Enum.ConditionState.IsNot then
			return charValue ~= conditionValue
		elseif loadCondition.conditionState == app.Enum.ConditionState.StartsWith then
			return charValue:sub(1, #conditionValue) == conditionValue
		elseif loadCondition.conditionState == app.Enum.ConditionState.EndsWith then
			return charValue:sub(-#conditionValue) == conditionValue
		elseif loadCondition.conditionState == app.Enum.ConditionState.Contains then
			return charValue:find(conditionValue, 1, true)
		elseif loadCondition.conditionState == app.Enum.ConditionState.DoesNotContain then
			return charValue:find(conditionValue, 1, true) == nil
		end
	end

	local function level()
		if loadCondition.conditionState == app.Enum.ConditionState.IsLessThan then
			return app.Data.Characters[guid].level < loadCondition.conditionValue
		elseif loadCondition.conditionState == app.Enum.ConditionState.Is then
			return app.Data.Characters[guid].level == loadCondition.conditionValue
		elseif loadCondition.conditionState == app.Enum.ConditionState.IsGreaterThan then
			return app.Data.Characters[guid].level > loadCondition.conditionValue
		end
	end

	local function profession()
		if loadCondition.conditionState == app.Enum.ConditionState.IsAnyOf then
			for tradeSkillID, _ in pairs(loadCondition.conditionValue) do
				if app.Data.Characters[guid].professions[tradeSkillID] then
					return true
				end
			end
			return false
		elseif loadCondition.conditionState == app.Enum.ConditionState.IsNotAnyOf then
			for tradeSkillID, _ in pairs(loadCondition.conditionValue) do
				if app.Data.Characters[guid].professions[tradeSkillID] then
					return false
				end
			end
			return true
		end
	end

	local function class()
		if loadCondition.conditionState == app.Enum.ConditionState.IsAnyOf then
			return loadCondition.conditionValue[app.Data.Characters[guid].class] and true or false
		elseif loadCondition.conditionState == app.Enum.ConditionState.IsNotAnyOf then
			return not loadCondition.conditionValue[app.Data.Characters[guid].class] and false or true
		end
	end

	if loadCondition.condition == app.Enum.Condition.Character then
		return character()
	elseif loadCondition.condition == app.Enum.Condition.Name then
		return nameOrRealm(loadCondition.conditionValue, nil)
	elseif loadCondition.condition == app.Enum.Condition.Level then
		return level()
	elseif loadCondition.condition == app.Enum.Condition.Realm then
		return nameOrRealm(nil, loadCondition.conditionValue)
	elseif loadCondition.condition == app.Enum.Condition.Profession then
		return profession()
	elseif loadCondition.condition == app.Enum.Condition.Class then
		return class()
	end
end

function app:CharacterMatchesProfile(profileNo, guid)
	if app.Data.Profiles[profileNo].loadConditions.primary == app.Enum.ConditionState.Any then
		for _, loadCondition in ipairs(app.Data.Profiles[profileNo].loadConditions) do
			if loadCondition.valid then
				if app:CharacterMatchesLoadCondition(loadCondition, guid) then return true end
			end
		end
		return false
	elseif app.Data.Profiles[profileNo].loadConditions.primary == app.Enum.ConditionState.All then
		local validCount = 0
		for _, loadCondition in ipairs(app.Data.Profiles[profileNo].loadConditions) do
			if loadCondition.valid then
				validCount = validCount + 1
				if not app:CharacterMatchesLoadCondition(loadCondition, guid) then return false end
			end
		end
		return validCount > 0
	end
end

function app:ApplyProfile(profileNo, guid)
	for addon, _ in pairs(app.Data.Profiles[profileNo].addons) do
		C_AddOns.EnableAddOn(addon, guid)
	end
end

function app:ApplyLoadConditions(excludeCurrent)
	if not app:ShouldApplyLoadConditions() then return end

	local function applyProfiles(targetGuid)
		for profileNo, profile in ipairs(app.Data.Profiles) do
			if profile.type == "Login" then
				if app:CharacterMatchesProfile(profileNo, targetGuid) then
					app:ApplyProfile(profileNo, targetGuid)
				end
			end
		end
	end

	if excludeCurrent then
		for guid, _ in pairs(app.Data.Characters) do
			if guid ~= app.Info.GUID then
				for i = 1, C_AddOns.GetNumAddOns() do
					C_AddOns.DisableAddOn(i, guid)
				end
				C_AddOns.EnableAddOn("SlackersAddonDepot", guid)
				applyProfiles(guid)
			end
		end
	elseif not app.Flag.ApplyingOnLogout then
		app.Flag.ApplyingOnLogout = true
		for i = 1, C_AddOns.GetNumAddOns() do
			C_AddOns.DisableAddOn(i, nil)
		end
		C_AddOns.EnableAddOn("SlackersAddonDepot", nil)

		for guid, _ in pairs(app.Data.Characters) do
			applyProfiles(guid)
		end
	end
end

function app:HookLogout()
	app.Event:Register("PLAYER_CAMPING", function()
		app:ApplyLoadConditions()
	end)

	app.Event:Register("PLAYER_QUITING", function()
		app:ApplyLoadConditions()
	end)

	hooksecurefunc("Logout", function()
		app:ApplyLoadConditions()
	end)

	hooksecurefunc("ForceLogout", function()
		app:ApplyLoadConditions()
	end)

	hooksecurefunc("ForceQuit", function()
		app:ApplyLoadConditions()
	end)

	if not app.Flag.LogoutButtonHooked then
		local originalOnClick
		GameMenuFrame:HookScript("OnShow", function()
			for button in GameMenuFrame.buttonPool:EnumerateActive() do
				if button:GetText() == LOG_OUT or button:GetText() == EXIT_GAME then
					button:HookScript("OnClick", function()
						app:ApplyLoadConditions()
					end)
				end
			end
		end)
		app.Flag.LogoutButtonHooked = true
	end
end

-----------------------
-- UNSEEN CHARACTERS --
-----------------------

function app:CreateNewCharPopup()
	StaticPopupDialogs["SLACKERSADDONDEPOT_NEWCHAR"] = {
		text = L.LOADCONDITION_NEWCHAR1 .. "\n\n" .. L.LOADCONDITION_NEWCHAR2,
		button1 = L.RELOADUI,
		button2 = NO,
		whileDead = true,
		hasEditBox = false,
		OnShow = function(dialog)
			dialog:ClearAllPoints()
			dialog:SetPoint("CENTER", UIParent)
		end,
		OnAccept = function()
			app:ApplyLoadConditions()
			ReloadUI()
		end,
	}
end

app.Event:Register("PLAYER_ENTERING_WORLD", function(isInitialLogin, isReloadingUi)
	if isInitialLogin and app.Flag.NewChar and app:ShouldApplyLoadConditions() then
		StaticPopup_Show("SLACKERSADDONDEPOT_NEWCHAR")
	end
end)
