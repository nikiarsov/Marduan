import QtQuick 2.0

Rectangle{
    property int w: 10
    property int h: 10
    property string mcolor: "transparent"
    property string name: "Button"
    width: w
    height: h
    color: mcolor
    Image {
        id: button
        source: "images/button-menu-blue.png"
        width: w
        height: h
        anchors.centerIn: parent
        Text {
            id: game
            text: qsTr("<a href='/?action=games'>" + name + "</a>")
            //                    text: qsTr("Games")
            anchors.centerIn: parent
            //                onLinkActivated: Qt.openUrlExternally("http://192.168.3.4:7777/" + link)
            //                onLinkActivated: goToPage("http://192.168.3.4:7777/" + link)
        }

        //change the color of the button in differen button states
        states: [
            State {
                name: "Hovering"
                PropertyChanges {
                    target: button
                    rotation: 180
                }
            },
            State {
                name: "Pressed"
                PropertyChanges {
                    target: button
                    rotation: 0
                }
            }
        ]

        //define transmission for the states
        transitions: [
            Transition {
                from: ""; to: "Hovering"
                ColorAnimation { duration: 200 }
            },
            Transition {
                from: "*"; to: "Pressed"
                ColorAnimation { duration: 10 }
            }
        ]

        //Mouse area to react on click events
        MouseArea {
            hoverEnabled: true
            anchors.fill: button
            onEntered: { button.state='Hovering'}
            onExited: { button.state=''}
            onClicked: { goToPage("http://192.168.3.4:7777/?action=games" )}
            onPressed: { button.state="Pressed" }
            onReleased: {
                if (containsMouse)
                    button.state="Hovering";
                else
                    button.state="";
            }
        }
    }


}
