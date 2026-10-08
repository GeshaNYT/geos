
Presentation {
    id: presentation

    Timer {
        interval: 7000
        running: true
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }

    Slide {
        Rectangle { anchors.fill: parent; color: "#0d1b34" }
        Image { id: l1; source: "geos-logo.png"; width: 128; height: 128; anchors.horizontalCenter: parent.horizontalCenter; anchors.top: parent.top; anchors.topMargin: 40 }
        Text { anchors.top: l1.bottom; anchors.topMargin: 24; width: parent.width; horizontalAlignment: Text.AlignHCenter; wrapMode: Text.WordWrap; color: "#e6eefa"; font.pixelSize: 26; text: "Добро пожаловать в GeOS" }
        Text { anchors.bottom: parent.bottom; anchors.bottomMargin: 50; width: parent.width; horizontalAlignment: Text.AlignHCenter; wrapMode: Text.WordWrap; color: "#96aac8"; font.pixelSize: 16; text: "Система устанавливается. Это займёт несколько минут." }
    }
    Slide {
        Rectangle { anchors.fill: parent; color: "#0d1b34" }
        Text { anchors.centerIn: parent; width: parent.width * 0.8; horizontalAlignment: Text.AlignHCenter; wrapMode: Text.WordWrap; color: "#e6eefa"; font.pixelSize: 22; text: "Linux, Android и Windows-программы в одной системе.\n\n.apk и .exe открываются двойным кликом." }
    }
    Slide {
        Rectangle { anchors.fill: parent; color: "#0d1b34" }
        Text { anchors.centerIn: parent; width: parent.width * 0.8; horizontalAlignment: Text.AlignHCenter; wrapMode: Text.WordWrap; color: "#e6eefa"; font.pixelSize: 22; text: "Центр GeOS: Steam, Discord, Telegram, Minecraft и другие программы — в один клик." }
    }
    Slide {
        Rectangle { anchors.fill: parent; color: "#0d1b34" }
        Text { anchors.centerIn: parent; width: parent.width * 0.8; horizontalAlignment: Text.AlignHCenter; wrapMode: Text.WordWrap; color: "#e6eefa"; font.pixelSize: 22; text: "Привычные клавиши Windows:\nWin+E — проводник, Win+I — параметры,\nWin+Shift+S — снимок экрана, Ctrl+Shift+Esc — диспетчер задач." }
    }
}
