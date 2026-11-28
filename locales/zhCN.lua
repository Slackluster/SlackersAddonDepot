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
L.VERSION =                              GAME_VERSION_LABEL .. "：" -- "Version"
L.SUPPORT_TEXTLONG1 =                    "开发这个插件需要大量的时间和精力。"
L.SUPPORT_TEXTLONG2 =                    "请考虑在经济上支持开发者。"
L.SUPPORT =                              "支持"
L.BUY_ME_A_COFFEE =                      "Buy Me a Coffee" -- Brand name, if there isn't a localised version, keep it the way it is
L.THANK_YOU =                            "谢谢！"
L.FEEDBACK_AND_HELP =                    "反馈与帮助"
L.DISCORD =                              "Discord" -- Brand name, if there isn't a localised version, keep it the way it is
L.JOIN_DISCORD_SERVER =                  "加入 Discord 服务器。"
L.CTRL_C_COPY =                          "按 Ctrl+C 复制："
L.LINK_COPIED =                          "链接已复制到剪贴板"

L.KEYBINDINGS_AND_SLASH_COMMANDS =       SETTINGS_KEYBINDINGS_LABEL .. " & 斜杠命令" -- "Keybindings"
_G["BINDING_NAME_SAD_TOGGLELIST"] =      app.NameShort .. ": 切换插件列表"
L.TOGGLE_ADDON_LIST =                    "切换插件列表"
L.OPEN_SETTINGS =                        "打开设置"
L.NAME_OR_NUMBER =                       "名称或数字"
L.LOAD_PROFILE =                         "询问是否重新加载并启用插件配置文件"
L.FORCELOAD_PROFILE =                    "直接重新加载并启用插件配置文件"
L.APPLY_PROFILES =                       "（重新）应用登录配置文件并重新加载"

L.GENERAL =                              GENERAL -- "General"
L.SHOW_MINIMAP_ICON =                    "显示小地图图标"
L.SHOW_MINIMAP_ICON_DESC =               "显示小地图图标。如果您禁用此选项，仍可通过插件目录访问 %s。" -- %s becomes the addon name
L.REPLACE_ADDONS_MENU_BUTTON =           "替换插件按钮"
L.REPLACE_ADDONS_MENU_BUTTON_DESC =      "让主菜单中的插件按钮打开 %s。" -- %s becomes the addon name

L.ADDON_LIST =                           "插件列表"
L.LOAD_OUT_OF_DATE =                     "加载过期插件"
L.LOAD_OUT_OF_DATE_DESC =                "这可能导致与不兼容的插件发生错误。"
L.REMEMBER_UNINSTALLED_ADDONS =          "记住未安装的插件"
L.REMEMBER_UNINSTALLED_ADDONS_DESC =     "在配置文件中保留未安装的插件，并记住其启用状态。"
L.CHARLIST_REALMS =                      "角色列表服务器"
L.CHARLIST_REALMS_DESC =                 "按服务器对角色分类。"
L.CHARLIST_RULESETS =                    "角色列表规则集"
L.CHARLIST_RULESETS_DESC =               "按规则集对角色分类。"
L.CHARLIST_SORT =                        "角色列表排序"
L.CHARLIST_SORT_DESC =                   "设置角色列表的排序方式。"
L.ALPHABETICAL =                         HOUSING_CHEST_SORT_TYPE_ALPHABETICAL -- "Alphabetical"
L.CLASS =                                CLASS -- "Class"

-- Addon List
L.INSTALLED =                            "已安装"
L.CATEGORIES =                           CATEGORIES -- "Categories"
L.CATEGORIES_WIKI =                      L.CATEGORIES .. " (Wiki)"
L.ENABLESTATE =                          "启用状态"
L.ENABLED =                              PVP_WAR_MODE_ENABLED -- "Enabled"
L.DISABLED =                             ADDON_DISABLED -- "Disabled"
L.CANCEL =                               CANCEL -- "Cancel"
L.APPLY_CHANGES =                        TRANSMOG_SITUATIONS_APPLY -- "Apply Changes"
L.RELOADUI =                             RELOADUI -- "Reload UI"
L.REAPPLY =                              "（重新）应用"
L.ENABLE_ALL =                           ENABLE_ALL_ADDONS -- "Enable All"
L.DISABLE_ALL =                          DISABLE_ALL_ADDONS -- "Disable All"
L.REVERT =                               COOLDOWN_VIEWER_SETTINGS_BUTTON_REVERT_CHANGES -- "Revert"
L.OUT_OF_DATE =                          ADDON_INTERFACE_VERSION -- "Out of date"
L.INCOMPATIBLE =                         ADDON_INCOMPATIBLE -- "Incompatible"
L.REQUIRES_RELOAD =                      REQUIRES_RELOAD -- "Requires Reload"
L.DEPENDENCY_DISABLED =                  ADDON_DEP_DISABLED -- "Dependency disabled"
L.DEPENDENCY_MISSING =                   ADDON_DEP_MISSING -- "Dependency missing"
L.CHANGE_PENDING =                       "待生效的更改"
L.DEPENDENCIES =                         ADDON_DEPENDENCIES -- "Dependencies: " (note the included trailing space)
L.UNCATEGORIZED =                        STABLE_PET_UNCATEGORIZED -- "Uncategorized"
L.ALL =                                  ALL -- "All"
L.NOT_APPLICABLE =                       NOT_APPLICABLE -- "N/A"
L.DELETE_CHARACTER =                     "删除所选角色"

