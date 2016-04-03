import QtQuick 2.0

import QtQuick.Controls 1.4

Rectangle{
    id:i_RectangleSliders

//    border.color: "#C0B9B9"
//    border.width: 1

    height: i_mainRoot.height-i_Rectangle_AdvancedContol.height
    width: parent.width

    color: "#0000ffff"

    anchors.bottom: parent.bottom
    anchors.left: parent.left

    visible: true

    Rectangle{
        anchors.fill: parent
        color: "#C0B9B9"
        opacity: 0.1
    }

    Label{
        id:i_RectangleSliders_Label_0
        anchors.top: parent.top
        anchors.left: parent.left

        anchors.topMargin: parent.height*0.01
        anchors.leftMargin: parent.width*0.03

        text: qsTr("Slider's menu")
        font.bold: true
        font.family: "Courier"
        font.pixelSize: i_mainRoot.height*0.03
        horizontalAlignment: Text.AlignHCenter
    }

    Rectangle{
        id:i_RectangleSlider_xyz

        width: parent.width*0.7
        height: parent.height-i_RectangleSliders_Label_0.height

//        border.color: "green"
//        border.width: 1

        color:"#0000ffff"

        anchors.right: parent.right
        anchors.top: i_RectangleSliders_Label_0.bottom

        Rectangle{
            width: parent.width*0.9
            height: parent.height*0.9
            anchors.centerIn: parent

            clip: false
            antialiasing: true
            z: 0
            rotation: 0
            scale: 1

            color:"#0000ffff"

            StyledSlider {
                id: slider_Y_Axis_Main1

                height: parent.height*0.35
                width: parent.width

                anchors.horizontalCenterOffset: 0
                anchors.top: parent.top
                anchors.leftMargin: 0
                minimumValue: -360
                maximumValue: 360
                stepSize: 1
                orientation: Qt.Horizontal

                onValueChanged: i_mainRoot.mainRoot_Slider_Y_Axis_Main1_Value = value,i_mainRoot.mainRoot_Tab1_Is_SpeedRotation_Enable = false

                Label {
                    id: label1
                    x: parent.width*0.25
                    z: -1
                    text: qsTr("X")
                    font.bold: true
                    font.family: "consolas"
                    font.pixelSize: parent.width*0.1
                }
            }

            StyledSlider {
                id: slider_X_Axis_Main2

                height: parent.height*0.35
                width: parent.width

                anchors.horizontalCenterOffset: 0
                anchors.top: slider_Y_Axis_Main1.bottom
                anchors.leftMargin: 0
                minimumValue: -360
                maximumValue: 360
                stepSize: 1
                orientation: Qt.Horizontal

                onValueChanged: i_mainRoot.mainRoot_Slider_X_Axis_Main2_Value = value,i_mainRoot.mainRoot_Tab1_Is_SpeedRotation_Enable = false

                Label {
                    id: label2
                    x: parent.width*0.25
                    z: -1
                    text: qsTr("Y")
                    font.bold: true
                    font.family: "consolas"
                    font.pixelSize: parent.width*0.1
                }
            }

            StyledSlider {
                id: slider_Y_Axis_Main3

                height: parent.height*0.35
                width: parent.width

                anchors.horizontalCenterOffset: 0
                anchors.top: slider_X_Axis_Main2.bottom
                anchors.leftMargin: 0
                minimumValue: -360
                maximumValue: 360
                stepSize: 1
                orientation: Qt.Horizontal

                onValueChanged: i_mainRoot.mainRoot_Slider_Y_Axis_Main3_Value = value,i_mainRoot.mainRoot_Tab1_Is_SpeedRotation_Enable = false

                Label {
                    id: label3
                    x: parent.width*0.25
                    z: -1
                    text: qsTr("Z")
                    font.bold: true
                    font.family: "consolas"
                    font.pixelSize: parent.width*0.1
                }
            }
        }



    }//i_RectangleSlider_xyz:end

    Rectangle{
        id:i_verticalRectangleZoom

        width: parent.width*0.2
        height: parent.height-i_RectangleSliders_Label_0.height

//        border.color: "grey"
//        border.width: 1

        color:"#0000ffff"

        anchors.left: parent.left
        anchors.top: i_RectangleSliders_Label_0.bottom

        anchors.leftMargin: parent.width*0.05

        //Zoom-In
        Rectangle{
            id:i_rectangleZoomIn
            width: parent.width
            height: parent.height*0.2

//            border.color: "purple"
//            border.width: 1

            color:"#0000ffff"

            anchors.top:parent.top


            MouseArea{
                anchors.fill: parent
                Timer{
                    id:slider_zoomInTimer
                    repeat: true
                    interval: 10
                    onTriggered: slider_Zoom.value--,i_imageZoomIn.scale=1.1
                }

                onPressed: slider_zoomInTimer.start()
                onReleased: slider_zoomInTimer.stop(),i_imageZoomIn.scale=1
            }


            Image {
                id:i_imageZoomIn


                anchors.centerIn: parent
                source: i_mainRoot.width <= 620 ? "qrc:/icons/icons/icon-zoom-in-16.png" : "qrc:/icons/icons/icon-zoom-in.png"
            }
        }


        StyledSlider {
            id: slider_Zoom

            rotation: 180
            height: parent.height*0.6
            width: parent.width

            anchors.horizontalCenterOffset: 0
            anchors.top: i_rectangleZoomIn.bottom
            anchors.leftMargin: 0
            minimumValue: 0
            maximumValue: 100
            value: i_mainRoot.mainRoot_Slider_Zoom_Value
            stepSize: 1
            orientation: Qt.Vertical

            onValueChanged: i_mainRoot.mainRoot_Slider_Zoom_Value = value
        }


        //Zoom-Out
        Rectangle{
            width: parent.width
            height: parent.height*0.2

            color:"#0000ffff"

//            border.color: "purple"
//            border.width: 1

            MouseArea{
                anchors.fill: parent
                Timer{
                    id:slider_zoomOutTimer
                    repeat: true
                    interval: 10
                    onTriggered: slider_Zoom.value++,i_imageZoomOut.scale=1.1
                }

                onPressed: slider_zoomOutTimer.start()
                onReleased: slider_zoomOutTimer.stop(),i_imageZoomOut.scale=1
            }

            Image {
                id:i_imageZoomOut

                anchors.centerIn: parent
                source: i_mainRoot.width <= 620 ? "qrc:/icons/icons/icon-zoom-out-16.png" : "qrc:/icons/icons/icon-zoom-out.png"
            }

            anchors.bottom:parent.bottom
        }



    }//i_verticalRectangleZoom:end

}

