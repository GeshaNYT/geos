# Переводы для скриптов GeOS.  Подключение:  . /usr/local/lib/geos/i18n.sh
#   T "English text" "Русский текст"
# Основной язык — английский, для русского системы — второй аргумент.
geos_lang() {
  for v in "$LANGUAGE" "$LC_ALL" "$LC_MESSAGES" "$LANG"; do
    case "$v" in ""|C|POSIX|C.UTF-8) continue ;; esac
    v=${v%%:*}; v=${v%%.*}; echo "${v%%_*}"; return
  done
  echo en
}
GEOS_LANG=$(geos_lang)
T() {
  if [ "$GEOS_LANG" = "ru" ] && [ -n "$2" ]; then printf '%s' "$2"; else printf '%s' "$1"; fi
}
