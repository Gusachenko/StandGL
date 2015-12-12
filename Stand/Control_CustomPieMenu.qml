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
            text: "Control panel"

            onTriggered: i_Rectangle_AdvancedContol.visible = true
        }
        MenuItem {
            text: "Slider's menu"
            onTriggered: i_RectangleSliders.visible = true
        }
        MenuItem {
            text: "Hide all"
            onTriggered: i_Rectangle_AdvancedContol.visible =false ,i_RectangleSliders.visible = false
        }
    }

    Rectangle{
        id:i_rectangleButtonInfo
        width: 25
        height: 25

        anchors.top: i_RectangleControlPanel.bottom
        anchors.left: i_RectangleControlPanel.right

        anchors.topMargin: -5
        anchors.leftMargin: -5

        color: "#0000ffff"

        antialiasing: true

        Button{
            id:i_buttonInfo

            width: 20
            height: 20

            onClicked: i_dialogInfo.visible = true

            style: ButtonStyle{

                background: Rectangle{

                    width: 25
                    height: 25
                    radius: width/2

                    color: i_buttonInfo.hovered ? "lightgray" : "#0000ffff"


                    border.width: 1
                    border.color: "lightgray"

                    Label{
                        anchors.centerIn: parent
                        text: "?"

                        font.bold: true
                        font.family: "Courier"
                        font.pointSize: 10

                        color: i_buttonInfo.hovered ? "black" :  "lightgray"
                    }
                }

            }


        }
    }


    //MESSAGE DIALOG
    Dialog {
        id:i_dialogInfo
        visible: false
        title: "Справка"

        contentItem: Rectangle {

            implicitWidth: 550
            implicitHeight: 650


            ScrollView {
                horizontalScrollBarPolicy :Qt.ScrollBarAlwaysOff
                verticalScrollBarPolicy : Qt.ScrollBarAsNeeded  /*Qt.ScrollBarAlwaysOn*/

                anchors.fill: parent

                frameVisible: true
                highlightOnFocus: true


                contentItem: Text {

                    anchors.centerIn: parent

                    font.family: "Courier"
                    font.pointSize: 10
                    text: qsTr("
                                <div>
                                <ul>
                                <li><b>Позиционирование:</b></li>
                                <p>RTsetPosition(double pos, double vel):		(RotationMain2)</hr>
                                — pos абсолютная позиция поворотного стола в радианах</hr>
                                — vel скорость (рад/сек) установки поворотного стола в заданную</hr>
                                позицию.</hr>
                                Возвращаемое значение: нет</hr>
                                Функция обеспечивает поворот стола в в указанную абсолютную по-</hr>
                                зицию с заданной скоростью. Не рекомендуется задавать значение pos вы-</hr>
                                ходящее за интервал [−2π, 2π].</hr>
                                Реверс — изменение хода поворотного стенда на обратный,</hr>
                                противоположный.</p></hr>

                                <li><b>Вращение:</b></li>
                                 RTstartRotation(double vel):				(RotationMain3)</hr>
                                — vel скорость (рад/сек) установки поворотного стола в заданную</hr>
                                позицию.</hr>
                                Возвращаемое значение: нет</hr>
                                Функция запускает процесс непрерывного вращения поворотного сто-</hr>
                                ла с заданной скоростью. Знак скорости вращения определяет его направ-</hr>
                                ление. Остановить непрерывное вращение можно только функцией RTstopRotation</hr>


                                <li><b>Синусоида:</b></li>
                                 RTstartSinus(double amp, double per):			(RotationMain1)</hr>
                                — amp амплитуда поворота по синусоидальной траектории в радианах</hr>
                                — per период синусоиды, по которой выполняется поворот</hr>
                                Возвращаемое значение: нет</hr>
                                Функция поворачивает стол на один период по синусоидальной траек-</hr>
                                тории, заданной значениями амплитуды и периода. Скорость и ускорения</hr>
                                вычисляются автоматически исходя из заданных параметров.</hr>


                                <li><b>Инициализировать:</b></li></hr>
                                Обновление параметров поворотного стола</hr>

                                <li><b>Выполнить:</b></li></hr>
                                Запуск вращения поворотного стола с указаными параметрами.</hr>

                                <li><b>Стоп:</b></li>
                                Возвращаемое значение: нет</hr>
                                Функция останавливает текущее вращение поворотного стола с без-</hr>
                                опасным значением ускорения торможения. Предназначена для остановки</hr>
                                непрерывного вращения, заданного при помощи функции RTstartRotation().</hr>
                                Хотя функция в большинстве случаев способна прервать любое вращение</hr>
                                стола, ее не рекомендуется использовать для остановки вращения задан-</hr>
                                ных кроме как RTstartRotation().</hr>
                                </ul>
                                </div>")


                }


            }//ScrollView:End
        }
    }//Dialog:End

}
