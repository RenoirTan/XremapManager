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
        padding: 10
        anchors.fill: parent

        GridLayout {
            // Horrible way to set padding
            // Don't set y and height to avoid covering up the buttons at the bottom
            x: 10; width: parent.width-x*2
            columns: 2
            rowSpacing: 10
            columnSpacing: 10

            Label {
                text: "Xremap Command"
                horizontalAlignment: Text.AlignRight
                Layout.alignment: Qt.AlignRight
            }

            TextField {
                text: xrmpcfgCommandPath
                onEditingFinished: xrmpcfgCommandPath = text
                Layout.fillWidth: true
            }

            Label {
                text: "Xremap Pre-Launch Command"
                horizontalAlignment: Text.AlignRight
                Layout.alignment: Qt.AlignRight
            }

            TextField {
                text: xrmpcfgCommandPrerun
                onEditingFinished: xrmpcfgCommandPrerun = text
            }

            Label {
                text: "Xremap Post-Launch Command"
                horizontalAlignment: Text.AlignRight
                Layout.alignment: Qt.AlignRight
            }

            TextField {
                text: xrmpcfgCommandPostrun
                onEditingFinished: xrmpcfgCommandPostrun = text
            }

            Label {
                text: "Layout"
                horizontalAlignment: Text.AlignRight
                Layout.alignment: Qt.AlignRight
            }

            TextField {
                text: xrmpcfgLayout
                onEditingFinished: xrmpcfgLayout = text
            }

            Label {
                text: "Match Mice"
                horizontalAlignment: Text.AlignRight
                Layout.alignment: Qt.AlignRight
            }

            CheckBox {
                checked: xrmpcfgMatchMice
                onClicked: xrmpcfgMatchMice = checked
            }

            Label {
                text: "Watch Devices"
                horizontalAlignment: Text.AlignRight
                Layout.alignment: Qt.AlignRight
            }

            CheckBox {
                checked: xrmpcfgWatchDevice
                onClicked: xrmpcfgWatchDevice = checked
            }

            Label {
                text: "Watch Config"
                horizontalAlignment: Text.AlignRight
                Layout.alignment: Qt.AlignRight
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