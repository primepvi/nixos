import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
    id: wallpaper

    anchors {
	top: true
	bottom: true
	left: true
	right: true
    }

    WlrLayershell.layer: WlrLayer.Background
    WlrLayershell.namespace: "QuickshellWallpaper"

    Image {
	anchors.fill: parent
	source: AppState.wallpaperSource
	fillMode: Image.PreserveAspectCrop
    }
}
