-------------------------------------
-- Slacker's Addon Depot: ruRU.lua --
-------------------------------------
-- Russian (Russia) localisation
-- Translator(s): ZamestoTV

if GetLocale() ~= "ruRU" then return end
local appName, app = ...
local L = app.locales

-- Settings
L.SETTINGS_VERSION =                     "Версия:"
L.SETTINGS_SUPPORT_TEXTLONG =            "Разработка этого аддона требует значительного количества времени и усилий.\nПожалуйста, рассмотрите возможность финансовой поддержки разработчика."
L.SETTINGS_SUPPORT_TEXT =                "Поддержка"
L.SETTINGS_SUPPORT_BUTTON =              "Buy Me a Coffee" -- Brand name, if there isn't a localised version, keep it the way it is
L.SETTINGS_SUPPORT_DESC =                "Спасибо!"
L.SETTINGS_HELP_TEXT =                   "Отзывы и помощь"
L.SETTINGS_HELP_BUTTON =                 "Discord" -- Brand name, if there isn't a localised version, keep it the way it is
L.SETTINGS_HELP_DESC =                   "Присоединяйтесь к Discord-серверу."
L.SETTINGS_URL_COPY =                    "Нажмите Ctrl+C, чтобы скопировать:"
L.SETTINGS_URL_COPIED =                  "Ссылка скопирована в буфер обмена"

L.SETTINGS_KEYSLASH_TITLE =              "Назначение клавиш и слэш-команды"
_G["BINDING_NAME_SAD_TOGGLELIST"] =      app.NameShort .. ": Открыть/закрыть список аддона"
L.SLASH_OPEN_LIST =                      "Открыть/закрыть список аддона"
L.SLASH_OPEN_SETTINGS =                  "Открыть настройки"

L.GENERAL =                              "Общий"

L.SETTINGS_MINIMAP_TITLE =               "Показывать иконку у миникарты"
L.SETTINGS_MINIMAP_DESC =                "Показывать иконку у миникарты. Если вы отключите её, " .. app.NameShort .. " всё равно будет доступен в меню аддонов (Addon Compartment)."
L.SETTINGS_REPLACE_MENU_BUTTON =         "Заменить кнопку «Модификации»"
L.SETTINGS_REPLACE_MENU_BUTTON_DESC =    "Сделать так, чтобы кнопка «Модификации» в главном меню открывала " .. app.NameLong .. "."

L.ADDON_LIST =                           "Список аддонов"

L.SETTINGS_LOAD_OUT_OF_DATE =            "Загружать устаревшие модификации"
L.SETTINGS_LOAD_OUT_OF_DATE_DESC =       "Это может привести к ошибкам из-за несовместимых аддонов."
L.SETTINGS_REMEMBER_UNINSTALLED =        "Запоминать удаленные аддоны"
L.SETTINGS_REMEMBER_UNINSTALLED_DESC =   "Сохранять удаленные аддоны в профилях и помнить, были ли они включены."
L.SETTINGS_CHARLIST_REALMS =             "Игровые миры в списке персонажей"
L.SETTINGS_CHARLIST_REALMS_DESC =        "Группировать персонажей по игровым мирам."
L.SETTINGS_CHARLIST_SORT =               "Сортировка списка персонажей"
L.SETTINGS_CHARLIST_SORT_DESC =          "Выбрать способ сортировки для списка персонажей."
L.ALPHABETICAL =                         "По алфавиту"
L.CLASS =                                "Класс"

-- General
L.NEW_VERSION_AVAILABLE =                "Доступна более новая версия " .. app.NameLong .. ":"
L.SETTINGS_TOOLTIP =                     app.NameLong .. "\n|cffFFFFFF" ..
                                         app.IconLMB .. ": " .. L.SLASH_OPEN_LIST .. "\n" ..
                                         app.IconRMB .. ": " .. L.SLASH_OPEN_SETTINGS

L.INVALID_COMMAND =                      "Неверная команда."
L.DEBUG_ENABLED =                        "Режим отладки включен."
L.DEBUG_DISABLED =                       "Режим отладки выключен."

