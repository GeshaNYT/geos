import QtQuick

// Экран загрузки рабочего стола GeOS.
// Выглядит ровно как заставка загрузки системы (те же картинки, фон и места),
// поэтому переход между ними почти незаметен.
Rectangle {
    id: root
    property int stage
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#07112a" }
        GradientStop { position: 1.0; color: "#0d1b34" }
    }

    // Мышку на заставке не показываем
    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.BlankCursor
        hoverEnabled: true
    }

    Image {
        id: logo
        source: "images/logo.png"
        x: (root.width - width) / 2
        y: root.height / 2 - height / 2 - 50
        smooth: true
    }

    Image {
        id: title
        source: "images/title.png"
        x: (root.width - width) / 2
        y: root.height / 2 + logo.height / 2 - 30
        smooth: true
    }

    Image {
        id: spinner
        source: "images/spinner.png"
        x: (root.width - width) / 2
        y: root.height * 0.78 - height / 2
        smooth: true
        RotationAnimator on rotation {
            from: 0; to: 360; duration: 840
            loops: Animation.Infinite
            running: true
        }
    }
}
