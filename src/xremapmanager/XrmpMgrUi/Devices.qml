import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ScrollView {
    Layout.fillWidth: true
    Layout.maximumHeight: 300
    id: devicesScroller

    property list<string> items: []

    signal editingFinished(list<string> newItems)

    ListView {
        anchors.fill: parent
        model: items
        id: devicesList

        delegate: Row {
            width: devicesScroller.width
            topPadding: 5
            bottomPadding: 5

            property bool actuallyIsARow: true
            
            TextField {
                text: modelData
                width: parent.width

                onEditingFinished: sendAllItems()
            }
        }
    }

    function getAllItems() {
        const newItems = [];
        devicesList.contentItem.children.forEach((item) => {
            if (!item.actuallyIsARow) return; // sometimes a QQuickItem ends up in here somehow
            const textField = item.children[0];
            newItems.push(textField.text);
        });
        console.log(newItems);
        return newItems;
    }

    function sendAllItems() {
        devicesScroller.editingFinished(getAllItems());
    }
}