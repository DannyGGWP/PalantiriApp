import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: page
    //    property int autoLowCount: 0
    //    property int autoHighCount: 0
    //    property int lowCount: 0
    //    property int highCount: 0

    // All Propery Aliases to beable to do real work in main.qml
    property alias teamNum: teamNum
    property alias autoLowText: autoLowText
    property alias autoLowPlus: autoLowPlus
    property alias autoHighPlus: autoHighPlus
    property alias autoHighText: autoHighText
    property alias autoLineSwitch: autoLineSwitch
    property alias submit: submit
    property alias reset: reset
    property alias alliancePos: alliancePos
    property alias startPos: startPos
    property alias matchNum: matchNum
    property alias highText: highText
    property alias highPlus: highPlus
    property alias lowPlus: lowPlus
    property alias lowText: lowText
    property alias stageTwoSwitch: stageTwoSwitch
    property alias stageThreeSwitch: stageThreeSwitch
    property alias climbedSwitch: climbedSwitch
    property alias balancedSwitch: balancedSwitch
    TextField {
        id: teamNum
        x: 480
        y: 0
        text: qsTr("")
        placeholderText: "Team #"
        validator: IntValidator {
            bottom: 1
            top: 10000
        }
    }

    TextField {
        id: matchNum
        x: 480
        y: 40
        text: qsTr("")
        placeholderText: "Match #"
        validator: IntValidator {
            bottom: 1
            top: 100
        }
    }

    GroupBox {
        id: groupBox
        x: 13
        y: 200
        width: 346
        height: 257
        title: qsTr("Tele Op")

        Rectangle {
            id: highDisp
            x: 67
            y: 48
            width: 64
            height: 54
            color: "#d0d0d0"
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
            x: 67
            y: 99
            text: qsTr("High+")
        }

        Button {
            id: lowPlus
            x: 0
            y: 99
            text: qsTr("Low+")
        }

        Rectangle {
            id: lowDisp
            x: 0
            y: 48
            width: 64
            height: 54
            color: "#d0d0d0"
            Text {
                id: lowText
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
            y: 0
            text: qsTr("Stage 2 Wheel")
        }

        Switch {
            id: stageThreeSwitch
            x: 171
            y: 54
            text: qsTr("Stage 3 Wheel")
        }

        Switch {
            id: climbedSwitch
            x: 171
            y: 108
            text: qsTr("Climbed")
        }

        Switch {
            id: balancedSwitch
            x: 171
            y: 162
            text: qsTr("Balanced")
        }
    }

    GroupBox {
        id: groupBox1
        x: 13
        y: 10
        width: 346
        height: 152
        title: qsTr("Auto")

        Rectangle {
            id: autoLowDisp
            x: -5
            y: 11
            width: 64
            height: 54
            color: "#d0d0d0"
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
            x: -5
            y: 62
            text: qsTr("Low+")
        }

        Button {
            id: autoHighPlus
            x: 62
            y: 62
            text: qsTr("High+")
        }

        Rectangle {
            id: autoHighDisp
            x: 62
            y: 11
            width: 64
            height: 54
            color: "#d0d0d0"
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
            x: 151
            y: -2
            text: qsTr("Drove Off Line")
        }
    }

    Button {
        id: submit
        x: 365
        y: 366
        width: 125
        height: 91
        text: qsTr("Submit Match")
    }

    Button {
        id: reset
        x: 496
        y: 366
        width: 107
        height: 91
        text: qsTr("Reset")
    }

    ListView {
        id: alliancePos
        x: 461
        y: 90
        width: 139
        height: 301
        anchors.right: parent.right
        anchors.rightMargin: 40
        transformOrigin: Item.Center
        model: ["Blue 1", "Blue 2", "Blue 3", "Red 1", "Red 2", "Red 3"]
        delegate: RadioDelegate {
            text: modelData
            anchors.right: parent.right
        }
    }

    ListView {
        id: startPos
        x: 369
        y: 89
        width: 139
        height: 301
        model: ["Left", "Right", "Center"]
        delegate: RadioDelegate {
            text: modelData
            anchors.right: parent.right
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:768;width:1080}
}
##^##*/

