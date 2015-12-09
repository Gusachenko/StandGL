import QtQuick 2.4

import Qt3D.Renderer 2.0
import Qt3D 2.0
import QtQuick.Scene3D 2.0
import QtQuick.Controls 1.4

import QtQuick.Controls.Styles 1.4

Item{
    id:i_mainRoot
    width: 650
    height: 425
    visible: true

    Scene3D{
        id:i_Scene3D
        anchors.rightMargin: 8
        anchors.bottomMargin: 8
        anchors.leftMargin: 12
        anchors.topMargin: 12
        anchors.fill: parent
        anchors.margins: 10
        //        focus: true
        aspects: "input"

        MainEntitySpace{
            id:i_MainEntitySpace
        }
    }//Scene3D END

    //CONTROL_MENU
    Rectangle{
        id:i_MainControl_Rect
        radius: 3
        width: parent.width*0.3
        height: parent.height
        color: "#0000ffff"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.margins: 10

//        border.color:"lightgreen"
//        border.width: 3

        property real slider_Y_Axis_Main1_Value: i_RectangleSliders.slider_Y_Axis_Main1_Value
        property real slider_X_Axis_Main2_Value: i_RectangleSliders.slider_X_Axis_Main2_Value
        property real slider_Y_Axis_Main3_Value: i_RectangleSliders.slider_Y_Axis_Main3_Value

        Control_AdvancedControl{
            id:i_Rectangle_AdvancedContol
        }
        Control_SlidersControl{
            id:i_RectangleSliders
        }
    }//END CONTROL_MENU


    Control_CustomPieMenu{}


}//END MAIN_ROOT
