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
		table.insert(app.Info.AddonList, { iconTexture = C_AddOns.GetAddOnMetadata(i, "IconTexture"), iconAtlas = C_AddOns.GetAddOnMetadata(i, "IconAtlas"), title = C_AddOns.GetAddOnTitle(i), name = C_AddOns.GetAddOnName(i), category = C_AddOns.GetAddOnMetadata(i, "Category"), dependencies = C_AddOns.GetAddOnDependencies(i), enabledCharacter = C_AddOns.GetAddOnEnableState(i, UnitGUID("player")), enabledAll = C_AddOns.GetAddOnEnableState(i) })
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