-- Profiles
L.PROFILES =                             "配置文件"
L.LOGIN_PROFILE =                        "登录配置文件"
L.LOGIN_PROFILES =                       "登录配置文件"
L.LOGIN_PROFILE_DESC1 =                  "登录时启用插件。"
L.LOGIN_PROFILE_DESC2 =                  "自动应用于满足加载条件的角色。所有匹配的配置文件都会应用。"
L.STANDARD_PROFILE =                     "标准配置文件"
L.STANDARD_PROFILES =                    "标准配置文件"
L.STANDARD_PROFILE_DESC1 =               "在游戏中启用插件。"
L.STANDARD_PROFILE_DESC2 =               "手动应用于指定角色。每次只应用一个配置文件。"

L.SET_LOAD_CONDITIONS =                  "设置加载条件"
L.APPLY_PROFILE =                        "将配置文件应用到 %s" -- %s becomes a character name
L.ADDONS =                               "插件"
L.SAVE_ADDONS =                          "保存 %d 个插件" -- %d becomes a number
L.NEW_PROFILE =                          "新建配置文件"
L.ENABLE_PROFILE =                       "启用配置文件"
L.RENAME_PROFILE =                       "重命名配置文件"
L.DELETE_PROFILE =                       "删除配置文件"
L.PROFILE_NAME_NEW =                     "新配置文件名称："
L.PROFILE_NAME_EXISTS =                  "已存在同名配置文件。"
L.PROFILE_NOT_FOUND =                    "未找到配置文件。"
L.DELETE_NAME_Q =                        "删除 %s？" -- %s becomes a name
L.RELOAD_AND_ENABLE =                    "重新加载并启用 %s？" -- %s becomes a name

L.CONDITION = {}
L.CONDITION[1] =                         CHARACTER -- "Character"
L.CONDITION[2] =                         NAME -- "Name"
L.CONDITION[3] =                         LEVEL -- "Level"
L.CONDITION[4] =                         "服务器"
L.CONDITION[5] =                         TRANSMOG_SOURCE_6 -- "Profession"
L.CONDITION[6] =                         CLASS -- "Class"
L.CONDITION[7] =                         "规则集"
L.CONDITIONSTATE = {}
L.CONDITIONSTATE[1] =                    "任意"
L.CONDITIONSTATE[2] =                    "全部"
L.CONDITIONSTATE[3] =                    "小于"
L.CONDITIONSTATE[4] =                    "等于"
L.CONDITIONSTATE[5] =                    "属于其中之一"
L.CONDITIONSTATE[6] =                    "大于"
L.CONDITIONSTATE[7] =                    "不等于"
L.CONDITIONSTATE[8] =                    "不属于其中任何一个"
L.CONDITIONSTATE[9] =                    "开头为"
L.CONDITIONSTATE[10] =                   "结尾为"
L.CONDITIONSTATE[11] =                   "包含"
L.CONDITIONSTATE[12] =                   "不包含"
L.RULESET = {}
L.RULESET[1] =                           GDAPI_REALMTYPE_NORMAL -- "Normal"
L.RULESET[2] =                           GDAPI_REALMTYPE_PVP -- "PvP"
L.RULESET[3] =                           "角色扮演"
L.RULESET[4] =                           "角色扮演 PvP"
L.RULESET[5] =                           GUILD_PLAYSTYLE_HARDCORE -- "Hardcore"

L.LOADCONDITION_WARNING1 =               "警告：" -- Uppercase
L.LOADCONDITION_WARNING2 =               "登录时，不属于任何匹配的登录配置文件的插件将被禁用。"
L.LOADCONDITION_MATCH1 =                 "匹配" -- followed by an any/all dropdown
L.LOADCONDITION_MATCH2 =                 "以下条件用于配置文件 %s：" -- preceded by an any/all dropdown, %s becomes a profile name
L.LOADCONDITION_VALID =                  "加载条件有效。"
L.LOADCONDITION_INCOMPLETE =             "加载条件不完整。"

L.LOADCONDITION_NEWCHAR1 =               "%s 以前从未见过这个角色（好伤心）。" -- You can omit the (so sad) joke if it doesn't work in your language, %s becomes the addon name
L.LOADCONDITION_NEWCHAR2 =               "重新加载以应用登录配置文件？"
