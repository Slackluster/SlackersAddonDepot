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
		app.Data.LoadConditions = app.Data.LoadConditions or {}
	end
end)
