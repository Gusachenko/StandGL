import QtQuick 2.0

import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle{
    id:i_Rectangle_AdvancedContol

//            border.color: "pink"
//            border.width: 5


    height: parent.height*0.7
    width: parent.width

    color: "#0000ffff"

    anchors.top: parent.top
    anchors.left: parent.left

    Label{
        anchors.top: parent.top
        anchors.left: parent.left

        anchors.topMargin: 10
        anchors.leftMargin: 5

        text: qsTr("Control panel")
        font.bold: true
        font.family: "Courier"
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
    }



    TabView {
        id:i_TabView_AdvancedContol



        anchors.top: parent.top
        anchors.left: parent.left

        anchors.topMargin: 30
        anchors.leftMargin: 5

        width: parent.width*0.98
        height: parent.height*0.6


        style: TabViewStyle {

                frameOverlap: 1

                tab: Rectangle {
                    color:  "#0000ffff"
                    border.color:  styleData.selected ? "steelblue" :"lightsteelblue"
                    border.width: 2
                    implicitWidth: Math.max(text.width + 4, 60)
                    implicitHeight: 20
                    radius: 2

                    Text {
                        id: text
                        anchors.centerIn: parent
                        text: styleData.title
                        color: styleData.selected ? "white" : "black"
                        font.bold: styleData.selected ? true : false
                        font.pixelSize: 8
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
                frame: Rectangle {
                    color: "#0000ffff"
                    border.color: "lightsteelblue"
                    border.width: 2
                    }
            }



        //TAB1
        Tab {
            id:i_TabView_AdvancedContol_Tab1
            title:qsTr("Позиционирование")



            Rectangle {
                id:i_TabView_AdvancedContol_Tab1_Rectangle
                color: "#0000ffff"



                Grid {
                    anchors.leftMargin: 5
                    anchors.topMargin: 10
                    clip: false
                    anchors.fill: parent
                    antialiasing: true
                    z: 0
                    rotation: 0
                    scale: 1
                    spacing: 5


                    columns: 2
                    rows:4

                    height: parent.height*0.6
                    width: parent.width

                    Label{
                        text:"Реверс"
                        font.pixelSize: 8
                         verticalAlignment: Text.AlignVCenter
                    }

                    CheckBox{

                        style: CheckBoxStyle {
                            indicator: Rectangle {
                                    implicitWidth: 16
                                    implicitHeight: 16
                                    radius: 3
                                    border.color: control.activeFocus ? "darkblue" : "gray"
                                    border.width: 1
                                    Rectangle {
                                        visible: control.checked
                                        color: "#555"
                                        border.color: "#333"
                                        radius: 1
                                        anchors.margins: 4
                                        anchors.fill: parent
                                    }
                            }
                        }

                        onClicked: mainRoot_Tab1_Is_Revers_Enable = !mainRoot_Tab1_Is_Revers_Enable



                    }


                    Label{
                        text:"Профиль"
                        font.pixelSize: 8
                         verticalAlignment: Text.AlignVCenter

                    }
                    ComboBox {
                        width: parent.width*0.6
                        model: [ "Трапеция", "Zero", "Zero" ]
                        enabled: false
                    }


                    Label{
                        text:"Позиция"
                        font.pixelSize: 8
                        verticalAlignment: Text.AlignVCenter


                    }
                    SpinBox {
                        id:i_TabView_AdvancedContol_Tab1_Position

                        width: parent.width*0.5

                        decimals: 2
                        maximumValue: 360
                        value: 45

                        onValueChanged: mainRoot_Slider_X_Axis_Main2_Value = value
                    }


                    Label{
                        text:"Скорость"
                        font.pixelSize: 8

                        width: parent.width*0.3

                    }
                    SpinBox {
                        id: i_Tab1_SpinBox_Speed

                        width: parent.width*0.5

                        decimals: 2
                        maximumValue: 360
                        value: 10

                        onValueChanged: i_mainRoot.mainRoot_Tab1_SpeedRotation_Value = value


                    }



                }

            }
        }





        //TAB2
        Tab {
            id:i_TabView_AdvancedContol_Tab2
            title: "Вращение"

            Rectangle {
                color: "#0000ffff"


                Column {
                    anchors.leftMargin: 5
                    anchors.topMargin: 10
                    clip: false
                    anchors.fill: parent
                    antialiasing: true
                    z: 0
                    rotation: 0

                    Row {
                        id: row1
                        width: parent.width
                        height: 30

                        Label {
                            id: label1
                            text: qsTr("Начальная скорость")

                            font.pixelSize: 8
                            verticalAlignment: Text.AlignVCenter

                            width: parent.width*0.55
                        }

                        SpinBox {
                            id: spinBox1

                            decimals: 2
                            maximumValue: 360
                            value: 0
                        }
                    }

                    Row {
                        id: row2
                        width: parent.width
                        height: 30
                        Label {
                            id: label2
                            text: qsTr("Конечная скорость")

                            font.pixelSize: 8
                            verticalAlignment: Text.AlignVCenter

                            width: parent.width*0.55
                        }

                        SpinBox {
                            id: spinBox2
                            decimals: 2
                            maximumValue: 360
                            value: 100
                        }
                    }

                    Row {
                        id: row3
                        width: parent.width
                        height: 30
                        Label {
                            id: label3
                            text: qsTr("Шаг")

                            font.pixelSize: 8
                            verticalAlignment: Text.AlignVCenter

                            width: parent.width*0.55
                        }

                        SpinBox {
                            id: spinBox3
                            decimals: 2
                            maximumValue: 360
                            value: 1
                        }
                    }

                    Row {
                        id: row4
                        width: parent.width
                        height: 30
                        Label {
                            id: label4
                            text: qsTr("Время")

                            font.pixelSize: 8
                            verticalAlignment: Text.AlignVCenter

                            width: parent.width*0.55
                        }

                        SpinBox {
                            id: spinBox4
                            decimals: 2
                            maximumValue: 360
                            value: 10
                        }
                    }
                }


            }




        }

        //TAB3
        Tab {
            id:i_TabView_AdvancedContol_Tab3
            title: "Синусоида"


            Rectangle {
                color: "#0000ffff"

                Grid {
                    anchors.leftMargin: 5
                    anchors.topMargin: 10
                    clip: false
                    anchors.fill: parent
                    antialiasing: true
                    z: 0
                    rotation: 0
                    scale: 1
                    spacing: 5


                    columns: 2
                    rows:4

                    height: parent.height*0.6




                    Label{
                        text:"Период"
                        font.pixelSize: 8
                         verticalAlignment: Text.AlignVCenter

                    }
                    SpinBox {
                        width: parent.width*0.6

                        decimals: 2
                        maximumValue: 360
                        value: 1


                    }


                    Label{
                        text:"Амплитуда"
                        font.pixelSize: 8
                        verticalAlignment: Text.AlignVCenter


                    }
                    SpinBox {
                        width: parent.width*0.6

                        decimals: 2
                        maximumValue: 360
                        value: 1


                    }


                    Label{
                        text:"Циклов"
                        font.pixelSize: 8

                    }
                    SpinBox {
                        width: parent.width*0.6

                        decimals: 0
                        maximumValue: 360
                        value: 1



                    }



                }

            }



        }
    }


    Grid {

        id:i_TabView_AdvancedContol_Grid_Checkboxes_XYZ

        spacing: parent.width*0.2
        rows: 0
        columns: 0

        width: parent.width*0.9

        anchors.top:  i_TabView_AdvancedContol.bottom
        anchors.horizontalCenter: i_TabView_AdvancedContol.horizontalCenter

        anchors.topMargin: 10

        CheckBox{
            text:qsTr("x")
            style: CheckBoxStyle {
                indicator: Rectangle {
                        implicitWidth: 16
                        implicitHeight: 16
                        radius: 3
                        border.color: control.activeFocus ? "darkblue" : "gray"
                        border.width: 1
                        Rectangle {
                            visible: control.checked
                            color: "#555"
                            border.color: "#333"
                            radius: 1
                            anchors.margins: 4
                            anchors.fill: parent
                        }
                }
            }

            onClicked: mainRoot_Is_Y_Axis_Main1_Enable=!mainRoot_Is_Y_Axis_Main1_Enable

        }

        CheckBox{
            text:qsTr("y")
            style: CheckBoxStyle {
                indicator: Rectangle {
                        implicitWidth: 16
                        implicitHeight: 16
                        radius: 3
                        border.color: control.activeFocus ? "darkblue" : "gray"
                        border.width: 1
                        Rectangle {
                            visible: control.checked
                            color: "#555"
                            border.color: "#333"
                            radius: 1
                            anchors.margins: 4
                            anchors.fill: parent
                        }
                }
            }


            onClicked: mainRoot_Is_X_Axis_Main2_Enable=!mainRoot_Is_X_Axis_Main2_Enable

        }

        CheckBox{
            text:qsTr("z")
            style: CheckBoxStyle {
                indicator: Rectangle {
                        implicitWidth: 16
                        implicitHeight: 16
                        radius: 3
                        border.color: control.activeFocus ? "darkblue" : "gray"
                        border.width: 1
                        Rectangle {
                            visible: control.checked
                            color: "#555"
                            border.color: "#333"
                            radius: 1
                            anchors.margins: 4
                            anchors.fill: parent
                        }
                }
            }

            onClicked: mainRoot_Is_Y_Axis_Main3_Enable=!mainRoot_Is_Y_Axis_Main3_Enable

        }










    }//


    Rectangle{

        anchors.top: i_TabView_AdvancedContol.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        anchors.topMargin: 30

        width: parent.width*0.98
        height: parent.height*0.1

        color: "#0000ffff"

        Button {
            id: button1

            width: 93
            height: 20

            anchors.verticalCenter: parent.verticalCenter

            anchors.left: parent.left
            anchors.leftMargin: 1

            style: ButtonStyle{
                label: Text{
                    text: qsTr("Инициализировать")

                    font.pixelSize: 8
                    horizontalAlignment: Text.AlignHCenter
                }
            }


        }

        Button {
            id: button2

            width: 56
            height: 20

            anchors.verticalCenter: parent.verticalCenter

            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.55

            style: ButtonStyle{
                label: Text{
                    text: qsTr("Выполнить")

                    font.pixelSize: 8
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            onClicked: mainRoot_Tab1_Is_SpeedRotation_Enable=true

        }

        Button {
            id: button3

            width: 26
            height: 20

            anchors.verticalCenter: parent.verticalCenter

            anchors.left: button2.right
            anchors.leftMargin: 3

            style: ButtonStyle{
                label: Text{
                    text: qsTr("Стоп")

                    font.pixelSize: 8
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            onClicked: mainRoot_Tab1_Is_SpeedRotation_Enable=false


        }
    }






}

