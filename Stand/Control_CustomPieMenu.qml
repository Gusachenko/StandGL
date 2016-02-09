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

    height: 35
    width: 35

    color: "#0000ffff"

    anchors.right: parent.right
    anchors.bottom: parent.bottom

    anchors.bottomMargin: 30
    anchors.rightMargin: 30

    radius: width/2

    MouseArea {
        id: touchArea
        anchors.fill: parent

        Timer {
            id: pressAndHoldTimer
            interval: 300
            onTriggered: pieMenu.popup(touchArea.mouseX, touchArea.mouseY);
        }

        onPressed: pressAndHoldTimer.start()
        onReleased: pressAndHoldTimer.stop();
    }

    PieMenu {
        id: pieMenu

        triggerMode: TriggerMode.TriggerOnRelease

        anchors.centerIn: i_RectangleControlPanel

        scale: 0.5

        rotation: -45

        MenuItem {
            text: "Slider's menu"
            onTriggered: i_RectangleSliders.visible = true
        }
        MenuItem {
            text: "Hide all"
            onTriggered: i_RectangleSliders.visible = false
        }
    }



}
