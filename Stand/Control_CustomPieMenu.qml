import QtQuick 2.0

import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

import QtQuick.Dialogs 1.2


Rectangle{
    id:i_RectangleControlPanel

    border.color: "lightgrey"
    border.width: 3

    antialiasing: true


    width: parent.width*0.07
    height: width

    color: "#0000ffff"

    anchors.right: parent.right
    anchors.bottom: parent.bottom

    anchors.bottomMargin: parent.height*0.03
    anchors.rightMargin: parent.width*0.03

    radius: width/2

    MouseArea {
        id: touchArea
        anchors.fill: parent

        Timer {
            id: pressAndHoldTimer
            interval: 300
            onTriggered: pieMenu.popup(touchArea.mouseX, touchArea.mouseY)
        }

        onPressed: pressAndHoldTimer.start()
        onReleased: pressAndHoldTimer.stop()
    }

    PieMenu {
        id: pieMenu

        triggerMode: TriggerMode.TriggerOnRelease

//        anchors.centerIn: i_RectangleControlPanel

        anchors.left: parent.left
        anchors.top: parent.top

        anchors.topMargin:-parent.width*1.29
        anchors.leftMargin: -parent.width*1.3

        width: i_mainRoot.width*0.23
        height: width
        rotation: -45
//        scale: i_mainRoot.width*0.001 > 0.6 ? 0.6 : i_mainRoot.width*0.001

        MenuItem {
            text: "Control panel"
            iconSource: i_mainRoot.width <= 620 ? "qrc:/icons/icons/icon-touchpad-16.png" : "qrc:/icons/icons/icon-touchpad.png"
            onTriggered: i_Rectangle_AdvancedContol.visible = true
        }
        MenuItem {
            text: "Slider's menu"
            iconSource: i_mainRoot.width <= 620 ? "qrc:/icons/icons/icon-slidersasc-16.png" : "qrc:/icons/icons/icon-slidersasc.png"
            onTriggered: i_RectangleSliders.visible = true
        }
        MenuItem {
            text: "Info"
            iconSource: i_mainRoot.width <= 620 ? "qrc:/icons/icons/icon-info-sign-16.png" : "qrc:/icons/icons/icon-info-sign.png"
            onTriggered: i_infoRectangle.visible = true
        }
        MenuItem {
            text: "Hide all"
            iconSource: i_mainRoot.width <= 620 ? "qrc:/icons/icons/icon-minimize-16.png" : "qrc:/icons/icons/icon-minimize.png"
            onTriggered: i_Rectangle_AdvancedContol.visible =false ,i_RectangleSliders.visible = false
        }
//        MenuItem {
//            text: "Main menu"
//            iconSource: i_mainRoot.width <= 620 ? "qrc:/icons/icons/icon-menu-16.png" : "qrc:/icons/icons/icon-menu.png"
//            onTriggered: i_Rectangle_AdvancedContol.visible =false ,i_RectangleSliders.visible = false
//        }
    }
}
