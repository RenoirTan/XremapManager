import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {
    Layout.fillWidth: true
    // height: devicesScroller.height
    id: devicesBox

    property list<string> items: []

    signal editingFinished(list<string> newItems)

    ScrollView {
        Layout.fillWidth: true
        Layout.maximumHeight: 300
        id: devicesScroller

        ListView {
            anchors.fill: parent
            model: items
            id: devicesList

            property int selectedIndex: -1;

            delegate: Row {
                width: devicesScroller.width
                topPadding: 5
                bottomPadding: 5
                id: deviceRow

                property bool actuallyIsARow: true
                property int indexOfDelegate: index
                
                TextField {
                    text: modelData
                    width: parent.width

                    onEditingFinished: {
                        devicesList.selectedIndex = index; // when tabbed into
                        updateItem(deviceRow);
                    }

                    onPressed: (_mouseEvent) => {
                        devicesList.selectedIndex = index;
                    }
                }
            }
        }
    }

    Row {
        Button {
            text: "+"
            onClicked: editingFinished((() => {
                const newItems = getAllItems();
                newItems.splice(devicesList.selectedIndex + 1, 0, "")
                return newItems;
            })());
        }

        Button {
            text: "-"
        }

        Button {
            text: "↑"
        }

        Button {
            text: "↓"
        }
    }

    function updateItem(item) {
        const index = item.indexOfDelegate;
        console.log(index);
        items[index] = item.children[0].text;
        devicesBox.editingFinished(items);
    }

    function getAllItems() {
        const newItems = [];
        devicesList.contentItem.children.forEach((item) => {
            if (!item.actuallyIsARow) return; // sometimes a QQuickItem ends up in here somehow
            const textField = item.children[0];
            newItems.push(textField.text);
        });
        return newItems;
    }

    function sendAllItems() {
        devicesBox.editingFinished(getAllItems());
    }
}