-------------------------------------
-- Slacker's Addon Depot: koKR.lua --
-------------------------------------
-- Korean (Korea) localisation
-- Translator(s):

if GetLocale() ~= "koKR" then return end
local appName, app = ...
local L = app.locales

-- Settings
-- L.SETTINGS_VERSION =                     GAME_VERSION_LABEL .. ":" -- "Version"
-- L.SETTINGS_SUPPORT_TEXTLONG =            "Developing this addon takes a significant amount of time and effort.\nPlease consider financially supporting the developer."
-- L.SETTINGS_SUPPORT_TEXT =                "Support"
-- L.SETTINGS_SUPPORT_BUTTON =              "Buy Me a Coffee" -- Brand name, if there isn't a localised version, keep it the way it is
-- L.SETTINGS_SUPPORT_DESC =                "Thank you!"
-- L.SETTINGS_HELP_TEXT =                   "Feedback & Help"
-- L.SETTINGS_HELP_BUTTON =                 "Discord" -- Brand name, if there isn't a localised version, keep it the way it is
-- L.SETTINGS_HELP_DESC =                   "Join the Discord server."
-- L.SETTINGS_URL_COPY =                    "Ctrl+C to copy:"
-- L.SETTINGS_URL_COPIED =                  "Link copied to clipboard"

-- L.SETTINGS_KEYSLASH_TITLE =              SETTINGS_KEYBINDINGS_LABEL .. " & Slash Commands" -- "Keybindings"
-- _G["BINDING_NAME_SAD_TOGGLELIST"] =      app.NameShort .. ": Toggle Addon List"
-- L.SLASH_OPEN_LIST =                      "Toggle the addon list"
-- L.SLASH_OPEN_SETTINGS =                  "Open the settings"

-- L.GENERAL =                              GENERAL -- "General"

-- L.SETTINGS_MINIMAP_TITLE =               "Show Minimap Icon"
-- L.SETTINGS_MINIMAP_DESC =                "Show the minimap icon. If you disable this, " .. app.NameShort .. " is still available from the Addon Compartment."
-- L.SETTINGS_REPLACE_MENU_BUTTON =         "Replace AddOns Button"
-- L.SETTINGS_REPLACE_MENU_BUTTON_DESC =    "Make the main menu's AddOns button open " .. app.NameLong .. "."
-- L.SETTINGS_LOAD_OUT_OF_DATE =            "Load out of date addons"
-- L.SETTINGS_LOAD_OUT_OF_DATE_DESC =       "This may cause errors from incompatible addons."

-- L.ADDON_LIST =                           "Addon List"

-- L.SETTINGS_CHARLIST_REALMS =             "Character List Realms"
-- L.SETTINGS_CHARLIST_REALMS_DESC =        "Categorize characters by realm."
-- L.SETTINGS_CHARLIST_SORT =               "Character List Sort"
-- L.SETTINGS_CHARLIST_SORT_DESC =          "Set the sorting method for the character list."
-- L.ALPHABETICAL =                         HOUSING_CHEST_SORT_TYPE_ALPHABETICAL -- "Alphabetical"
-- L.CLASS =                                CLASS -- "Class"

-- General
-- L.NEW_VERSION_AVAILABLE =                "There is a newer version of " .. app.NameLong .. " available:"
-- L.SETTINGS_TOOLTIP =                     app.NameLong .. "\n|cffFFFFFF" ..
--                                          app.IconLMB .. ": " .. L.SLASH_OPEN_LIST .. "\n" ..
--                                          app.IconRMB .. ": " .. L.SLASH_OPEN_SETTINGS

-- L.INVALID_COMMAND =                      "Invalid command."

-- Addon List
-- L.LISTSTYLE_CATEGORIES =                 CATEGORIES -- "Categories"
-- L.LISTSTYLE_ENABLESTATE =                "Enable State"
-- L.ENABLED =                              PVP_WAR_MODE_ENABLED -- "Enabled"
-- L.DISABLED =                             ADDON_DISABLED -- "Disabled"
-- L.CANCEL =                               CANCEL -- "Cancel"
-- L.APPLY_CHANGES =                        TRANSMOG_SITUATIONS_APPLY -- "Apply Changes"
-- L.ENABLE_ALL =                           ENABLE_ALL_ADDONS -- "Enable All"
-- L.DISABLE_ALL =                          DISABLE_ALL_ADDONS -- "Disable All"
-- L.OUT_OF_DATE =                          ADDON_INTERFACE_VERSION -- "Out of date"
-- L.INCOMPATIBLE =                         ADDON_INCOMPATIBLE -- "Incompatible"
-- L.REQUIRES_RELOAD =                      REQUIRES_RELOAD -- "Requires Reload"
-- L.CHANGE_PENDING =                       "Change Pending"
-- L.DEPENDENCIES =                         ADDON_DEPENDENCIES -- "Dependencies: " (note the included trailing space)
-- L.UNCATEGORIZED =                        STABLE_PET_UNCATEGORIZED -- "Uncategorized"
-- L.ALL =                                  ALL -- "All"
-- L.NOT_APPLICABLE =                       NOT_APPLICABLE -- "N/A"
