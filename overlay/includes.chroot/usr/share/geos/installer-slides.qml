Presentation {
    id: presentation

    // Язык слайдов — тот, что выбран в установщике (английский по умолчанию, русский — свой текст)
    function t(en, ru) {
        var n = (Qt.uiLanguage && Qt.uiLanguage.length > 0) ? Qt.uiLanguage : Qt.locale().name
        return n.substring(0, 2) === "ru" ? ru : en
    }

    // Фон всей области слайдов — без него вокруг слайда видна белая рамка
    Rectangle {
        parent: presentation.parent ? presentation.parent : presentation
        anchors.fill: parent
        anchors.margins: -400
        z: -100
        color: "#0f1d36"
    }

    Timer {
        interval: 7000
        running: true
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }

    Slide {
        Rectangle { anchors.fill: parent; anchors.margins: -60; color: "#0f1d36" }
        Image { id: l1; source: "geos-logo.png"; width: 128; height: 128; anchors.horizontalCenter: parent.horizontalCenter; anchors.top: parent.top; anchors.topMargin: 40 }
        Text { anchors.top: l1.bottom; anchors.topMargin: 24; width: parent.width; horizontalAlignment: Text.AlignHCenter; wrapMode: Text.WordWrap; color: "#e6eefa"; font.pixelSize: 26
               text: presentation.t("Welcome to GeOS", "Добро пожаловать в GeOS") }
        Text { anchors.bottom: parent.bottom; anchors.bottomMargin: 50; width: parent.width; horizontalAlignment: Text.AlignHCenter; wrapMode: Text.WordWrap; color: "#96aac8"; font.pixelSize: 16
               text: presentation.t("The system is being installed. This will take a few minutes.", "Система устанавливается. Это займёт несколько минут.") }
    }
    Slide {
        Rectangle { anchors.fill: parent; anchors.margins: -60; color: "#0f1d36" }
        Text { anchors.centerIn: parent; width: parent.width * 0.8; horizontalAlignment: Text.AlignHCenter; wrapMode: Text.WordWrap; color: "#e6eefa"; font.pixelSize: 22
               text: presentation.t("Linux, Android and Windows apps in one system.\n\n.apk and .exe files open with a double click.",
                                    "Linux, Android и Windows-программы в одной системе.\n\n.apk и .exe открываются двойным кликом.") }
    }
    Slide {
        Rectangle { anchors.fill: parent; anchors.margins: -60; color: "#0f1d36" }
        Text { anchors.centerIn: parent; width: parent.width * 0.8; horizontalAlignment: Text.AlignHCenter; wrapMode: Text.WordWrap; color: "#e6eefa"; font.pixelSize: 22
               text: presentation.t("GeOS Centre: Steam, Discord, Telegram, Minecraft and more — in one click.",
                                    "Центр GeOS: Steam, Discord, Telegram, Minecraft и другие программы — в один клик.") }
    }
    Slide {
        Rectangle { anchors.fill: parent; anchors.margins: -60; color: "#0f1d36" }
        Text { anchors.centerIn: parent; width: parent.width * 0.8; horizontalAlignment: Text.AlignHCenter; wrapMode: Text.WordWrap; color: "#e6eefa"; font.pixelSize: 22
               text: presentation.t("Familiar Windows shortcuts:\nWin+E — file manager, Win+I — settings,\nWin+Shift+S — screenshot, Ctrl+Shift+Esc — task manager.",
                                    "Привычные клавиши Windows:\nWin+E — проводник, Win+I — параметры,\nWin+Shift+S — снимок экрана, Ctrl+Shift+Esc — диспетчер задач.") }
    }
    Slide {
        Rectangle { anchors.fill: parent; anchors.margins: -60; color: "#0f1d36" }
        Text { anchors.centerIn: parent; width: parent.width * 0.8; horizontalAlignment: Text.AlignHCenter; wrapMode: Text.WordWrap; color: "#e6eefa"; font.pixelSize: 22
               text: presentation.t("When the installation finishes, keep “Restart now” checked and press “Done”.\n\nThe installation disc will be ejected automatically; if you installed from a USB stick, GeOS will ask you to remove it.",
                                    "Когда установка закончится, оставьте галочку «Перезагрузить сейчас» и нажмите «Готово».\n\nУстановочный диск вынется сам, а если вы ставили с флешки — GeOS попросит её вынуть.") }
    }
}
