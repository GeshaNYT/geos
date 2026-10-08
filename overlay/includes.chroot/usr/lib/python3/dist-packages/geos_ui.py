"""Общий стиль всех окон GeOS: цвета, шрифты, кнопки, иконки."""
import os

from PyQt6.QtCore import Qt
from PyQt6.QtGui import QIcon, QPixmap
from PyQt6.QtWidgets import QHBoxLayout, QLabel, QVBoxLayout

LOGO = "/usr/share/pixmaps/geos-logo.png"
ICON_DIR = "/usr/share/geos/icons"

# Палитра GeOS — те же цвета, что в цветовой схеме GeOSBlue и в терминале
BG, CARD, CARD_HI, LINE = "#0d1b34", "#13284f", "#1a3363", "#1e3a6e"
TEXT, MUTED = "#e6eefa", "#96aac8"
ACCENT, ACCENT_HI, OK, OK_HI, BAD = "#2563eb", "#3b82f6", "#16a34a", "#22c55e", "#f87171"

STYLE = f"""
QWidget {{ background: {BG}; color: {TEXT}; font-size: 14px; }}
QToolTip {{ background: {CARD}; color: {TEXT}; border: 1px solid {LINE}; border-radius: 6px; padding: 4px 8px; }}
QTabWidget::pane {{ border: none; }}
QTabBar::tab {{ background: {CARD}; padding: 8px 18px; border-radius: 8px; margin: 4px; }}
QTabBar::tab:selected {{ background: {ACCENT}; }}
QTabBar::tab:hover:!selected {{ background: {CARD_HI}; }}
QFrame#card {{ background: {CARD}; border-radius: 14px; }}
QLabel#emoji, QLabel#icon {{ background: transparent; }}
QLabel#name {{ font-size: 16px; font-weight: bold; background: transparent; }}
QLabel#desc, QLabel#subtitle {{ color: {MUTED}; background: transparent; }}
QLabel#title {{ font-size: 26px; font-weight: bold; }}
QLabel#big {{ font-size: 32px; font-weight: bold; }}
QLineEdit, QPlainTextEdit {{ background: {CARD}; border: 1px solid {LINE}; border-radius: 10px; padding: 8px 12px;
    selection-background-color: {ACCENT}; }}
QLineEdit:focus {{ border-color: {ACCENT}; }}
QPlainTextEdit {{ font-family: "Hack", monospace; font-size: 12px; color: {MUTED}; }}
QPushButton {{ background: {ACCENT}; border: none; border-radius: 8px; padding: 7px 14px; font-weight: bold; }}
QPushButton:hover {{ background: {ACCENT_HI}; }}
QPushButton:disabled {{ background: {LINE}; color: {MUTED}; }}
QPushButton#open {{ background: {OK}; }}
QPushButton#open:hover {{ background: {OK_HI}; }}
QPushButton#flat, QPushButton#remove {{ background: transparent; color: {MUTED}; padding: 4px 8px; font-weight: normal; }}
QPushButton#flat:hover {{ color: {TEXT}; }}
QPushButton#remove:hover {{ color: {BAD}; }}
QPushButton#chip {{ background: {CARD}; border-radius: 11px; padding: 5px 14px; font-weight: normal; }}
QPushButton#chip:checked {{ background: {ACCENT}; font-weight: bold; }}
QPushButton#chip:hover:!checked {{ background: {CARD_HI}; }}
QProgressBar {{ background: {CARD}; border: none; border-radius: 4px; height: 8px; }}
QProgressBar::chunk {{ background: {ACCENT}; border-radius: 4px; }}
QScrollArea {{ border: none; }}
/* Тонкая скруглённая полоса прокрутки, как в Windows 11 */
QScrollBar:vertical {{ background: transparent; width: 12px; margin: 4px 2px 4px 2px; }}
QScrollBar::handle:vertical {{ background: #2a4a80; border-radius: 4px; min-height: 40px; }}
QScrollBar::handle:vertical:hover {{ background: {ACCENT_HI}; }}
QScrollBar:horizontal {{ background: transparent; height: 12px; margin: 2px 4px 2px 4px; }}
QScrollBar::handle:horizontal {{ background: #2a4a80; border-radius: 4px; min-width: 40px; }}
QScrollBar::handle:horizontal:hover {{ background: {ACCENT_HI}; }}
QScrollBar::add-line, QScrollBar::sub-line {{ width: 0; height: 0; border: none; }}
QScrollBar::add-page, QScrollBar::sub-page {{ background: none; }}
QMessageBox {{ background: {BG}; }}
"""


def pixmap(name, size):
    """Иконка GeOS из набора SVG (или логотип, если name == 'logo')."""
    if name == "logo":
        pm = QPixmap(LOGO)
    else:
        pm = QIcon(os.path.join(ICON_DIR, name + ".svg")).pixmap(size * 2, size * 2)
    return pm.scaled(size, size, Qt.AspectRatioMode.KeepAspectRatio, Qt.TransformationMode.SmoothTransformation)


def header(icon_name, title, subtitle, icon_size=64):
    """Шапка окна: иконка, заголовок, подзаголовок. Возвращает (layout, метка подзаголовка)."""
    row = QHBoxLayout()
    row.setSpacing(14)
    icon = QLabel(objectName="icon")
    icon.setPixmap(pixmap(icon_name, icon_size))
    row.addWidget(icon)
    texts = QVBoxLayout()
    texts.setSpacing(2)
    texts.addWidget(QLabel(title, objectName="title"))
    sub = QLabel(subtitle, objectName="subtitle")
    sub.setWordWrap(True)
    texts.addWidget(sub)
    row.addLayout(texts, 1)
    return row, sub


def apply(app, desktop_name):
    app.setDesktopFileName(desktop_name)
    app.setWindowIcon(QIcon(LOGO))
    app.setStyleSheet(STYLE)
