import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.3

Slider {
    id: styledSlider

    style: SliderStyle {
        handle: Rectangle {
            Rectangle {
                anchors.centerIn: parent
                color: "white"
                border.color: "grey"
                border.width: 1
                implicitWidth: i_mainRoot.width*0.03
                implicitHeight: implicitWidth
                radius: implicitHeight/2
            }
            anchors.centerIn: parent
            color: "transparent"
            border.width: 0
        }
    }
}
