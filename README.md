# GeOS (GeshanOS)

Linux на базе Debian 13 с синим оформлением. Запускает обычные Linux-приложения и Android-приложения (.apk).

## Что взято у других ОС
- Windows: привычная панель задач снизу и меню «Пуск» (KDE Plasma).
- macOS: быстрый поиск по Alt+Пробел (KRunner) и откат системы через Timeshift, как Time Machine.
- Android: .apk ставятся двойным кликом через Waydroid.
- ChromeOS / Fedora: магазин приложений Discover с Flathub.
- Debian / Linux Mint: стабильная и проверенная база.
- Windows: .exe запускаются двойным кликом (Wine).
- Apple AirDrop / Phone Link: связь с телефоном через KDE Connect.
- Центр GeOS: Steam, Discord, Telegram, Minecraft и другие программы в один клик.
- Для слабых ПК: сжатие памяти zram, защита от зависаний earlyoom, режимы питания.

## Как собрать
Нужен компьютер или виртуалка с Debian 12/13 или Ubuntu 22.04+, 25 ГБ свободного места и интернет.

    chmod +x build.sh
    ./build.sh

Готовый ISO появится в папке `build/`. Запиши его на флешку через Ventoy, Rufus или balenaEtcher и загрузись с неё.
Установка на диск: значок «Install System» на рабочем столе.
Live-режим: пользователь `user`, пароль `live`.

## Как поменять оформление
- Цвета: `overlay/includes.chroot/usr/share/color-schemes/GeOSBlue.colors` (формат R,G,B).
- Обои: замени `overlay/includes.chroot/usr/share/wallpapers/GeOS/geos.png`.
- В самой системе: «Параметры системы → Оформление».

## Важно
- Android-приложения нужен Wayland-сеанс (в Plasma 6 он по умолчанию) и видеокарта Intel или AMD. С NVIDIA и в VirtualBox Waydroid работает плохо.
- При первом открытии .apk скачается образ Android (~1 ГБ).

## Сборка через GitHub (без Linux на компьютере)
1. Создай публичный репозиторий на github.com.
2. Загрузи в него содержимое этой папки (вместе со скрытой папкой `.github`).
3. Вкладка Actions → «Сборка GeOS» → Run workflow.
4. Через ~1 час открой завершённый запуск и скачай GeOS-iso внизу страницы.
