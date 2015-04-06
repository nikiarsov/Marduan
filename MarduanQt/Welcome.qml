import QtQuick 2.0

Rectangle {
    signal goToPage(string page)
    property int wi: 140
    property int hi: 50
    property string mcolor: "transparent"
    id: mainPage
    anchors.top: parent.top
    //    anchors.topMargin: 80
    color: "#aed2f3"
    height: 800
    width: 800
    //    Text {
    //        id: txt
    //        text: qsTr("Welcome")
    //        anchors.centerIn: parent
    //        width: parent.width
    //        height: parent.height
    //    }
    Column{
        id: col
        width: 80
        height: 180
        spacing: 2
        anchors.top: mainPage.top
        anchors.topMargin: 4

        NButton{
            name: "Game"
            w: wi
            h: hi
        }
        NButton{
            name: "News"
            w: wi
            h: hi
        }
        NButton{
            name: "Music"
            w: wi
            h: hi
        }

    }
}

