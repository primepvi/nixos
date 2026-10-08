import QtQuick

Rectangle {
    default property alias content: contentItem.children

    implicitWidth: contentItem.implicitWidth + 32
    implicitHeight: 32

    radius: 6
    color: "#8827272a"
    
    Row {
	id: contentItem
	anchors.centerIn: parent
	spacing: 10
    }
}
