import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ScrollView {
    Layout.fillWidth: true
    Layout.maximumHeight: 300
    id: devicesScroller

    property list<string> items: []

    ListView {
        anchors.fill: parent
        model: items

        delegate: Row {
            width: devicesScroller.width
            topPadding: 5
            bottomPadding: 5
            
            TextField {
                text: modelData
                width: parent.width
            }
        }
    }
}