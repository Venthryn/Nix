import Quickshell
import Quickshell.Io
import QtQuick



Scope {
    id: root
    property string time: Qt.formatTime(clock.date, "hh:mm")
    property string battery
    property string status

    Variants {
        model: Quickshell.screens

        PanelWindow {
            property var modelData
            screen: modelData
            color: "#191724"
            //color: "black"
            
            anchors {
                top: true
                left: true
                right: true
            }


            implicitHeight: 30

            Text {
                text: time
                anchors.centerIn: parent
                color:"#e0def4"
            }
            Text {
                text: battery
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 10
                color: "#e0def4"
            }
        }
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    Process {
        id: batProc
        command: ["cat", "/sys/class/power_supply/BAT0/capacity"]
        running: true

        stdout: StdioCollector {
          onStreamFinished: root.battery = this.text
        }
    }

    Timer {
        interval: 10000
        running: true
        repeat: true
        onTriggered: batProc.running = true
    }
}
