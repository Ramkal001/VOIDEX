import QtQuick
import QtQuick.Controls
import QtQuick.Shapes

import Style 1.0
import "../Controls2"

Button {
    id: root

    // Real VPN state from the upstream connection controller.
    readonly property bool connected: ConnectionController.isConnected
    readonly property bool inProgress: ConnectionController.isConnectionInProgress
    readonly property color connectionRingColor: inProgress ? "#BFDDF5"
                                             : (connected ? "#32EA95" : "#FF435B")

    implicitWidth: 220
    implicitHeight: 220
    padding: 0
    hoverEnabled: true
    Accessible.name: inProgress ? qsTr("Connecting")
                                : connected ? qsTr("Disconnect VPN") : qsTr("Connect VPN")
    text: inProgress ? qsTr("CONNECTING") : connected ? qsTr("CONNECTED") : qsTr("CONNECT")

    Connections {
        target: ConnectionController
        function onPreparingConfig() {
            PageController.showNotificationMessage(qsTr("Unable to disconnect during configuration preparation"))
        }
    }

    background: Item {
        // Outer titanium 3D rim with controlled specular highlight.
        Rectangle {
            id: metalRim
            anchors.fill: parent
            anchors.margins: 4
            radius: width / 2
            border.width: 1
            border.color: "#EAF4FF"
            gradient: Gradient {
                GradientStop { position: 0.00; color: "#C6D5E6" }
                GradientStop { position: 0.11; color: "#6888A9" }
                GradientStop { position: 0.28; color: "#132940" }
                GradientStop { position: 0.71; color: "#0A1930" }
                GradientStop { position: 0.89; color: "#6989A6" }
                GradientStop { position: 1.00; color: "#B7C9DF" }
            }
        }

        Rectangle {
            id: innerTrack
            anchors.fill: metalRim
            anchors.margins: 9
            radius: width / 2
            color: "#061324"
            border.width: 7
            border.color: root.connectionRingColor
            Behavior on border.color { ColorAnimation { duration: 240 } }
        }

        // Diffuse colored reflection gives the edge extra depth.
        Rectangle {
            anchors.fill: innerTrack
            anchors.margins: 7
            radius: width / 2
            color: "transparent"
            border.width: 2
            border.color: root.connectionRingColor
            opacity: 0.35
        }

        Rectangle {
            id: innerDisk
            anchors.fill: innerTrack
            anchors.margins: 14
            radius: width / 2
            border.width: 1
            border.color: "#6386A9"
            gradient: Gradient {
                GradientStop { position: 0; color: "#173653" }
                GradientStop { position: 0.55; color: "#07172C" }
                GradientStop { position: 1; color: "#0B2542" }
            }
        }

        Rectangle {
            anchors.horizontalCenter: innerDisk.horizontalCenter
            y: innerDisk.y + 8
            width: innerDisk.width * 0.57
            height: 2
            radius: 1
            color: "#B9D4F2"
            opacity: 0.34
        }

        Item {
            id: progressArc
            anchors.fill: parent
            visible: root.inProgress

            Shape {
                anchors.fill: parent
                ShapePath {
                    fillColor: "transparent"
                    strokeColor: "#EAF4FF"
                    strokeWidth: 4
                    capStyle: ShapePath.RoundCap
                    PathAngleArc {
                        centerX: progressArc.width / 2
                        centerY: progressArc.height / 2
                        radiusX: progressArc.width / 2 - 18
                        radiusY: progressArc.height / 2 - 18
                        startAngle: 0
                        sweepAngle: 94
                    }
                }
            }
            RotationAnimator on rotation {
                running: root.inProgress
                from: 0
                to: 360
                loops: Animation.Infinite
                duration: 950
            }
        }

        FocusRingType {
            radius: root.width / 2
            visible: root.visualFocus
        }
    }

    contentItem: Item {
        Text {
            text: "⏻"
            color: root.connected ? "#CBFFE6" : "#F1F6FD"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -24
            font.pixelSize: 62
        }
        Text {
            text: root.text
            color: "#F5F9FF"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 31
            font.pixelSize: 17
            font.weight: Font.DemiBold
            font.letterSpacing: 1.4
        }
    }

    HoverHandler { cursorShape: Qt.PointingHandCursor }
    onClicked: ConnectionController.connectButtonClicked()
    Keys.onEnterPressed: root.clicked()
    Keys.onReturnPressed: root.clicked()
}
