import QtQuick 2.4
import QtQuick.Controls 1.4

import QtQuick.Controls.Styles 1.4

Rectangle{
    id:i_infoRectangle
    anchors.fill: parent
    color:"#0000ffff"

    visible: false

    Rectangle{
        anchors.fill: parent
        color: "black"
        opacity: 0.4

        MouseArea{
            anchors.fill: parent
            onClicked: i_infoRectangle.visible = false
        }
    }

    Rectangle {
        id:i_infoRectangleInner

        width: i_mainRoot.width*0.9
        height: i_mainRoot.height*0.6

        anchors.centerIn: parent

                ScrollView {
                    horizontalScrollBarPolicy :Qt.ScrollBarAlwaysOff
                    verticalScrollBarPolicy : Qt.ScrollBarAsNeeded  /*Qt.ScrollBarAlwaysOn*/

                    anchors.fill: parent

                    frameVisible: true
                    highlightOnFocus: true


                    MouseArea {
//                        id: touchArea_infoInner
                        anchors.fill: parent

                        Timer {
                            id: pressAndHoldTimer_Info
                            interval: 300
                            onTriggered: i_infoRectangle.visible = false
                        }

                        onPressed: pressAndHoldTimer_Info.start()
                        onReleased: pressAndHoldTimer_Info.stop();

                        onDoubleClicked: i_infoRectangle.visible = false
                    }

                    contentItem: Text {

                        anchors.centerIn: parent

                        font.family: "Courier"
                        font.pixelSize: i_mainRoot.width*0.02
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
            }//rectangleInner:End

}
