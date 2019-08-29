import QtQuick 2.12
import QtQuick.Window 2.12
import Core.Core 1.0
import QtQuick.Controls 2.12
import Qt.labs.settings 1.1

Window {
    id: mainWindow
    visible: true
    minimumHeight: 250
    minimumWidth: 500
    color: backgroundColor
    width: minimumWidth
    height: minimumHeight
    title: qsTr("Template1")

    Settings {
        property alias x: mainWindow.x
        property alias y: mainWindow.y
        property alias width: mainWindow.width
        property alias height: mainWindow.height
        property alias visibility: mainWindow.visibility
    }

    Button {
        id: button
        x: parent.width / 2 - width / 2
        y: parent.height / 2 - height / 2
        highlighted: true
        text: qsTr("Some Button")
        onClicked: somePopup.open()
    }

    Popup{
        id: somePopup
        width:  parent.width  * 0.75
        height: parent.height * 0.75
        x: parent.width / 2 - width / 2
        y: parent.height / 2 - height / 2
        Label {
            text: qsTr("Some Label")
            anchors.fill: parent
            color: "white"
            font.pointSize: 20
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }

    ToolButton {
        id: btnMenu
        x: parent.width - width
        y: 0
        icon.source: "qrc:/res/menu.svg"
        icon.color: colorizationColor
        width: 50
        height: 50
        onClicked: someMenu.open()
    }

    Popup{
        id: someMenu
        //width:  parent.width  * 0.75
        //height: parent.height * 0.75
        x: parent.width - width
        y: 0
        Column{
            spacing: 5
            Button {
                id: button1
                x: parent.width / 2 - width / 2
                y: parent.height / 2 - height / 2
                text: qsTr("Some Button 1")
            }
            Button {
                id: button2
                x: parent.width / 2 - width / 2
                y: parent.height / 2 - height / 2
                text: qsTr("Some Button 2")
            }
        }
    }

}
