-------------------------------------
-- Slacker's Addon Depot: zhTW.lua --
-------------------------------------
-- Chinese (Traditional, Taiwan) localisation
-- Translator(s):

if GetLocale() ~= "zhTW" then return end
local appName, app = ...
local L = app.locales

-- Core
L.NEW_VERSION_AVAILABLE =                "%s 有新版本可用：" -- %s becomes the addon name

L.DEBUG_ENABLED =                        "除錯模式已啟用"
L.DEBUG_DISABLED =                       "除錯模式已停用"
L.INVALID_COMMAND =                      "指令無效"

-- Settings
L.VERSION =                              GAME_VERSION_LABEL .. "：" -- "Version"
L.SUPPORT_TEXTLONG1 =                    "開發這個插件需要投入大量的時間與心力。"
L.SUPPORT_TEXTLONG2 =                    "歡迎考慮以金錢支持開發者。"
L.SUPPORT =                              "支持"
L.BUY_ME_A_COFFEE =                      "Buy Me a Coffee" -- Brand name, if there isn't a localised version, keep it the way it is
L.THANK_YOU =                            "謝謝！"
L.FEEDBACK_AND_HELP =                    "意見回饋與協助"
L.DISCORD =                              "Discord" -- Brand name, if there isn't a localised version, keep it the way it is
L.JOIN_DISCORD_SERVER =                  "加入 Discord 伺服器。"
L.CTRL_C_COPY =                          "按 Ctrl+C 複製："
L.LINK_COPIED =                          "連結已複製到剪貼簿"

L.KEYBINDINGS_AND_SLASH_COMMANDS =       SETTINGS_KEYBINDINGS_LABEL .. " & 斜線指令" -- "Keybindings"
_G["BINDING_NAME_SAD_TOGGLELIST"] =      app.NameShort .. ": 切換插件清單"
L.TOGGLE_ADDON_LIST =                    "切換插件清單"
L.OPEN_SETTINGS =                        "開啟設定"
L.NAME_OR_NUMBER =                       "名稱或數字"
L.LOAD_PROFILE =                         "詢問是否重新載入並啟用插件設定檔"
L.FORCELOAD_PROFILE =                    "直接重新載入並啟用插件設定檔"
L.APPLY_PROFILES =                       "（重新）套用登入設定檔並重新載入"

L.GENERAL =                              GENERAL -- "General"
L.SHOW_MINIMAP_ICON =                    "顯示小地圖圖示"
L.SHOW_MINIMAP_ICON_DESC =               "顯示小地圖圖示。即使停用，仍可從插件選單開啟 %s。" -- %s becomes the addon name
L.REPLACE_ADDONS_MENU_BUTTON =           "取代 AddOns 按鈕"
L.REPLACE_ADDONS_MENU_BUTTON_DESC =      "讓主選單的 AddOns 按鈕開啟 %s。" -- %s becomes the addon name

L.ADDON_LIST =                           "插件清單"
L.LOAD_OUT_OF_DATE =                     "載入過期插件"
L.LOAD_OUT_OF_DATE_DESC =                "這可能導致與不相容的插件發生錯誤。"
L.REMEMBER_UNINSTALLED_ADDONS =          "記住未安裝的插件"
L.REMEMBER_UNINSTALLED_ADDONS_DESC =     "在設定檔中保留尚未安裝的插件，並記住它們的啟用狀態。"
L.CHARLIST_REALMS =                      "角色清單的伺服器"
L.CHARLIST_REALMS_DESC =                 "依伺服器分類角色。"
L.CHARLIST_RULESETS =                    "角色清單的規則集"
L.CHARLIST_RULESETS_DESC =               "依規則集分類角色。"
L.CHARLIST_SORT =                        "角色清單排序"
L.CHARLIST_SORT_DESC =                   "設定角色清單的排序方式。"
L.ALPHABETICAL =                         HOUSING_CHEST_SORT_TYPE_ALPHABETICAL -- "Alphabetical"
L.CLASS =                                CLASS -- "Class"

-- Addon List
L.INSTALLED =                            "已安裝"
L.CATEGORIES =                           CATEGORIES -- "Categories"
L.CATEGORIES_WIKI =                      L.CATEGORIES .. " (Wiki)"
L.ENABLESTATE =                          "啟用狀態"
L.ENABLED =                              PVP_WAR_MODE_ENABLED -- "Enabled"
L.DISABLED =                             ADDON_DISABLED -- "Disabled"
L.CANCEL =                               CANCEL -- "Cancel"
L.APPLY_CHANGES =                        TRANSMOG_SITUATIONS_APPLY -- "Apply Changes"
L.RELOADUI =                             RELOADUI -- "Reload UI"
L.REAPPLY =                              "（重新）套用"
L.ENABLE_ALL =                           ENABLE_ALL_ADDONS -- "Enable All"
L.DISABLE_ALL =                          DISABLE_ALL_ADDONS -- "Disable All"
L.REVERT =                               COOLDOWN_VIEWER_SETTINGS_BUTTON_REVERT_CHANGES -- "Revert"
L.OUT_OF_DATE =                          ADDON_INTERFACE_VERSION -- "Out of date"
L.INCOMPATIBLE =                         ADDON_INCOMPATIBLE -- "Incompatible"
L.REQUIRES_RELOAD =                      REQUIRES_RELOAD -- "Requires Reload"
L.DEPENDENCY_DISABLED =                  ADDON_DEP_DISABLED -- "Dependency disabled"
L.DEPENDENCY_MISSING =                   ADDON_DEP_MISSING -- "Dependency missing"
L.CHANGE_PENDING =                       "等待套用的變更"
L.DEPENDENCIES =                         ADDON_DEPENDENCIES -- "Dependencies: " (note the included trailing space)
L.UNCATEGORIZED =                        STABLE_PET_UNCATEGORIZED -- "Uncategorized"
L.ALL =                                  ALL -- "All"
L.NOT_APPLICABLE =                       NOT_APPLICABLE -- "N/A"
L.DELETE_CHARACTER =                     "刪除選取的角色"

