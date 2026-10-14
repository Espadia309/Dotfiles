import Quickshell
import QtQuick

// Entry point. Quickshell loads this file when you run `qs -c milk-chan`.
// Everything else is composed in from Mascot.qml so this file stays tiny.

ShellRoot {
    Mascot {}
}
