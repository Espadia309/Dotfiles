pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Hyprland

// A borderless, click-through window that sits in a corner of the screen
// and shows a sprite. Which sprite it shows depends on:
//   1. "room"     -> which Hyprland workspace is currently active
//   2. "emotion"  -> changes on a timer, to fake idle animation
//
// Drop your own PNGs into assets/<room>/<emotion>.png (see README.md).

Scope {
    id: root

    // --- Map workspace id -> room name -------------------------------
    // Edit this to match how you use your workspaces. Any workspace id
    // not listed here falls back to "bedroom".
    property var roomForWorkspace: ({
        1: "bedroom",
        2: "kitchen",
        3: "hallway",
        4: "outside"
    })

    property int activeWorkspaceId: Hyprland.focusedMonitor?.activeWorkspace?.id ?? 1
    property string currentRoom: root.roomForWorkspace[root.activeWorkspaceId] || "bedroom"

    // --- Idle emotion cycling -----------------------------------------
    property var emotions: ["neutral", "happy", "confused", "sleepy", "surprised"]
    property string currentEmotion: "neutral"

    function pickRandomEmotion() {
        var list = root.emotions;
        return list[Math.floor(Math.random() * list.length)];
    }

    function spriteSource() {
        // e.g. assets/kitchen/happy.png
        return Qt.resolvedUrl("assets/" + root.currentRoom + "/" + root.currentEmotion + ".png");
    }

    // Re-roll the pose every 15-30s so she doesn't look static
    Timer {
        id: idleTimer
        interval: 15000 + Math.random() * 15000
        running: true
        repeat: true
        onTriggered: {
            root.currentEmotion = root.pickRandomEmotion();
            idleTimer.interval = 15000 + Math.random() * 15000;
        }
    }

    // Hyprland doesn't always push property updates the instant a
    // workspace event fires, so nudge it on relevant events to keep
    // activeWorkspaceId snappy. (Signal name may vary slightly by
    // Quickshell version -- check `qs -c milk-chan` output if this
    // errors, and see README.md's troubleshooting section.)
    Connections {
        target: Hyprland
        function onRawEvent(event) {
            if (event.name === "workspace" || event.name === "focusedmon") {
                Hyprland.refreshMonitors();
            }
        }
    }

    PanelWindow {
        id: panel
        anchors {
            bottom: true
            right: true
        }
        margins {
            bottom: 0
            right: 40
        }
        implicitWidth: 320
        implicitHeight: 480
        color: "transparent"

        // Let clicks pass through to whatever's behind her
        mask: Region {}

        Image {
            anchors.fill: parent
            source: root.spriteSource()
            fillMode: Image.PreserveAspectFit
            smooth: true
            cache: false

            // Fallback so a missing sprite doesn't just show a blank box
            // while you're still populating assets/.
            onStatusChanged: {
                if (status === Image.Error) {
                    console.log("[milk-chan] missing sprite: " + source);
                }
            }
        }
    }
}
