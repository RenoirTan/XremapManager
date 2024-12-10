import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 300
    height: 200
    visible: true
    title: "Xremap Manager"

    property QtObject backend
    property string xrmpcfgCommandPath

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

        Button {
            text: "Apply"
            onClicked: submit()
        }
    }

    function submit() {
        backend.submit({xrmpcfgCommandPath});
    }
}