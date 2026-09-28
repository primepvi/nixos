import QtQuick
import Quickshell.Io

Rectangle {
    id: root
    property var workspaces: []
    property int workspaceActivated: 3

    implicitWidth: contentItem.implicitWidth + 32
    implicitHeight: 32

    Process {
        id: eventStream

        command: ["niri", "msg", "-j", "event-stream"]
        running: true

        stdout: SplitParser {
            onRead: data => {
                const event = JSON.parse(data);

                if (event.WorkspacesChanged) {
                    root.workspaces = event.WorkspacesChanged.workspaces.sort((a, b) => a.idx - b.idx);
                }

                if (event.WorkspaceActivated) {
                    root.workspaceActivated = event.WorkspaceActivated.id;
                }
            }
        }
    }

    radius: 6
    color: "#8827272a"

    Row {
        id: contentItem
        anchors.centerIn: parent
        spacing: 10

        Repeater {
            model: root.workspaces

            Rectangle {
                required property var modelData

                implicitWidth: modelData.id == root.workspaceActivated ? 32 : 16
                implicitHeight: 16
                radius: 8

                color: modelData.id == root.workspaceActivated ? "#52525B" : "#3f3f46"

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
            }
        }
    }
}
