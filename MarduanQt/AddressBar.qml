import QtQuick 2.0


Rectangle {
    property alias address: inputtext.text
    signal goToAddress(string address)
    id: addressbar
    width: parent.width - 40
    height: 40
//    anchors.horizontalCenter: parent
    anchors.left: parent.left
    anchors.leftMargin: 20
    color: "transparent"
    Rectangle{
        id:textrect
        width: parent.width - 40
        height: parent.height - 20
        color: "white"
        anchors.centerIn: parent
        TextInput{
            id: inputtext
            text: ""
            width: parent.width
            height: parent.height
            color: "black"
        }
    }
    Image {
        id: button
        source: "images/reload.png"
        width: parent.height
        height: parent.height
        anchors.right: parent.right
        MouseArea{
            anchors.fill: parent
            onClicked: goToAddress(inputtext.text)
        }
    }
}

