#!/bin/bash
# GeOS (GeshanOS) — сборка ISO. Запускать на Debian 12/13 или Ubuntu 22.04+.
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
BUILD="$HERE/build"

echo "==> Ставлю инструменты сборки"
sudo apt-get update
sudo apt-get install -y live-build debootstrap squashfs-tools xorriso

echo "==> Готовлю папку сборки"
sudo rm -rf "$BUILD"; mkdir -p "$BUILD"; cd "$BUILD"

lb config \
  --distribution trixie \
  --archive-areas "main contrib non-free non-free-firmware" \
  --debian-installer none \
  --iso-application "GeOS" \
  --iso-volume "GeOS" \
  --image-name "geos" \
  --bootappend-live "boot=live components quiet splash hostname=geos locales=ru_RU.UTF-8 keyboard-layouts=us,ru keyboard-options=grp:alt_shift_toggle"

echo "==> Добавляю файлы GeOS"
cp -r "$HERE/overlay/." config/
chmod +x config/hooks/live/*.hook.chroot config/includes.chroot/usr/local/bin/*

echo "==> Собираю ISO (30–90 минут)"
sudo lb build

echo "==> Готово: $(ls "$BUILD"/*.iso)"
