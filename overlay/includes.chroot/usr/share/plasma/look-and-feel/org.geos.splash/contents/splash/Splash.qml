import QtQuick

// Экран загрузки рабочего стола GeOS
Rectangle {
    id: root
    color: "#0d1b34"
    property int stage

    onStageChanged: bar.width = Math.min(stage / 6, 1) * track.width

    Image {
        id: logo
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -50
        source: "images/geos-logo.png"
        width: 128
        height: 128
        sourceSize.width: 256
        sourceSize.height: 256
        smooth: true
        opacity: 0
        NumberAnimation on opacity { to: 1; duration: 600; easing.type: Easing.OutCubic }
    }

    Text {
        id: title
        anchors.top: logo.bottom
        anchors.topMargin: 22
        anchors.horizontalCenter: parent.horizontalCenter
        text: "GeOS"
        color: "#e6eefa"
        font.pixelSize: 34
        font.bold: true
    }

    Rectangle {
        id: track
        anchors.top: title.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        width: 220
        height: 4
        radius: 2
        color: "#1e3a6e"

        Rectangle {
            id: bar
            height: parent.height
            width: 0
            radius: 2
            color: "#3b82f6"
            Behavior on width { NumberAnimation { duration: 400; easing.type: Easing.OutCubic } }
        }
    }
}
