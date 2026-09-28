pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property var workspaces: []
    property var focusedWorkspace: null

    Process {
        id: eventStream

        command: ["niri", "msg", "-j", "event-stream"]
        running: true

        stdout: SplitParser {
            onRead: data => {
                const event = JSON.parse(data);

                if (event.WorkspacesChanged) {
                    root.workspaces = event.WorkspacesChanged.workspaces.sort((a, b) => a.idx - b.idx);

                    root.focusedWorkspace = root.workspaces.find(w => w.is_focused) || root.workspaces[0];

                    return;
                }

                if (event.WorkspaceActivated) {
                    root.focusedWorkspace = event.WorkspaceActivated;
                    root.workspaces = root.workspaces.map(w => {
                        w.is_focused = w.id === root.focusedWorkspace;
                        return w;
                    });
                }
            }
        }
    }

    Process {
        id: actionProcess

        function run(args) {
            command = ["niri", "msg", "action", ...args];
            running = true;
        }
    }

    function changeFocus(id) {
        actionProcess.run(["focus-workspace", String(id)]);
    }
}
