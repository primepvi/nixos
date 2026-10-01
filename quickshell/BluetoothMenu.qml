import QtQuick
import Quickshell
import Quickshell.Bluetooth

PanelWindow {
    id: menu

    required property int marginRight
    required property bool enabled

    property var devices: []

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            devices = Bluetooth.devices;
        }
    }

    anchors {
        top: true
        right: true
    }

    margins {
        right: marginRight
        top: 5
    }

    implicitHeight: 300
    implicitWidth: 268
    
    color: "transparent"
    visible: menu.enabled

    Rectangle {
        id: contentBackground
        anchors.fill: parent
        radius: 6
        color: "#27272a"        
    
        opacity: 0

        states: [
            State {
                name: "visible"
                when: menu.enabled
                PropertyChanges { target: contentBackground; opacity: 1 }
            },
        ]
        
        transitions: [
            Transition {
                from: "*"
                to: "*"
                NumberAnimation {
                    properties: "opacity, x"
                    duration: 300
                    easing.type: Easing.OutCubic
                }
            }
        ]
    }
}


