import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 300
    height: 200
    visible: true
    title: "Xremap Manager"

    property QtObject backend

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
                text: "xremap"
            }
        }

        Button {
            text: "Apply"
            onClicked: backend.submit()
        }
    }
}