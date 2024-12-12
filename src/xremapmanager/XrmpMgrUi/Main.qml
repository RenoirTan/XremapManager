import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    // width: 300
    // height: 200
    minimumWidth: 600
    visible: true
    title: "Xremap Manager"
    id: root

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
        anchors.fill: parent
        width: parent.width
        spacing: 10

        ScrollView {
            height: parent.height - bottomRow.height - 10
            width: root.width
            padding: 10

            GridLayout {
                // Horrible way to set padding
                // Don't set y and height to avoid covering up the buttons at the bottom
                x: 10; width: root.width-x*5 // 5 because 2 is not enough for some reason
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
                    Layout.fillWidth: true
                }

                Label {
                    text: "Xremap Post-Launch Command"
                    horizontalAlignment: Text.AlignRight
                    Layout.alignment: Qt.AlignRight
                }

                TextField {
                    text: xrmpcfgCommandPostrun
                    onEditingFinished: xrmpcfgCommandPostrun = text
                    Layout.fillWidth: true
                }

                Label {
                    text: "Layout"
                    horizontalAlignment: Text.AlignRight
                    Layout.alignment: Qt.AlignRight
                }

                TextField {
                    text: xrmpcfgLayout
                    onEditingFinished: xrmpcfgLayout = text
                    Layout.fillWidth: true
                }

                Label {
                    text: "Include Devices"
                    horizontalAlignment: Text.AlignRight
                    Layout.alignment: Qt.AlignRight
                }

                Devices {
                    items: xrmpcfgDevicesInclude
                    // might cause re-rendering, should probably check later
                    onEditingFinished: (newItems) => xrmpcfgDevicesInclude = newItems
                }

                Label {
                    text: "Ignore Devices"
                    horizontalAlignment: Text.AlignRight
                    Layout.alignment: Qt.AlignRight
                }

                Devices {
                    items: xrmpcfgDevicesIgnore
                    // might cause re-rendering, should probably check later
                    onEditingFinished: (newItems) => xrmpcfgDevicesIgnore = newItems
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
        }

        Row {
            padding: 10
            id: bottomRow

            Button {
                text: "Apply"
                onClicked: submit()
            }
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