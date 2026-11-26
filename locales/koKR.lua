-------------------------------------
-- Slacker's Addon Depot: koKR.lua --
-------------------------------------
-- Korean (Korea) localisation
-- Translator(s):

if GetLocale() ~= "koKR" then return end
local appName, app = ...
local L = app.locales

-- Core
L.NEW_VERSION_AVAILABLE =                "%s의 새 버전이 출시되었습니다:" -- %s becomes the addon name

L.DEBUG_ENABLED =                        "디버그 모드 활성화"
L.DEBUG_DISABLED =                       "디버그 모드 비활성화"
L.INVALID_COMMAND =                      "잘못된 명령어"

-- Settings
L.VERSION =                              GAME_VERSION_LABEL .. ":" -- "Version"
L.SUPPORT_TEXTLONG1 =                    "이 애드온을 개발하는 데에는 많은 시간과 노력이 필요합니다."
L.SUPPORT_TEXTLONG2 =                    "개발자를 금전적으로 후원하는 것을 고려해 주세요."
L.SUPPORT =                              "후원"
L.BUY_ME_A_COFFEE =                      "Buy Me a Coffee" -- Brand name, if there isn't a localised version, keep it the way it is
L.THANK_YOU =                            "감사합니다!"
L.FEEDBACK_AND_HELP =                    "피드백 및 도움말"
L.DISCORD =                              "Discord" -- Brand name, if there isn't a localised version, keep it the way it is
L.JOIN_DISCORD_SERVER =                  "Discord 서버에 참여하세요."
L.CTRL_C_COPY =                          "Ctrl+C를 눌러 복사:"
L.LINK_COPIED =                          "링크를 클립보드에 복사했습니다"

L.KEYBINDINGS_AND_SLASH_COMMANDS =       SETTINGS_KEYBINDINGS_LABEL .. " 및 슬래시 명령어" -- "Keybindings"
_G["BINDING_NAME_SAD_TOGGLELIST"] =      app.NameShort .. ": 애드온 목록 열기/닫기"
L.TOGGLE_ADDON_LIST =                    "애드온 목록 열기/닫기"
L.OPEN_SETTINGS =                        "설정 열기"
L.NAME_OR_NUMBER =                       "이름 또는 번호"
L.LOAD_PROFILE =                         "애드온 프로필을 활성화하도록 재시작 확인"
L.FORCELOAD_PROFILE =                    "즉시 인터페이스를 다시 불러와 애드온 프로필 활성화"
L.APPLY_PROFILES =                       "로그인 프로필 (재)적용 후 다시 불러오기"

L.GENERAL =                              GENERAL -- "General"
L.SHOW_MINIMAP_ICON =                    "미니맵 아이콘 표시"
L.SHOW_MINIMAP_ICON_DESC =               "미니맵 아이콘을 표시합니다. 비활성화해도 애드온 메뉴에서 %s을(를) 사용할 수 있습니다." -- %s becomes the addon name
L.REPLACE_ADDONS_MENU_BUTTON =           "애드온 버튼 교체"
L.REPLACE_ADDONS_MENU_BUTTON_DESC =      "기본 메뉴의 애드온 버튼을 누르면 %s이(가) 열리도록 합니다." -- %s becomes the addon name

L.ADDON_LIST =                           "애드온 목록"
L.LOAD_OUT_OF_DATE =                     "구버전 애드온 불러오기"
L.LOAD_OUT_OF_DATE_DESC =                "호환되지 않는 애드온에서 오류가 발생할 수 있습니다."
L.REMEMBER_UNINSTALLED_ADDONS =          "설치되지 않은 애드온 기억"
L.REMEMBER_UNINSTALLED_ADDONS_DESC =     "설치되지 않은 애드온도 프로필에 보관하고 활성화 상태를 기억합니다."
L.CHARLIST_REALMS =                      "캐릭터 목록 서버"
L.CHARLIST_REALMS_DESC =                 "서버별로 캐릭터를 분류합니다."
L.CHARLIST_RULESETS =                    "캐릭터 목록 규칙 유형"
L.CHARLIST_RULESETS_DESC =               "규칙 유형별로 캐릭터를 분류합니다."
L.CHARLIST_SORT =                        "캐릭터 목록 정렬"
L.CHARLIST_SORT_DESC =                   "캐릭터 목록의 정렬 방식을 설정합니다."
L.ALPHABETICAL =                         HOUSING_CHEST_SORT_TYPE_ALPHABETICAL -- "Alphabetical"
L.CLASS =                                CLASS -- "Class"

-- Addon List
L.INSTALLED =                            "설치됨"
L.CATEGORIES =                           CATEGORIES -- "Categories"
L.CATEGORIES_WIKI =                      L.CATEGORIES .. " (Wiki)"
L.ENABLESTATE =                          "활성화 상태"
L.ENABLED =                              PVP_WAR_MODE_ENABLED -- "Enabled"
L.DISABLED =                             ADDON_DISABLED -- "Disabled"
L.CANCEL =                               CANCEL -- "Cancel"
L.APPLY_CHANGES =                        TRANSMOG_SITUATIONS_APPLY -- "Apply Changes"
L.RELOADUI =                             RELOADUI -- "Reload UI"
L.ENABLE_ALL =                           ENABLE_ALL_ADDONS -- "Enable All"
L.DISABLE_ALL =                          DISABLE_ALL_ADDONS -- "Disable All"
L.REVERT =                               COOLDOWN_VIEWER_SETTINGS_BUTTON_REVERT_CHANGES -- "Revert"
L.OUT_OF_DATE =                          ADDON_INTERFACE_VERSION -- "Out of date"
L.INCOMPATIBLE =                         ADDON_INCOMPATIBLE -- "Incompatible"
L.REQUIRES_RELOAD =                      REQUIRES_RELOAD -- "Requires Reload"
L.DEPENDENCY_DISABLED =                  ADDON_DEP_DISABLED -- "Dependency disabled"
L.DEPENDENCY_MISSING =                   ADDON_DEP_MISSING -- "Dependency missing"
L.CHANGE_PENDING =                       "변경 대기 중"
L.DEPENDENCIES =                         ADDON_DEPENDENCIES -- "Dependencies: " (note the included trailing space)
L.UNCATEGORIZED =                        STABLE_PET_UNCATEGORIZED -- "Uncategorized"
L.ALL =                                  ALL -- "All"
L.NOT_APPLICABLE =                       NOT_APPLICABLE -- "N/A"
L.DELETE_CHARACTER =                     "선택한 캐릭터 삭제"

