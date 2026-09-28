import QtQuick
import "./services"

Rectangle {
    id: root
    
    implicitWidth: contentItem.implicitWidth + 32
    implicitHeight: 32
    
    radius: 6
    color: "#8827272a"

    Row {
        id: contentItem
        anchors.centerIn: parent
        spacing: 10

        Repeater {
            model: Niri.workspaces

            Rectangle {
                required property var modelData

                implicitWidth: modelData.id == Niri.focusedWorkspace.id ? 32 : 16
                implicitHeight: 16
                radius: 8

                color: modelData.id == Niri.focusedWorkspace.id ? "#52525B" : "#3f3f46"

                Behavior on implicitWidth {
                    NumberAnimation {
                        duration: 180
                        easing.type: Easing.OutCubic
                    }
                }

                Behavior on color {
                    ColorAnimation {
                        duration: 180
                    }
                }

                Text {
                    anchors.centerIn: parent

                    text: modelData.idx
                    color: "white"
                    font.family: "Ubuntu"
                    font.weight: Font.Bold
                }

		MouseArea {
		    id: mouseArea
		    anchors.fill: parent
		    onClicked: {
			Niri.changeFocus(modelData.id)
		    }
		}
            }
        }
    }
}
