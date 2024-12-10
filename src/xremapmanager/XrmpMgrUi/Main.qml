import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    // width: 300
    // height: 200
    visible: true
    title: "Xremap Manager"

    property QtObject backend
    property string xrmpcfgCommandPath
    property string xrmpcfgCommandPrerun
    property string xrmpcfgCommandPostrun
    property string xrmpcfgLayout
    property list<string> xrmpcfgDevicesInclude
    property list<string> xrmpcfgDevicesIgnore
    property bool xrmpcfgMatchMice
    property bool xrmpcfgWatchDevice
    property bool xrmpcfgWatchConfig

    Connections {
        target: backend
    }

    Column {
        GridLayout {
            columns: 2

            Label {
                text: "Xremap Command"
            }

            TextField {
                text: xrmpcfgCommandPath
                onEditingFinished: xrmpcfgCommandPath = text
            }

            Label {
                text: "Xremap Pre-Launch Command"
            }

            TextField {
                text: xrmpcfgCommandPrerun
                onEditingFinished: xrmpcfgCommandPrerun = text
            }

            Label {
                text: "Xremap Post-Launch Command"
            }

            TextField {
                text: xrmpcfgCommandPostrun
                onEditingFinished: xrmpcfgCommandPostrun = text
            }

            Label {
                text: "Layout"
            }

            TextField {
                text: xrmpcfgLayout
                onEditingFinished: xrmpcfgLayout = text
            }

            Label {
                text: "Match Mice"
            }

            CheckBox {
                checked: xrmpcfgMatchMice
                onClicked: xrmpcfgMatchMice = checked
            }

            Label {
                text: "Watch Devices"
            }

            CheckBox {
                checked: xrmpcfgWatchDevice
                onClicked: xrmpcfgWatchDevice = checked
            }

            Label {
                text: "Watch Config"
            }

            CheckBox {
                checked: xrmpcfgWatchConfig
                onClicked: xrmpcfgWatchConfig = checked
            }
        }

        Button {
            text: "Apply"
            onClicked: submit()
        }
    }

    function submit() {
        backend.submit({
            xrmpcfgCommandPath,
            xrmpcfgCommandPrerun,
            xrmpcfgCommandPostrun,
            xrmpcfgLayout,
            xrmpcfgDevicesInclude,
            xrmpcfgDevicesIgnore,
            xrmpcfgMatchMice,
            xrmpcfgWatchDevice,
            xrmpcfgWatchConfig
        });
    }
}