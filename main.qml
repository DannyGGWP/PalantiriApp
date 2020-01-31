import QtQuick 2.12
import QtQuick.Controls 2.5
import Qt.labs.settings 1.0
import QtQuick.LocalStorage 2.12
ApplicationWindow {
    visible: true
    width: 1024
    height: 768
    title: qsTr("Tabs")
    Component.onCompleted: {
        var db = LocalStorage.openDatabaseSync("CompMatchDB", "0.5", "DB of Match results for scouting app", 1000000)
    }

    Settings {
        id: settings
        property bool isFirstRun: true
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
        }

        Page2Form {
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")
        }
        TabButton {
            text: qsTr("Page 2")
        }
    }
}
