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
        Row {
            spacing: 1

            Label {
                text: "Xremap Command"
            }

            TextField {
                text: xrmpcfgCommandPath
                onEditingFinished: xrmpcfgCommandPath = text
            }
        }

        Row {
            spacing: 1

            Label {
                text: "Xremap Pre-Launch Command"
            }

            TextField {
                text: xrmpcfgCommandPrerun
                onEditingFinished: xrmpcfgCommandPrerun = text
            }
        }

        Row {
            spacing: 1

            Label {
                text: "Xremap Post-Launch Command"
            }

            TextField {
                text: xrmpcfgCommandPostrun
                onEditingFinished: xrmpcfgCommandPostrun = text
            }
        }

        Row {
            spacing: 1

            Label {
                text: "Layout"
            }

            TextField {
                text: xrmpcfgLayout
                onEditingFinished: xrmpcfgLayout = text
            }
        }

        Row {
            spacing: 1

            Label {
                text: "Match Mice"
            }

            CheckBox {
                checked: xrmpcfgMatchMice
                onClicked: xrmpcfgMatchMice = checked
            }
        }

        Row {
            spacing: 1

            Label {
                text: "Watch Devices"
            }

            CheckBox {
                checked: xrmpcfgWatchDevice
                onClicked: xrmpcfgWatchDevice = checked
            }
        }

        Row {
            spacing: 1

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