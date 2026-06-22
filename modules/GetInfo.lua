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
		app:GetAddonInfo()
		app:GetCharacterInfo()
	end
end)

----------------
-- ADDON INFO --
----------------

function app:GetAddonInfo()
	app.Info = {}
	app.Info.AddonList = {}

	for i = 1, C_AddOns.GetNumAddOns() do
		local name, title, notes = C_AddOns.GetAddOnInfo(i)
		table.insert(app.Info.AddonList, { id = i, iconTexture = C_AddOns.GetAddOnMetadata(i, "IconTexture"), iconAtlas = C_AddOns.GetAddOnMetadata(i, "IconAtlas"), name = name, title = title, notes = notes, version = C_AddOns.GetAddOnMetadata(i, "Version"), interface = C_AddOns.GetAddOnInterfaceVersion(i), author = C_AddOns.GetAddOnMetadata(i, "Author"), category = C_AddOns.GetAddOnMetadata(i, "Category"), dependencies = C_AddOns.GetAddOnDependencies(i) })
		-- + Addon cache for history
	end
end

--------------------
-- CHARACTER INFO --
--------------------

function app:GetCharacterInfo()
	app.Info.GUID = UnitGUID("player")
	local _, englishClass, _, _, _, name = GetPlayerInfoByGUID(app.Info.GUID)
	local _, _, _, classColor = GetClassColor(englishClass)
	local prof1, prof2, archaeology, fishing, cooking = GetProfessions()

	app.Data.Characters = app.Data.Characters or {}
	if app.Info.GUID then
		app.Data.Characters[app.Info.GUID] = {
			guid = app.Info.GUID,
			name = name or "",
			realm = GetRealmName() or "",
			realmNorm = GetNormalizedRealmName() or "",
			class = englishClass or "",
			classColor = classColor or "",
			level = UnitLevel("player") or 0,
			professions = { prof1 = prof1 or 0, prof2 = prof2 or 0, cooking = cooking or 0, fishing = fishing or 0, archaeology = archaeology or 0 }
		}
	end
end

app.Event:Register("PLAYER_ENTERING_WORLD", function(isInitialLogin, isReloadingUi)
	if isInitialLogin or isReloadingUi then
		app:GetCharacterInfo()
	end
end)

app.Event:Register("PLAYER_LEVEL_UP", function(level, healthDelta, powerDelta, numNewTalents, numNewPvpTalentSlots, strengthDelta, agilityDelta, staminaDelta, intellectDelta)
	app.Data.Characters[app.Info.GUID].level = level
end)

app.Event:Register("SKILL_LINES_CHANGED", function()
	local prof1, prof2, archaeology, fishing, cooking = GetProfessions()
	app.Data.Characters[app.Info.GUID].professions = { prof1 = prof1, prof2 = prof2, cooking = cooking, fishing = fishing, archaeology = archaeology }
end)
