-------------------------------------
-- Slacker's Addon Depot: GetInfo.lua
-------------------------------------

local appName, app = ...
local api = app.api
local L = app.locales

-------------
-- ON LOAD --
-------------

app.Event:Register("ADDON_LOADED", function(addOnName, containsBindings)
	if addOnName == appName then
		app.Info = {}
		app:GetAddonInfo()
		--app:GetCharacterInfo()
	end
end)



----------------
-- ADDON INFO --
----------------

function app:GetAddonInfo()
	app.Info.AddonList = {}

	for i = 1, C_AddOns.GetNumAddOns() do
		local name, title, notes = C_AddOns.GetAddOnInfo(i)
		table.insert(app.Info.AddonList, { id = i, iconTexture = C_AddOns.GetAddOnMetadata(i, "IconTexture"), iconAtlas = C_AddOns.GetAddOnMetadata(i, "IconAtlas"), name = name, title = title, notes = notes, version = C_AddOns.GetAddOnMetadata(i, "Version"), interface = C_AddOns.GetAddOnInterfaceVersion(i), category = C_AddOns.GetAddOnMetadata(i, "Category"), dependencies = C_AddOns.GetAddOnDependencies(i), enabledCharacter = C_AddOns.GetAddOnEnableState(i, UnitGUID("player")), enabledAll = C_AddOns.GetAddOnEnableState(i) })
		-- + Addon cache for history
	end
end

--------------------
-- CHARACTER INFO --
--------------------

function app:GetCharacterInfo()
	app.Cache.Characters = {}
	app.Cache.Characters[UnitGUID("player")] = {}
end
