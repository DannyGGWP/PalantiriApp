import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: page
    width: 600
    height: 400

    header: Label {
        text: qsTr("Configuration Tab")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }
    property alias exportFile: exportFile
    property alias exportButton: exportButton
    property alias allianceStation: allianceStation
    property alias compName: compName
    property alias updateSettings: updateSettings
    property alias serverUrl: serverUrl
    property alias uploadProgress: uploadProgressBar.value
    property alias uploadButton: uploadButton
    GroupBox {
        id: exportControls
        width: 200
        height: 275
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 0
        title: qsTr("Export Controls")

        Button {
            id: exportButton
            x: 23
            y: 128
            text: qsTr("Export Data")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: exportFile
            x: 7
            width: 163
            height: 44
            text: qsTr("")
            anchors.horizontalCenterOffset: 1
            anchors.top: label.bottom
            anchors.topMargin: 6
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: "Export File Name"
        }

        Label {
            id: label
            x: 3
            width: 170
            height: 37
            text: qsTr("Files will be exported to the home directory")
            anchors.top: parent.top
            anchors.topMargin: 23
            wrapMode: Text.WordWrap
        }
    }

    GroupBox {
        id: compConfig
        width: 196
        height: 275
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: exportControls.right
        anchors.leftMargin: 6
        title: qsTr("Competition Configuration")

        ComboBox {
            id: allianceStation
            y: 141
            height: 48
            textRole: qsTr("")
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: updateSettings.top
            anchors.bottomMargin: 14
            currentIndex: -1
            model: ["Red 1", "Red 2", "Red 3", "Blue 1", "Blue 2", "Blue 3"]
        }

        TextField {
            id: compName
            height: 44
            text: qsTr("")
            anchors.right: parent.right
            anchors.rightMargin: 0
            placeholderText: "Competition"
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 21
        }

        Label {
            id: label1
            y: 105
            text: qsTr("Alliance Station")
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.bottom: allianceStation.top
            anchors.bottomMargin: 6
        }

        Button {
            id: updateSettings
            y: 203
            text: qsTr("Update Settings")
            anchors.left: parent.left
            anchors.leftMargin: 19
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
        }
    }
    GroupBox {
        id: groupBox
        x: 418
        y: 46
        width: 174
        height: 274
        title: qsTr("Server Upload")

        TextField {
            id: serverUrl
            height: 44
            text: qsTr("")
            anchors.right: parent.right
            anchors.leftMargin: 0
            anchors.topMargin: 21
            placeholderText: "Scouting Server URL"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.rightMargin: 0
        }

        Button {
            id: uploadButton
            x: 29
            y: 201
            text: qsTr("Upload")
        }

        ProgressBar {
            id: uploadProgressBar
            x: -12
            y: 99
            width: 174
            height: 34
            value: 0.0
        }
    }
}

/*##^##
Designer {
    D{i:4;anchors_y:20}D{i:2;anchors_x:10;anchors_y:0}
}
##^##*/