-- Profiles
L.PROFILES =                             "프로필"
L.LOGIN_PROFILE =                        "로그인 프로필"
L.LOGIN_PROFILES =                       "로그인 프로필"
L.LOGIN_PROFILE_DESC1 =                  "로그인 시 애드온을 활성화합니다."
L.LOGIN_PROFILE_DESC2 =                  "불러오기 조건을 충족하는 캐릭터에게 자동으로 적용됩니다. 일치하는 모든 프로필이 적용됩니다."
L.STANDARD_PROFILE =                     "표준 프로필"
L.STANDARD_PROFILES =                    "표준 프로필"
L.STANDARD_PROFILE_DESC1 =               "게임 중 애드온을 활성화합니다."
L.STANDARD_PROFILE_DESC2 =               "특정 캐릭터에게 수동으로 적용합니다. 한 번에 하나의 프로필만 적용합니다."

L.SET_LOAD_CONDITIONS =                  "불러오기 조건 설정"
L.APPLY_PROFILE =                        "%s에게 프로필 적용" -- %s becomes a character name
L.ADDONS =                               "애드온"
L.SAVE_ADDONS =                          "애드온 %d개 저장" -- %d becomes a number
L.NEW_PROFILE =                          "새 프로필"
L.ENABLE_PROFILE =                       "프로필 활성화"
L.RENAME_PROFILE =                       "프로필 이름 변경"
L.DELETE_PROFILE =                       "프로필 삭제"
L.PROFILE_NAME_NEW =                     "새 프로필 이름:"
L.PROFILE_NAME_EXISTS =                  "같은 이름의 프로필이 이미 있습니다."
L.PROFILE_NOT_FOUND =                    "프로필을 찾을 수 없습니다."
L.DELETE_NAME_Q =                        "%s을(를) 삭제하시겠습니까?" -- %s becomes a name
L.RELOAD_AND_ENABLE =                    "다시 불러와 %s을(를) 활성화하시겠습니까?" -- %s becomes a name

L.CONDITION = {}
L.CONDITION[1] =                         CHARACTER -- "Character"
L.CONDITION[2] =                         NAME -- "Name"
L.CONDITION[3] =                         LEVEL -- "Level"
L.CONDITION[4] =                         "서버"
L.CONDITION[5] =                         TRANSMOG_SOURCE_6 -- "Profession"
L.CONDITION[6] =                         CLASS -- "Class"
L.CONDITION[7] =                         "규칙 유형"
L.CONDITIONSTATE = {}
L.CONDITIONSTATE[1] =                    "일부"
L.CONDITIONSTATE[2] =                    "모두"
L.CONDITIONSTATE[3] =                    "보다 작음"
L.CONDITIONSTATE[4] =                    "같음"
L.CONDITIONSTATE[5] =                    "다음 중 하나임"
L.CONDITIONSTATE[6] =                    "보다 큼"
L.CONDITIONSTATE[7] =                    "같지 않음"
L.CONDITIONSTATE[8] =                    "다음 중 어느 것도 아님"
L.CONDITIONSTATE[9] =                    "다음으로 시작함"
L.CONDITIONSTATE[10] =                   "다음으로 끝남"
L.CONDITIONSTATE[11] =                   "포함함"
L.CONDITIONSTATE[12] =                   "포함하지 않음"
L.RULESET = {}
L.RULESET[1] =                           GDAPI_REALMTYPE_NORMAL -- "Normal"
L.RULESET[2] =                           GDAPI_REALMTYPE_PVP -- "PvP"
L.RULESET[3] =                           "역할수행"
L.RULESET[4] =                           "역할수행 PvP"
L.RULESET[5] =                           GUILD_PLAYSTYLE_HARDCORE -- "Hardcore"

L.LOADCONDITION_WARNING1 =               "경고:" -- Uppercase
L.LOADCONDITION_WARNING2 =               "일치하는 로그인 프로필에 포함되지 않은 애드온은 로그인 시 비활성화됩니다."
L.LOADCONDITION_MATCH1 =                 "조건 일치" -- followed by an any/all dropdown
L.LOADCONDITION_MATCH2 =                 "프로필 %s에 대한 다음 조건:" -- preceded by an any/all dropdown, %s becomes a profile name
L.LOADCONDITION_VALID =                  "불러오기 조건이 유효합니다."
L.LOADCONDITION_INCOMPLETE =             "불러오기 조건이 완전하지 않습니다."

L.LOADCONDITION_NEWCHAR1 =               "%s에서 이 캐릭터를 본 적이 없습니다(슬프네요)." -- You can omit the (so sad) joke if it doesn't work in your language, %s becomes the addon name
L.LOADCONDITION_NEWCHAR2 =               "로그인 프로필을 적용하려면 다시 불러오시겠습니까?"
