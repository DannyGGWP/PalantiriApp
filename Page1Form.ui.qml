import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: page
    //    property int autoLowCount: 0
    //    property int autoHighCount: 0
    //    property int lowCount: 0
    //    property int highCount: 0

    // All Propery Aliases to be vable to do real work in main.qml
    property alias autoLowText: autoLowText
    property alias autoLowPlus: autoLowPlus
    property alias autoHighPlus: autoHighPlus
    property alias autoHighText: autoHighText
    property alias autoLineSwitch: autoLineSwitch
    property alias submit: submit
    property alias reset: reset
    property alias highText: highText
    property alias highPlus: highPlus
    property alias lowPlus: lowPlus
    property alias lowText: lowText
    property alias stageTwoSwitch: stageTwoSwitch
    property alias stageThreeSwitch: stageThreeSwitch
    property alias climbedSwitch: climbedSwitch
    property alias balancedSwitch: balancedSwitch
    property alias defenceSwitch: defenceSwitch
    property alias notesText: notesText
    property alias teamNum: teamNum
    property alias matchNum: matchNum
    title: "Scouting"
    font.wordSpacing: 0

    ScrollView {
        id: scrollView
        padding: 10
        anchors.fill: parent

        Flow {
            id: element
            x: 0
            y: 0
            width: 1059
            height: 748
            spacing: 10
            layoutDirection: Qt.LeftToRight
            flow: Flow.LeftToRight

            Column {
                id: column
                width: 345
                height: 580
                spacing: 10

                GroupBox {
                    id: matchInfoBox
                    width: 346
                    height: 125
                    title: qsTr("Match Info")

                    TextField {
                        id: teamNum
                        x: 202
                        text: qsTr("")
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.top: parent.top
                        anchors.topMargin: 0
                        placeholderText: "Team #"
                        validator: IntValidator {
                            top: 10000
                            bottom: 1
                        }
                    }

                    TextField {
                        id: matchNum
                        x: 202
                        text: qsTr("")
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        placeholderText: "Match #"
                        validator: IntValidator {
                            top: 100
                            bottom: 1
                        }
                        anchors.topMargin: 0
                        anchors.top: teamNum.bottom
                    }
                }

                GroupBox {
                    id: groupBox1
                    width: 346
                    height: 152
                    title: qsTr("Auto")

                    Rectangle {
                        id: autoLowDisp
                        width: 64
                        height: 54
                        color: "#d0d0d0"
                        anchors.left: parent.left
                        anchors.leftMargin: -5
                        anchors.top: parent.top
                        anchors.topMargin: 11
                        Text {
                            id: autoLowText
                            text: "0"
                            font.pointSize: 34
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            property int property0: 0
                            x: 0
                            y: 0
                            width: 64
                            height: 54
                        }
                    }

                    Button {
                        id: autoLowPlus
                        text: qsTr("Low+")
                        anchors.left: parent.left
                        anchors.leftMargin: -5
                        anchors.top: autoLowDisp.bottom
                        anchors.topMargin: -3
                    }

                    Button {
                        id: autoHighPlus
                        text: qsTr("High+")
                        anchors.left: autoLowPlus.right
                        anchors.leftMargin: 3
                        anchors.top: autoHighDisp.bottom
                        anchors.topMargin: -3
                    }

                    Rectangle {
                        id: autoHighDisp
                        width: 64
                        height: 54
                        color: "#d0d0d0"
                        anchors.left: parent.left
                        anchors.leftMargin: 62
                        anchors.top: autoLowDisp.bottom
                        anchors.topMargin: -54
                        Text {
                            id: autoHighText
                            width: 64
                            height: 54
                            text: "0"
                            font.pointSize: 34
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            fontSizeMode: Text.Fit
                        }
                    }

                    Switch {
                        id: autoLineSwitch
                        x: 171
                        text: qsTr("Drove Off Line")
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.top: parent.top
                        anchors.topMargin: 0
                    }
                }

                GroupBox {
                    id: groupBox
                    width: 346
                    height: 308
                    title: qsTr("Tele Op")

                    Rectangle {
                        id: highDisp
                        width: 64
                        height: 54
                        color: "#d0d0d0"
                        anchors.left: lowDisp.right
                        anchors.leftMargin: 6
                        anchors.top: parent.top
                        anchors.topMargin: 16
                        Text {
                            id: highText
                            width: 64
                            height: 54
                            text: "0"
                            font.pointSize: 34
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    Button {
                        id: highPlus
                        text: qsTr("High+")
                        anchors.left: lowPlus.right
                        anchors.leftMargin: 6
                        anchors.top: highDisp.bottom
                        anchors.topMargin: 2
                    }

                    Button {
                        id: lowPlus
                        text: qsTr("Low+")
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.top: lowDisp.bottom
                        anchors.topMargin: 2
                    }

                    Rectangle {
                        id: lowDisp
                        width: 64
                        height: 54
                        color: "#d0d0d0"
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        anchors.top: parent.top
                        anchors.topMargin: 16
                        Text {
                            id: lowText
                            x: 0
                            y: 0
                            width: 64
                            height: 54
                            text: "0"
                            font.pointSize: 34
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    Switch {
                        id: stageTwoSwitch
                        x: 171
                        text: qsTr("Stage 2 Wheel")
                        anchors.right: parent.right
                        anchors.rightMargin: -1
                        anchors.top: parent.top
                        anchors.topMargin: 0
                    }

                    Switch {
                        id: stageThreeSwitch
                        x: 171
                        text: qsTr("Stage 3 Wheel")
                        anchors.right: parent.right
                        anchors.rightMargin: -1
                        anchors.top: stageTwoSwitch.bottom
                        anchors.topMargin: 0
                    }

                    Switch {
                        id: climbedSwitch
                        x: 171
                        text: qsTr("Climbed")
                        anchors.right: parent.right
                        anchors.rightMargin: 40
                        anchors.top: stageThreeSwitch.bottom
                        anchors.topMargin: 1
                    }

                    Switch {
                        id: balancedSwitch
                        x: 171
                        text: qsTr("Balanced")
                        anchors.right: parent.right
                        anchors.rightMargin: 34
                        anchors.top: climbedSwitch.bottom
                        anchors.topMargin: 1
                    }

                    Switch {
                        id: defenceSwitch
                        x: 171
                        y: 193
                        text: qsTr("Played Defence")
                        anchors.right: parent.right
                        anchors.rightMargin: -6
                        anchors.top: balancedSwitch.bottom
                        anchors.topMargin: 1
                    }
                }
            }

            Column {
                id: column1
                width: 263
                height: 400

                GroupBox {
                    id: groupBox2
                    width: 264
                    height: 330
                    title: qsTr("Other")

                    TextArea {
                        id: notesText
                        width: 238
                        text: qsTr("")
                        anchors.left: parent.left
                        anchors.leftMargin: -3
                        anchors.bottom: submit.top
                        anchors.bottomMargin: 6
                        placeholderText: "Notes"
                    }

                    Button {
                        id: submit
                        y: 360
                        width: 125
                        height: 91
                        text: qsTr("Submit Match")
                        anchors.left: parent.left
                        anchors.leftMargin: -3
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                    }

                    Button {
                        id: reset
                        y: 360
                        width: 107
                        height: 91
                        text: qsTr("Reset")
                        anchors.left: submit.right
                        anchors.leftMargin: 6
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                    }
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:768;width:1080}D{i:7;anchors_y:50}D{i:10;anchors_x:"-5";anchors_y:11}
D{i:12;anchors_x:"-5";anchors_y:62}D{i:13;anchors_x:62;anchors_y:62}D{i:14;anchors_x:62;anchors_y:11}
D{i:16;anchors_y:0}D{i:9;anchors_x:13;anchors_y:10}D{i:17;anchors_x:365;anchors_y:10}
D{i:30;anchors_x:13;anchors_y:168}D{i:2;anchors_height:748;anchors_width:1059;anchors_x:0;anchors_y:0}
D{i:1;anchors_height:200;anchors_width:200}
}
##^##*/

