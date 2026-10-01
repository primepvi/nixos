import QtQuick
import Quickshell
import Quickshell.Services.UPower
import Quickshell.Services.Pipewire

PanelWindow {
    id: bar

    PwObjectTracker {
        objects: Pipewire.defaultAudioSink ? [Pipewire.defaultAudioSink] : []
    }

    property int battery: Math.round(UPower.displayDevice.percentage * 100)
    property int volume: Math.round(Pipewire.defaultAudioSink.audio.volume * 100)

    property bool batteryIsCharging: UPower.displayDevice.state == UPowerDeviceState.Charging || UPower.displayDevice.state == UPowerDeviceState.FullyCharged

    property string batteryIcon: batteryIsCharging ? "battery_charging_80_2" : battery == 0 ? "battery_android_0" : battery <= 25 ? "battery_android_1" : battery <= 50 ? "battery_android_2" : battery <= 75 ? "battery_android_4" : battery < 100 ? "battery_android_6" : "battery_android_full"

    property string volumeIcon: volume == 0 ? "volume_off" : "volume_up"

    property string time: Qt.formatDateTime(new Date(), "dddd, MMMM d, HH:mm")

    property bool bluetoothMenuEnabled: false

    screen: Quickshell.screens[0]

    anchors {
        top: true
        left: true
        right: true
    }

    margins {
        top: 4
        left: 10
        right: 10
        bottom: 4
    }

    implicitHeight: 32
    color: "transparent"

    Timer {
	interval: 1000
	running: true
	repeat: true
	onTriggered: {
	    bar.time = Qt.formatDateTime(new Date(), "dddd, MMMM d, HH:mm")
	}
    }

    BarRect {
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }

        Text {
            text: ""
            font.family: "JetBrains MonoNerdFont"
            font.pixelSize: 18
            color: "white"
        }

        Text {
            text: time
            font.family: "Ubuntu"
            font.pixelSize: 14
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    WorkspacesBarRect {
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
    }

    Row {
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

        spacing: 8

        BarRect {
            Text {
                text: "notifications"
                font.family: "Material Symbols Rounded"
                font.pixelSize: 18
                color: "white"
            }
        }

	BluetoothMenu {
	    marginRight: 10
	    enabled: bar.bluetoothMenuEnabled
	}

        BarRect {
	    id: actions
            Text {
                text: "wifi"
                font.family: "Material Symbols Rounded"
                font.pixelSize: 18
                color: "white"
            }

            Text {
                text: "bluetooth"
                font.family: "Material Symbols Rounded"
                font.pixelSize: 18
                color: "white"

		MouseArea {
		    anchors.fill: parent
		    onClicked: {
			bar.bluetoothMenuEnabled = !bar.bluetoothMenuEnabled
		    }
		}
            }

            Text {
                text: bar.volumeIcon
                font.family: "Material Symbols Rounded"
                font.pixelSize: 18
                color: "white"
            }

            Text {
                text: bar.volume + "%"
                font.family: "Ubuntu"
                font.pixelSize: 14
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                text: bar.batteryIcon
                font.family: "Material Symbols Rounded"
                font.pixelSize: 18
                color: "white"
            }

            Text {
                text: bar.battery + "%"
                font.family: "Ubuntu"
                font.pixelSize: 14
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}
