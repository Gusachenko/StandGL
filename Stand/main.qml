import QtQuick 2.4

import Qt3D.Renderer 2.0
import Qt3D 2.0
import QtQuick.Scene3D 2.0
import QtQuick.Controls 1.4
import QtQuick.Extras 1.4

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
                font.pointSize: 14
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
                                font.pointSize: 8
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
                                text:"Revers"
                                font.pointSize: 8
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

                            }


                            Label{
                                text:"Profile"
                                font.pointSize: 8
                                 verticalAlignment: Text.AlignVCenter

                            }
                            ComboBox {
                                width: parent.width*0.6
                                model: [ "Trapeze", "Zero", "Zero" ]
                                enabled: false
                            }


                            Label{
                                text:"Position"
                                font.pointSize: 8
                                verticalAlignment: Text.AlignVCenter


                            }
                            SpinBox {
                                width: parent.width*0.6


                            }


                            Label{
                                text:"Speed"
                                font.pointSize: 8

                            }
                            SpinBox {
                                width: parent.width*0.6



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
                                text:"Начальная скорость"
                                font.pointSize: 8
                                verticalAlignment: Text.AlignVCenter
                            }

                            SpinBox {
                                width: parent.width*0.4


                            }


                            Label{
                                text:"Конечная скорость"
                                font.pointSize: 8
                                 verticalAlignment: Text.AlignVCenter

                            }
                            SpinBox {
                                width: parent.width*0.4


                            }


                            Label{
                                text:"Шаг"
                                font.pointSize: 8
                                verticalAlignment: Text.AlignVCenter


                            }
                            SpinBox {
                                width: parent.width*0.4


                            }


                            Label{
                                text:"Время"
                                font.pointSize: 8

                            }
                            SpinBox {
                                width: parent.width*0.4



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
                                font.pointSize: 8
                                 verticalAlignment: Text.AlignVCenter

                            }
                            SpinBox {
                                width: parent.width*0.6


                            }


                            Label{
                                text:"Амплитуда"
                                font.pointSize: 8
                                verticalAlignment: Text.AlignVCenter


                            }
                            SpinBox {
                                width: parent.width*0.6


                            }


                            Label{
                                text:"Циклов"
                                font.pointSize: 8

                            }
                            SpinBox {
                                width: parent.width*0.6



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

                            font.pointSize: 8
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

                            font.pointSize: 8
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
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

                            font.pointSize: 8
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }
                }
            }






        }




        Rectangle{
            id:i_RectangleSliders

//            border.color: "red"
//            border.width: 1

            height: parent.height*0.3
            width: parent.width

            color: "#0000ffff"

            anchors.bottom: parent.bottom
            anchors.left: parent.left


            Column {
                anchors.leftMargin: 5
                anchors.topMargin: 10
                clip: false
                anchors.fill: parent
                antialiasing: true
                z: 0
                rotation: 0
                scale: 1
                spacing: 10

                Slider {
                    id: slider_Y_Axis_Main1

                    width: parent.width*0.9
                    anchors.horizontalCenterOffset: 0
                    anchors.leftMargin: 0
                    maximumValue: 360
                    stepSize: 1
                    orientation: Qt.Horizontal

                    Label {
                        id: label1
                        x: 54
                        y: -6
                        z: -1
                        text: qsTr("Motion1")
                        font.bold: true
                        font.family: "Courier"
                        font.pointSize: 10
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                Slider {
                    id: slider_X_Axis_Main2


                    width: parent.width*0.9
                    anchors.horizontalCenterOffset: 0
                    anchors.leftMargin: 0
                    maximumValue: 360
                    stepSize: 1
                    orientation: Qt.Horizontal

                    Label {
                        id: label2
                        x: 54
                        y: -6
                        z: -1
                        text: qsTr("Motion2")
                        font.bold: true
                        font.family: "Courier"
                        font.pointSize: 10
                        horizontalAlignment: Text.AlignHCenter
                    }
                }

                Slider {
                    id: slider_Y_Axis_Main3

                    width: parent.width*0.9
                    anchors.horizontalCenterOffset: 0
                    anchors.leftMargin: 0
                    maximumValue: 360
                    stepSize: 1
                    orientation: Qt.Horizontal

                    Label {
                        id: label3
                        x: 54
                        y: -7
                        z: -1
                        text: qsTr("Motion3")
                        font.bold: true
                        font.family: "Courier"
                        font.pointSize: 10
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }

        }




    }


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
                text: "Control panel"

                onTriggered: i_Rectangle_AdvancedContol.opacity = 1
            }
            MenuItem {
                text: "Slider's menu"
                onTriggered: i_RectangleSliders.opacity = 1
            }
            MenuItem {
                text: "Hide all"
                onTriggered: i_Rectangle_AdvancedContol.opacity = 0 ,i_RectangleSliders.opacity = 0
            }
        }

    }


}
