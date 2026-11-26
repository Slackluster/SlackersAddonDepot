------------------------------------
-- Slacker's Addon Depot: API.lua --
------------------------------------

-- Load an addon profile
-- profileNameOrNo: string or number, string will match case-insensitive
-- force: boolean, optional, defaults to false, will ask for confirmation if false, will immediately reload if true
SlackersAddonDepot:LoadProfile(profileNameOrNo, force)

-- (Re)apply all valid login profiles to all characters including the current one, then reload
SlackersAddonDepot:ApplyLoginProfiles()
