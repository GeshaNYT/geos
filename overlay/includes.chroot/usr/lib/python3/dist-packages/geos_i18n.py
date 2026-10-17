"""Переводы программ GeOS.

tr("English text", ru="Русский текст") — возвращает строку на языке системы.
Основной язык — английский; для других языков достаточно добавить именованный аргумент
(например, de="...") — без перевода показывается английский.
"""
import os


def lang():
    for var in ("LANGUAGE", "LC_ALL", "LC_MESSAGES", "LANG"):
        val = os.environ.get(var, "")
        if val and val not in ("C", "POSIX", "C.UTF-8"):
            return val.split(":")[0].split("_")[0].split(".")[0].lower()
    return "en"


LANG = lang()


def tr(en, **other):
    return other.get(LANG) or en