-- Profiles
L.PROFILES =                             "設定檔"
L.LOGIN_PROFILE =                        "登入設定檔"
L.LOGIN_PROFILES =                       "登入設定檔"
L.LOGIN_PROFILE_DESC1 =                  "登入時啟用插件。"
L.LOGIN_PROFILE_DESC2 =                  "自動套用至符合載入條件的角色。會套用所有符合的設定檔。"
L.STANDARD_PROFILE =                     "標準設定檔"
L.STANDARD_PROFILES =                    "標準設定檔"
L.STANDARD_PROFILE_DESC1 =               "在遊戲中啟用插件。"
L.STANDARD_PROFILE_DESC2 =               "手動套用至指定角色。一次只套用一個設定檔。"

L.SET_LOAD_CONDITIONS =                  "設定載入條件"
L.APPLY_PROFILE =                        "將設定檔套用至 %s" -- %s becomes a character name
L.ADDONS =                               "插件"
L.SAVE_ADDONS =                          "儲存 %d 個插件" -- %d becomes a number
L.NEW_PROFILE =                          "新設定檔"
L.ENABLE_PROFILE =                       "啟用設定檔"
L.RENAME_PROFILE =                       "重新命名設定檔"
L.DELETE_PROFILE =                       "刪除設定檔"
L.PROFILE_NAME_NEW =                     "新設定檔名稱："
L.PROFILE_NAME_EXISTS =                  "已經有相同名稱的設定檔。"
L.PROFILE_NOT_FOUND =                    "找不到設定檔。"
L.DELETE_NAME_Q =                        "刪除 %s？" -- %s becomes a name
L.RELOAD_AND_ENABLE =                    "重新載入並啟用 %s？" -- %s becomes a name

L.CONDITION = {}
L.CONDITION[1] =                         CHARACTER -- "Character"
L.CONDITION[2] =                         NAME -- "Name"
L.CONDITION[3] =                         LEVEL -- "Level"
L.CONDITION[4] =                         "伺服器"
L.CONDITION[5] =                         TRANSMOG_SOURCE_6 -- "Profession"
L.CONDITION[6] =                         CLASS -- "Class"
L.CONDITION[7] =                         "規則集"
L.CONDITIONSTATE = {}
L.CONDITIONSTATE[1] =                    "任一"
L.CONDITIONSTATE[2] =                    "全部"
L.CONDITIONSTATE[3] =                    "小於"
L.CONDITIONSTATE[4] =                    "等於"
L.CONDITIONSTATE[5] =                    "屬於其中之一"
L.CONDITIONSTATE[6] =                    "大於"
L.CONDITIONSTATE[7] =                    "不等於"
L.CONDITIONSTATE[8] =                    "不屬於其中任何一個"
L.CONDITIONSTATE[9] =                    "開頭為"
L.CONDITIONSTATE[10] =                   "結尾為"
L.CONDITIONSTATE[11] =                   "包含"
L.CONDITIONSTATE[12] =                   "不包含"
L.RULESET = {}
L.RULESET[1] =                           GDAPI_REALMTYPE_NORMAL -- "Normal"
L.RULESET[2] =                           GDAPI_REALMTYPE_PVP -- "PvP"
L.RULESET[3] =                           "角色扮演"
L.RULESET[4] =                           "角色扮演 PvP"
L.RULESET[5] =                           GUILD_PLAYSTYLE_HARDCORE -- "Hardcore"

L.LOADCONDITION_WARNING1 =               "警告：" -- Uppercase
L.LOADCONDITION_WARNING2 =               "登入時，未包含在任何符合條件的登入設定檔中的插件將被停用。"
L.LOADCONDITION_MATCH1 =                 "符合" -- followed by an any/all dropdown
L.LOADCONDITION_MATCH2 =                 "以下條件套用於設定檔 %s：" -- preceded by an any/all dropdown, %s becomes a profile name
L.LOADCONDITION_VALID =                  "載入條件有效。"
L.LOADCONDITION_INCOMPLETE =             "載入條件不完整。"

L.LOADCONDITION_NEWCHAR1 =               "%s 以前還沒見過這個角色（真令人難過）。" -- You can omit the (so sad) joke if it doesn't work in your language, %s becomes the addon name
L.LOADCONDITION_NEWCHAR2 =               "重新載入以套用登入設定檔？"
