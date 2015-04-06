import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import Qt.WebSockets 1.0

ApplicationWindow {
    id: app
    title: qsTr("Hello World")
    width: 300
    height: 600
    visible: true

    property string urlAddress: "https://github.com/nikiarsov/Marduan" //"http://79.143.179.31:7777/"

    menuBar: MenuBar {
        id: menu
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: messageDialog.show(qsTr("Open action triggered"));
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }

        }

    }

    AddressBar{
        id: addressbar
        address: urlAddress
        onGoToAddress: {
            //            windowLoader.source = ""
            windowLoader.source = address
        }
    }

    Item{
        id: mainpage
        width: parent.width
        height: parent.height - addressbar.height
        anchors.top: addressbar.bottom

        Loader {
            id: windowLoader
            source: ""
            focus: true
//            anchors.top: parent.top
            anchors.topMargin: 180
            onLoaded: item.parent =  mainpage
            Binding { target: windowLoader.item; property: "title"; }
            //            sourceComponent: showContent
            //            property bool valid: item !== null
        }

        Connections{
            id: conn
            target: windowLoader.item
            onGoToPage:{
                addressbar.address = urlAddress + page
                windowLoader.source = ""
                windowLoader.source = addressbar.address
            }
        }
    }
}