-- Addon List
L.INSTALLED =                            "Установлено"
L.CATEGORIES =                           "Категории"
L.CATEGORIES_WIKI =                      L.CATEGORIES .. " (Вики)"
L.ENABLESTATE =                          "Состояние активности"
L.ENABLED =                              "Включен"
L.DISABLED =                             "Отключено"
L.CANCEL =                               "Отмена"
L.APPLY_CHANGES =                        "Применить изменения"
L.RELOADUI =                             "Перезагрузка"
L.ENABLE_ALL =                           "Включить все"
L.DISABLE_ALL =                          "Отключить все"
L.REVERT =                               "Сбросить"
L.OUT_OF_DATE =                          "Устарело"
L.INCOMPATIBLE =                         "Несовместимо"
L.REQUIRES_RELOAD =                      "Перезагрузите интерф"
L.DEPENDENCY_DISABLED =                  "Зависимость отключена"
L.DEPENDENCY_MISSING =                   "Зависимость отсутствует"
L.CHANGE_PENDING =                       "Ожидает изменений"
L.DEPENDENCIES =                         "Зависимые ресурсы:"
L.UNCATEGORIZED =                        "Без категории"
L.ALL =                                  "Все"
L.NOT_APPLICABLE =                       "НЕТ"
L.DELETE_CHARACTER =                     "Удалить выбранного персонажа"

-- Profiles
L.PROFILES =                             "Профили"
L.LOGIN_PROFILE =                        "Профиль при входе"
L.LOGIN_PROFILES =                       "Профили при входе"
L.LOGIN_PROFILE_DESC =                   "Включает аддоны при входе в игру.\n\nАвтоматически применяется к персонажам, которые соответствуют условиям загрузки. Применяются все подходящие профили."
L.STANDARD_PROFILE =                     "Стандартный профиль"
L.STANDARD_PROFILES =                    "Стандартные профили"
L.STANDARD_PROFILE_DESC =                "Включает аддоны во время игры.\n\nПрименяется вручную к конкретным персонажам. Можно применить только один профиль за раз."

L.APPLY_PROFILE =                        "Применить профиль к %s" -- %s becomes a character name
L.ADDONS =                               "Аддоны"
L.SAVE_ADDONS =                          "Сохранить %d аддонов" -- %d becomes a number
L.NEW_PROFILE =                          "Новый профиль"
-- L.ENABLE_PROFILE =                       "Enable profile"
L.RENAME_PROFILE =                       "Переименовать профиль"
L.DELETE_PROFILE =                       "Удалить профиль"
L.PROFILE_NAME_NEW =                     "Новое имя профиля:"
L.PROFILE_NAME_EXISTS =                  "Профиль с таким именем уже существует."
L.DELETE_NAME_Q =                        "Удалить %s?" -- %s becomes a name
L.RELOAD_AND_ENABLE =                    "Перезагрузить интерфейс и включить %s?" -- %s becomes a name

L.CONDITION = {}
L.CONDITION[1] =                         "Персонаж"
L.CONDITION[2] =                         "Имя"
L.CONDITION[3] =                         "Уровень"
L.CONDITION[4] =                         "Игровой мир"
L.CONDITION[5] =                         "Профессия"
L.CONDITION[6] =                         "Класс"
L.CONDITIONSTATE = {}
L.CONDITIONSTATE[1] =                    "любой"
L.CONDITIONSTATE[2] =                    "все"
L.CONDITIONSTATE[3] =                    "меньше чем"
L.CONDITIONSTATE[4] =                    "равно"
L.CONDITIONSTATE[5] =                    "является одним из"
L.CONDITIONSTATE[6] =                    "больше чем"
L.CONDITIONSTATE[7] =                    "не равно"
L.CONDITIONSTATE[8] =                    "не является ни одним из"
L.CONDITIONSTATE[9] =                    "начинается с"
L.CONDITIONSTATE[10] =                   "заканчивается на"
L.CONDITIONSTATE[11] =                   "содержит"
L.CONDITIONSTATE[12] =                   "не содержит"

L.LOADCONDITION_WARNING1 =               "ВНИМАНИЕ:" -- Uppercase
L.LOADCONDITION_WARNING2 =               "Аддоны, не входящие ни в один из подходящих профилей при входе, будут отключены при входе в игру."
L.LOADCONDITION_MATCH1 =                 "Соответствие" -- followed by an any/all dropdown
L.LOADCONDITION_MATCH2 =                 "из этих условий для профиля %s:" -- preceded by an any/all dropdown, %s becomes a profile name
L.LOADCONDITION_VALID =                  "Условие загрузки корректно."
L.LOADCONDITION_INCOMPLETE =             "Условие загрузки заполнено не полностью."

L.LOADCONDITION_NEWCHAR1 =               app.NameLong .. " видит этого персонажа впервые (какая жалость)." -- You can omit the (so sad) joke if it doesn't work in your language
L.LOADCONDITION_NEWCHAR2 =               "Перезагрузить интерфейс, чтобы применить профили при входе?"
