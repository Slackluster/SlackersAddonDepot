-------------------------------------
-- Slacker's Addon Depot: zhCN.lua --
-------------------------------------
-- Chinese (Simplified, PRC) localisation
-- Translator(s): cikichen

if GetLocale() ~= "zhCN" then return end
local appName, app = ...
local L = app.locales

-- Core
L.NEW_VERSION_AVAILABLE =                "%s 有新版本可用：" -- %s becomes the addon name

L.DEBUG_ENABLED =                        "调试模式已启用"
L.DEBUG_DISABLED =                       "调试模式已禁用"
L.INVALID_COMMAND =                      "无效指令"

-- Settings
L.SETTINGS_VERSION =                     GAME_VERSION_LABEL .. ":" -- "Version"
L.SETTINGS_SUPPORT_TEXTLONG1 =           "开发这个插件需要大量的时间和精力。"
L.SETTINGS_SUPPORT_TEXTLONG2 =           "请考虑在经济上支持开发者。"
L.SETTINGS_SUPPORT_TEXT =                "支持"
L.SETTINGS_SUPPORT_BUTTON =              "Buy Me a Coffee" -- Brand name, if there isn't a localised version, keep it the way it is
L.SETTINGS_SUPPORT_DESC =                "谢谢！"
L.SETTINGS_HELP_TEXT =                   "反馈与帮助"
L.SETTINGS_HELP_BUTTON =                 "Discord" -- Brand name, if there isn't a localised version, keep it the way it is
L.SETTINGS_HELP_DESC =                   "加入 Discord 服务器。"
L.SETTINGS_URL_COPY =                    "按 Ctrl+C 复制："
L.SETTINGS_URL_COPIED =                  "链接已复制到剪贴板"

L.SETTINGS_KEYSLASH_TITLE =              SETTINGS_KEYBINDINGS_LABEL .. " & 斜杠命令" -- "Keybindings"
-- _G["BINDING_NAME_SAD_TOGGLELIST"] =      app.NameShort .. ": Toggle Addon List"
-- L.SLASH_OPEN_LIST =                      "Toggle the addon list"
L.SLASH_OPEN_SETTINGS =                  "打开设置"
-- L.SLASH_NAME_OR_NUMBER =                 "name or number"
-- L.SLASH_LOAD_PROFILE =                   "Ask to reload and activate the addon profile"
-- L.SLASH_FORCELOAD_PROFILE =              "Directly reload and activate the addon profile"

L.GENERAL =                              GENERAL -- "General"
L.SHOW_MINIMAP_ICON =                    "显示小地图图标"
L.SHOW_MINIMAP_ICON_DESC =               "显示小地图图标。禁用后仍可通过插件菜单访问。" -- %s becomes the addon name
-- L.REPLACE_ADDONS_MENU_BUTTON =           "Replace AddOns Button"
-- L.REPLACE_ADDONS_MENU_BUTTON_DESC =      "Make the main menu's AddOns button open %s." -- %s becomes the addon name

-- L.ADDON_LIST =                           "Addon List"
-- L.LOAD_OUT_OF_DATE =                     "Load Out of Date Addons"
-- L.LOAD_OUT_OF_DATE_DESC =                "This may cause errors from incompatible addons."
-- L.REMEMBER_UNINSTALLED_ADDONS =          "Remember Uninstalled Addons"
-- L.REMEMBER_UNINSTALLED_ADDONS_DESC =     "Keep uninstalled addons in profiles and remember their enable state."
-- L.CHARLIST_REALMS =                      "Character List Realms"
-- L.CHARLIST_REALMS_DESC =                 "Categorize characters by realm."
-- L.CHARLIST_RULESETS =                    "Character List Rulesets"
-- L.CHARLIST_RULESETS_DESC =               "Categorize characters by ruleset."
-- L.CHARLIST_SORT =                        "Character List Sort"
-- L.CHARLIST_SORT_DESC =                   "Set the sorting method for the character list."
-- L.ALPHABETICAL =                         HOUSING_CHEST_SORT_TYPE_ALPHABETICAL -- "Alphabetical"
-- L.CLASS =                                CLASS -- "Class"

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
-- L.DELETE_CHARACTER =                     "Delete the selected character"

-- Profiles
-- L.PROFILES =                             "Profiles"
-- L.LOGIN_PROFILE =                        "Login Profile"
-- L.LOGIN_PROFILES =                       "Login Profiles"
-- L.LOGIN_PROFILE_DESC1 =                  "Enables addons on login."
-- L.LOGIN_PROFILE_DESC2 =                  "Automatically applied to characters that meet load conditions. All matching profiles are applied."
-- L.STANDARD_PROFILE =                     "Standard Profile"
-- L.STANDARD_PROFILES =                    "Standard Profiles"
-- L.STANDARD_PROFILE_DESC1 =               "Enables addons in-game."
-- L.STANDARD_PROFILE_DESC2 =               "Manually applied to specific characters. Apply one profile at a time."

-- L.APPLY_PROFILE =                        "Apply profile to %s" -- %s becomes a character name
-- L.ADDONS =                               "Addons"
-- L.SAVE_ADDONS =                          "Save %d addons" -- %d becomes a number
-- L.NEW_PROFILE =                          "New profile"
-- L.ENABLE_PROFILE =                       "Enable profile"
-- L.RENAME_PROFILE =                       "Rename profile"
-- L.DELETE_PROFILE =                       "Delete profile"
-- L.PROFILE_NAME_NEW =                     "New profile name:"
-- L.PROFILE_NAME_EXISTS =                  "A profile with that name already exists."
-- L.PROFILE_NOT_FOUND =                    "Profile not found."
-- L.DELETE_NAME_Q =                        "Delete %s?" -- %s becomes a name
-- L.RELOAD_AND_ENABLE =                    "Reload and enable %s?" -- %s becomes a name

-- L.CONDITION = {}
-- L.CONDITION[1] =                         CHARACTER -- "Character"
-- L.CONDITION[2] =                         NAME -- "Name"
-- L.CONDITION[3] =                         LEVEL -- "Level"
-- L.CONDITION[4] =                         "Realm"
-- L.CONDITION[5] =                         TRANSMOG_SOURCE_6 -- "Profession"
-- L.CONDITION[6] =                         CLASS -- "Class"
-- L.CONDITION[7] =                         "Ruleset"
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
-- L.RULESET = {}
-- L.RULESET[1] =                           GDAPI_REALMTYPE_NORMAL -- "Normal"
-- L.RULESET[2] =                           GDAPI_REALMTYPE_PVP -- "PvP"
-- L.RULESET[3] =                           "Roleplay"
-- L.RULESET[4] =                           GUILD_PLAYSTYLE_HARDCORE -- "Hardcore"

-- L.LOADCONDITION_WARNING1 =               "WARNING:" -- Uppercase
-- L.LOADCONDITION_WARNING2 =               "Addons that are not in any matching Login Profiles will be disabled on login."
-- L.LOADCONDITION_MATCH1 =                 "Match" -- followed by an any/all dropdown
-- L.LOADCONDITION_MATCH2 =                 "of these conditions for profile %s:" -- preceded by an any/all dropdown, %s becomes a profile name
-- L.LOADCONDITION_VALID =                  "Load condition is valid."
-- L.LOADCONDITION_INCOMPLETE =             "Load condition is incomplete."

-- L.LOADCONDITION_NEWCHAR1 =               "%s has not seen this character before (so sad)." -- You can omit the (so sad) joke if it doesn't work in your language, %s becomes the addon name
-- L.LOADCONDITION_NEWCHAR2 =               "Reload to apply Login Profiles?"
