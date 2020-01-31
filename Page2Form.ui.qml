import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Export Data")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }
    property alias exportFile: exportFile
    TextField {
        id: exportFile
        x: 219
        y: 131
        width: 163
        height: 44
        text: qsTr("")
        placeholderText: "Export File Name"
    }
    property alias exportButton: exportButton
    Button {
        id: exportButton
        x: 247
        y: 181
        text: qsTr("Export Data")
    }
}
