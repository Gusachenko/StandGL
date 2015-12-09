import QtQuick 2.4

import Qt3D.Renderer 2.0
import Qt3D 2.0
import QtQuick.Scene3D 2.0
import QtQuick.Controls 1.4

import QtQuick.Controls.Styles 1.4

Item{
    id:i_mainRoot


    //MainRotation objects
    property real mainRoot_Slider_Y_Axis_Main1_Value: 0
    property real mainRoot_Slider_X_Axis_Main2_Value: 0
    property real mainRoot_Slider_Y_Axis_Main3_Value: 0

    property bool mainRoot_Is_Y_Axis_Main1_Enable: false
    property bool mainRoot_Is_X_Axis_Main2_Enable: false
    property bool mainRoot_Is_Y_Axis_Main3_Enable: false

    //MainControlMenu//

    //Timer for rotation Tab1
    property real mainRoot_Tab1_SpeedRotation_Value: 10
    property bool mainRoot_Tab1_Is_SpeedRotation_Enable: false
    property bool mainRoot_Tab1_Is_Revers_Enable: false

    //AnglePosition Tab1
    property real mainRoot_Tab1_PositionAngle: 45


    //==========================//
    //Tab1
    function set_Position_Speed_Main1(value){
        value=value*0.1
        if(!mainRoot_Tab1_Is_Revers_Enable){
            if(mainRoot_Is_Y_Axis_Main1_Enable) mainRoot_Slider_Y_Axis_Main1_Value=mainRoot_Slider_Y_Axis_Main1_Value+value;
            if(mainRoot_Is_X_Axis_Main2_Enable) mainRoot_Slider_X_Axis_Main2_Value=mainRoot_Slider_X_Axis_Main2_Value+value;
            if(mainRoot_Is_Y_Axis_Main3_Enable) mainRoot_Slider_Y_Axis_Main3_Value=mainRoot_Slider_Y_Axis_Main3_Value+value;
        } else
        {
            if(mainRoot_Is_Y_Axis_Main1_Enable) mainRoot_Slider_Y_Axis_Main1_Value=mainRoot_Slider_Y_Axis_Main1_Value-value;
            if(mainRoot_Is_X_Axis_Main2_Enable) mainRoot_Slider_X_Axis_Main2_Value=mainRoot_Slider_X_Axis_Main2_Value-value;
            if(mainRoot_Is_Y_Axis_Main3_Enable) mainRoot_Slider_Y_Axis_Main3_Value=mainRoot_Slider_Y_Axis_Main3_Value-value;
        }
    }

    Timer{
        id:i_timerSet_Position_Speed
        repeat: mainRoot_Tab1_Is_SpeedRotation_Enable
        running: mainRoot_Tab1_Is_SpeedRotation_Enable

        interval: 1
        onTriggered: set_Position_Speed_Main1(mainRoot_Tab1_SpeedRotation_Value)
    }










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


        Control_AdvancedControl{
            id:i_Rectangle_AdvancedContol


        }
        Control_SlidersControl{
            id:i_RectangleSliders
        }
    }//END CONTROL_MENU


    Control_CustomPieMenu{}


}//END MAIN_ROOT
