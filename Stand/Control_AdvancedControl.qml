import QtQuick 2.0

import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle{
    id:i_Rectangle_AdvancedContol

    height: parent.height*0.6
    width: parent.width

//    border.color: "#C0B9B9"
//    border.width: 1

    color: "#0000ffff"

    anchors.top: parent.top
    anchors.left: parent.left

    Rectangle{
        anchors.fill: parent
        color: "#C0B9B9"
        opacity: 0.1
    }

    Label{
        id:i_Rectangle_AdvancedContol_Label_0
        anchors.top: parent.top
        anchors.left: parent.left

        anchors.topMargin: parent.height*0.01
        anchors.leftMargin: parent.width*0.03

        text: qsTr("Control panel")
        font.bold: true
        font.family: "Courier"
        font.pixelSize: i_mainRoot.height*0.03
        horizontalAlignment: Text.AlignHCenter
    }

    Rectangle {
        id:i_Rectangle_AdvancedContol_Rectangle_1
        color: "#0000ffff"

        width: parent.width*0.9
        height: parent.height*0.6

//        border.color: "red"
//        border.width: 3

        anchors.top: i_Rectangle_AdvancedContol_Label_0.bottom
        anchors.left: i_Rectangle_AdvancedContol_Label_0.left

        Grid {
            anchors.leftMargin: parent.width*0.01
            anchors.topMargin: parent.height*0.03
            clip: false
            anchors.fill: parent
            antialiasing: true
            z: 0
            rotation: 0
            scale: 1
            spacing: 5


            columns: 2
            rows:3

//            height: parent.height*0.6
//            width: parent.width
//            anchors.fill: parent

            Label{
                width: parent.width*0.3
                height: parent.height*0.2
                text:"Reverse"
                font.pixelSize: i_Rectangle_AdvancedContol.width*0.06
                verticalAlignment: Text.AlignVCenter
            }
            Rectangle{
            id:i_rect_revers_checkbox
            width: parent.width*0.14
            height: width
            color:"#0000ffff"
                CheckBox{
                    style: CheckBoxStyle {
                        indicator: Rectangle {
                                implicitWidth: i_rect_revers_checkbox.width
                                implicitHeight:  implicitWidth
                                anchors.margins: 10
                                border.color: control.activeFocus ? "white" : "red"
                                border.width: 2

                                color:"#0000ffff"
                                Rectangle {
                                    visible: control.checked
                                    color: "#51BB00"
                                    border.color: "#333"
                                    anchors.margins: i_Rectangle_AdvancedContol.width*0.015
                                    anchors.fill: parent
                                }
                        }
                    }
                    onClicked: mainRoot_Tab1_Is_Revers_Enable = !mainRoot_Tab1_Is_Revers_Enable
                }
            }

            Label{
                width: parent.width*0.3
                height: parent.height*0.2

                text:"Profile"
                font.pixelSize: i_Rectangle_AdvancedContol.width*0.06
                verticalAlignment: Text.AlignVCenter
            }
            ComboBox {
                width: parent.width*0.55
                height: parent.height*0.2
                model: [ "Trapeze", "Zero", "Zero" ]
                enabled: false

                style: ComboBoxStyle{
                    label: Text {
                                verticalAlignment: Text.AlignVCenter
                                font.pointSize: i_Rectangle_AdvancedContol.width*0.03
                                color: "grey"
                                text: control.currentText
                            }
                }
            }

            Label{
                width: parent.width*0.3
                height: parent.height*0.5

                text:"Speed"
                font.pixelSize: i_Rectangle_AdvancedContol.width*0.06
                verticalAlignment: Text.AlignVCenter
            }
            SpinBox {
                id: i_Tab1_SpinBox_Speed

                height: parent.height*0.5
                width: parent.width*0.6

                font.pixelSize: width*0.16
                font.family: "consolas"

                horizontalAlignment: Qt.AlignLeft

                decimals: 2
                maximumValue: 99
                value: 10

                style: SpinBoxStyle{
                    background: Rectangle {
                          border.color: "#C0B9B9"
                          color: "#0000ffff"
                      }
                    incrementControl: Rectangle{
                              implicitWidth: i_Tab1_SpinBox_Speed.width*0.4
                              implicitHeight: i_Tab1_SpinBox_Speed.height*0.3
                              color: styleData.upPressed ? "#e4e4e4" : "#f6f6f6"
                              border.color: styleData.upPressed ? "#353637" : "#bdbebf"
                              border.width: 1

                              Rectangle {
                                  x: (parent.width - width) / 2
                                  y: (parent.height - height) / 2
                                  width: parent.width / 3
                                  height: 1
                                  color: control.enabled ? "#353637" : "#bdbebf"
                              }
                              Rectangle {
                                  x: (parent.width - width) / 2
                                  y: (parent.height - height) / 2
                                  width: 1
                                  height: parent.width / 3
                                  color: control.enabled ? "#353637" : "#bdbebf"
                              }
                    }
                    decrementControl: Rectangle{
                        implicitWidth: i_Tab1_SpinBox_Speed.width*0.4
                        implicitHeight: i_Tab1_SpinBox_Speed.height*0.3
                        color: styleData.downPressed ? "#e4e4e4" : "#f6f6f6"
                        border.color: styleData.downPressed ? "#353637" : "#bdbebf"
                        border.width: 1

                        Rectangle {
                            x: (parent.width - width) / 2
                            y: (parent.height - height) / 2
                            width: parent.width / 3
                            height: 1
                            color: control.enabled ? "#353637" : "#bdbebf"
                        }
                    }
                }

                onValueChanged: i_mainRoot.mainRoot_Tab1_SpeedRotation_Value = value
            }
        }

    }//i_Rectangle_AdvancedContol_Rectangle_1:End

    Rectangle{
        id: i_Rectangle_AdvancedContol_Rectangle_2

        width: parent.width*0.9
        height: parent.height*0.1

        color:"#0000ffff"

//        border.color: "blue"
//        border.width: 2

        anchors.top: i_Rectangle_AdvancedContol_Rectangle_1.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        anchors.topMargin: parent.height*0.02

        Grid {
            spacing: parent.width*0.1
            rows: 0
            columns: 0

            anchors.verticalCenter: parent.verticalCenter

            CheckBox{
                style: CheckBoxStyle {
                    indicator: Rectangle {
                            implicitWidth: i_Rectangle_AdvancedContol.width*0.13
                            implicitHeight: i_Rectangle_AdvancedContol.width*0.13
                            border.color: control.activeFocus ? "white" : "red"
                            border.width: 2

                            color:"#0000ffff"
                            Rectangle {
                                visible: control.checked
                                color: "#51BB00"
                                border.color: "#333"
                                anchors.margins: i_Rectangle_AdvancedContol.width*0.015
                                anchors.fill: parent
                            }
                    }

                    label: Text {
                        text: "x"
                        font.family: "consolas"
                        font.pixelSize:  i_Rectangle_AdvancedContol.height*0.07
                        color: "white"
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                      }
                }

                onClicked: mainRoot_Is_Y_Axis_Main1_Enable=!mainRoot_Is_Y_Axis_Main1_Enable

            }

            CheckBox{
                style: CheckBoxStyle {
                    indicator: Rectangle {
                            implicitWidth: i_Rectangle_AdvancedContol.width*0.13
                            implicitHeight: i_Rectangle_AdvancedContol.width*0.13
                            border.color: control.activeFocus ? "white" : "red"
                            border.width: 2

                            color: "#0000ffff"
                            Rectangle {
                                visible: control.checked
                                color: "#51BB00"
                                border.color: "#333"
                                anchors.margins: i_Rectangle_AdvancedContol.width*0.015
                                anchors.fill: parent
                            }
                    }
                    label: Text {
                        text: "y"
                        font.family: "consolas"
                        font.pixelSize:  i_Rectangle_AdvancedContol.height*0.07
                        color: "white"
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                      }
                }


                onClicked: mainRoot_Is_X_Axis_Main2_Enable=!mainRoot_Is_X_Axis_Main2_Enable

            }

            CheckBox{
                style: CheckBoxStyle {
                    indicator: Rectangle {
                            implicitWidth: i_Rectangle_AdvancedContol.width*0.13
                            implicitHeight: i_Rectangle_AdvancedContol.width*0.13
                            border.color: control.activeFocus ? "white" : "red"
                            border.width: 2

                            color: "#0000ffff"
                            Rectangle {
                                visible: control.checked
                                color: "#51BB00"
                                border.color: "#333"
                                anchors.margins: i_Rectangle_AdvancedContol.width*0.015
                                anchors.fill: parent
                            }
                    }
                    label: Text {
                        text: "z"
                        font.family: "consolas"
                        font.pixelSize:  i_Rectangle_AdvancedContol.height*0.07
                        color: "white"
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                      }
                }

                onClicked: mainRoot_Is_Y_Axis_Main3_Enable=!mainRoot_Is_Y_Axis_Main3_Enable

            }
        }//Gid:End
    }//i_Rectangle_AdvancedContol_Rectangle_2: End

    Rectangle{
        id:i_Rectangle_AdvancedContol_Rectangle_3
        anchors.top: i_Rectangle_AdvancedContol_Rectangle_2.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        anchors.topMargin: parent.height*0.03

        width: parent.width*0.98
        height: parent.height*0.15

//        border.color: "green"
//        border.width: 2

        color: "#0000ffff"

        Button {
            id: button2

            width: parent.width*0.55
            height: parent.height

            anchors.verticalCenter: parent.verticalCenter

            anchors.left: parent.left
//            anchors.leftMargin: parent.width*0.1

            style: ButtonStyle{
                label: Text{
                    text: qsTr("Run")
                    font.pixelSize: i_Rectangle_AdvancedContol.width*0.06
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            onClicked: mainRoot_Tab1_Is_SpeedRotation_Enable=true
        }

        Button {
            id: button3

            width: parent.width*0.35
            height: parent.height

            anchors.verticalCenter: parent.verticalCenter

            anchors.left: button2.right
            anchors.leftMargin: parent.width*0.05

            style: ButtonStyle{
                label: Text{
                    text: qsTr("Stop")

                    font.pixelSize: i_Rectangle_AdvancedContol.width*0.06
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            onClicked: mainRoot_Tab1_Is_SpeedRotation_Enable=false
        }
    }//i_Rectangle_AdvancedContol_Rectangle_3:End
}

