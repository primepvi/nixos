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
    property int volume: Math.round(Pipewire.defaultAudioSink.audio.volume  * 100)
    
    property string batteryIcon: UPower.displayDevice.state == UPowerDeviceState.Charging || UPower.displayDevice.state == UPowerDeviceState.FullyCharged ? "battery_charging_80_2" :
	battery == 0 ? "battery_android_0" :
	battery <= 25 ? "battery_android_1" :
	battery <= 50 ? "battery_android_2" :
	battery <= 75 ? "battery_android_4" :
	battery < 100 ? "battery_android_6" :
	"battery_android_full"

    property string volumeIcon: volume == 0 ? "volume_off" : "volume_up"
    
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
            text: Qt.formatDateTime(new Date(), "dddd, MMMM d, HH:mm")
	    font.family: "Ubuntu"
	    font.pixelSize: 14
	    color: "white"
	    anchors.verticalCenter: parent.verticalCenter
	}
    }

    Workspaces {
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
		text: "notifications_unread"
		font.family: "Material Symbols Rounded"
		font.pixelSize: 18
		color: "white"
	    }
	}
	
	BarRect {
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
