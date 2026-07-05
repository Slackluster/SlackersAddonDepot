-------------------------------------
-- Slacker's Addon Depot: zhCN.lua --
-------------------------------------
-- Chinese (Simplified, PRC) localisation
-- Translator(s):

if GetLocale() ~= "zhCN" then return end
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
-- L.INSTALLED =                            "Installed"
-- L.CATEGORIES =                           CATEGORIES -- "Categories"
-- L.CATEGORIES_WIKI =                      L.CATEGORIES .. " (Wiki)"
-- L.ENABLESTATE =                          "Enable State"
-- L.ENABLED =                              PVP_WAR_MODE_ENABLED -- "Enabled"
-- L.DISABLED =                             ADDON_DISABLED -- "Disabled"
-- L.CANCEL =                               CANCEL -- "Cancel"
-- L.APPLY_CHANGES =                        TRANSMOG_SITUATIONS_APPLY -- "Apply Changes"
-- L.RELOADUI =                             RELOADUI -- "Reload UI"
-- L.ENABLE_ALL =                           ENABLE_ALL_ADDONS -- "Enable All"
-- L.DISABLE_ALL =                          DISABLE_ALL_ADDONS -- "Disable All"
-- L.REVERT =                               COOLDOWN_VIEWER_SETTINGS_BUTTON_REVERT_CHANGES -- "Revert"
-- L.OUT_OF_DATE =                          ADDON_INTERFACE_VERSION -- "Out of date"
-- L.INCOMPATIBLE =                         ADDON_INCOMPATIBLE -- "Incompatible"
-- L.REQUIRES_RELOAD =                      REQUIRES_RELOAD -- "Requires Reload"
-- L.DEPENDENCY_DISABLED =                  ADDON_DEP_DISABLED -- "Dependency disabled"
-- L.DEPENDENCY_MISSING =                   ADDON_DEP_MISSING -- "Dependency missing"
-- L.CHANGE_PENDING =                       "Change Pending"
-- L.DEPENDENCIES =                         ADDON_DEPENDENCIES -- "Dependencies: " (note the included trailing space)
-- L.UNCATEGORIZED =                        STABLE_PET_UNCATEGORIZED -- "Uncategorized"
-- L.ALL =                                  ALL -- "All"
-- L.NOT_APPLICABLE =                       NOT_APPLICABLE -- "N/A"

-- Profiles
-- L.PROFILES =                             "Profiles"
-- L.LOGIN_PROFILE =                        "Login Profile"
-- L.LOGIN_PROFILES =                       "Login Profiles"
-- L.LOGIN_PROFILE_DESC =                   "Enables addons on login.\n\nAutomatically applied to characters that meet load conditions. All matching profiles are applied."
-- L.STANDARD_PROFILE =                     "Standard Profile"
-- L.STANDARD_PROFILES =                    "Standard Profiles"
-- L.STANDARD_PROFILE_DESC =                "Enables addons in-game.\n\nManually applied to specific characters. Apply one profile at a time."

-- L.APPLY_PROFILE =                        "Apply profile to %s" -- %s becomes a character name
-- L.ADDONS =                               "Addons"
-- L.SAVE_ADDONS =                          "Save %d addons" -- %d becomes a number
-- L.NEW_PROFILE =                          "New profile"
-- L.RENAME_PROFILE =                       "Rename profile"
-- L.DELETE_PROFILE =                       "Delete profile"
-- L.PROFILE_NAME_NEW =                     "New profile name:"
-- L.PROFILE_NAME_EXISTS =                  "A profile with that name already exists."
-- L.DELETE_PROFILE_Q =                     "Delete %s?" -- %s becomes a profile name

-- L.CONDITION = {}
-- L.CONDITION[1] =                         CHARACTER -- "Character"
-- L.CONDITION[2] =                         NAME -- "Name"
-- L.CONDITION[3] =                         LEVEL -- "Level"
-- L.CONDITION[4] =                         "Realm"
-- L.CONDITION[5] =                         TRANSMOG_SOURCE_6 -- "Profession"
-- L.CONDITION[6] =                         CLASS -- "Class"
-- L.CONDITIONSTATE = {}
-- L.CONDITIONSTATE[1] =                    "any"
-- L.CONDITIONSTATE[2] =                    "all"
-- L.CONDITIONSTATE[3] =                    "is less than"
-- L.CONDITIONSTATE[4] =                    "is"
-- L.CONDITIONSTATE[5] =                    "is any of"
-- L.CONDITIONSTATE[6] =                    "is greater than"
-- L.CONDITIONSTATE[7] =                    "is not"
-- L.CONDITIONSTATE[8] =                    "is not any of"
-- L.CONDITIONSTATE[9] =                    "starts with"
-- L.CONDITIONSTATE[10] =                   "ends with"
-- L.CONDITIONSTATE[11] =                   "contains"
-- L.CONDITIONSTATE[12] =                   "does not contain"
-- L.LOADCONDITION_WARNING1 =               "WARNING:" -- Uppercase
-- L.LOADCONDITION_WARNING2 =               "Addons that are not in any matching Login Profiles will be disabled on login."
-- L.LOADCONDITION_MATCH1 =                 "Match" -- followed by an any/all dropdown
-- L.LOADCONDITION_MATCH2 =                 "of these conditions for profile %s:" -- preceded by an any/all dropdown, %s becomes a profile name
-- L.LOADCONDITION_VALID =                  "Load condition is valid."
-- L.LOADCONDITION_INCOMPLETE =             "Load condition is incomplete."

-- L.LOADCONDITION_NEWCHAR1 =               app.NameLong .. " has not seen this character before (so sad)." -- You can omit the (so sad) joke if it doesn't work in your language
-- L.LOADCONDITION_NEWCHAR2 =               "Reload to apply Login Profiles?"
