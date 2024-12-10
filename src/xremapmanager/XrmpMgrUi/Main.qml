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

    Connections {
        target: backend
    }

    Column {
        Row {
            spacing: 2

            Label {
                text: "Xremap Command"
            }

            TextField {
                text: xrmpcfgCommandPath
                onEditingFinished: xrmpcfgCommandPath = text
            }
        }

        Row {
            spacing: 2

            Label {
                text: "Xremap Pre-Launch Command"
            }

            TextField {
                text: xrmpcfgCommandPrerun
                onEditingFinished: xrmpcfgCommandPrerun = text
            }
        }

        Row {
            spacing: 2

            Label {
                text: "Xremap Post-Launch Command"
            }

            TextField {
                text: xrmpcfgCommandPostrun
                onEditingFinished: xrmpcfgCommandPostrun = text
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
            xrmpcfgCommandPostrun
        });
    }
}