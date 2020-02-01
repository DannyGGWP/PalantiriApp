import QtQuick 2.12
import QtQuick.Controls 2.5
import Qt.labs.settings 1.0
import QtQuick.LocalStorage 2.12
import QtQuick.Dialogs 1.3
import "dbFunctions.js" as DbFunc
ApplicationWindow {
    visible: true
    width: 1024
    height: 768
    title: qsTr("Tabs")

    Component.onCompleted: {
        var db = DbFunc.getDbHandle()
        if (settings.isFirstRun == true)
        {

            db.transaction( function(tx){
                            DbFunc.init(tx)
                        }
                        )
            settings.isFirstRun = false
        }
    }

    property int autoLowCount: 0
    property int autoHighCount: 0
    property int lowCount: 0
    property int highCount: 0
    property bool droveInAuto: false
    property bool didSecondStageWheel: false
    property bool didThirdStageWheel: false
    property bool robotHang: false
    property bool balancedHang: false
    property bool playedDefence: false
    property string robotStartingPos: ""
    property string teamAlliancePos: ""

    Settings {
        id: settings
        property bool isFirstRun: true
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
            autoLowPlus.onClicked: { autoLowCount++; autoLowText.text = autoLowCount; }
            autoHighPlus.onClicked: {autoHighText.text = ++autoHighCount; }
            lowPlus.onClicked: { lowText.text = ++lowCount}
            highPlus.onClicked: { highText.text = ++highCount}
            autoLineSwitch.onClicked: {
                droveInAuto = handleSwitchSet(autoLineSwitch.position);
            }
            stageTwoSwitch.onClicked: {
                didSecondStageWheel = handleSwitchSet(stageTwoSwitch.position)
            }
            stageThreeSwitch.onClicked: {
                didThirdStageWheel = handleSwitchSet(stageThreeSwitch.position)
            }
            climbedSwitch.onClicked: {
                robotHang = handleSwitchSet(climbedSwitch.position)
            }
            balancedSwitch.onClicked: {
                balancedHang = handleSwitchSet(balancedSwitch.position)
            }
            defenceSwitch.onClicked: {
                playedDefence = handleSwitchSet(defenceSwitch.position)
            }

            reset.onClicked: {
                resetForm()
            }

            submit.onClicked: {
                addResult()
            }
            function resetForm()
            {
                highCount = 0
                lowCount = 0
                autoHighCount = 0
                autoLowCount = 0
                droveInAuto = false
                didSecondStageWheel = false
                didThirdStageWheel = false
                robotHang = false
                balancedHang = false
                teamNum.clear()
                matchNum.clear()
                highText.text = highCount
                lowText.text = lowCount
                autoHighText.text = autoHighCount
                autoLowText.text = autoLowCount
                climbedSwitch.checked = false
                balancedSwitch.checked = false
                stageThreeSwitch.checked = false
                stageTwoSwitch.checked = false
                autoLineSwitch.checked = false
                defenceSwitch.checked = false
                notesText.text = ""
            }

            function addResult()
            {
                // Validate Form
                if (teamNum.length>0 && matchNum.length>0 )
                {
                    var db = DbFunc.getDbHandle()
                    //Form is valid write to DB
                    var results = [
                            teamNum.text,
                                matchNum.text,
                                autoLowCount,
                                autoHighCount,
                                lowCount,
                                highCount,
                                droveInAuto,
                                didSecondStageWheel,
                                didThirdStageWheel,
                                robotHang,
                                balancedHang,
                                playedDefence,
                                notesText.text
                            ];
                    //console.log(results.toString())
                    db.transaction( function(tx){

                        DbFunc.addMatchResult(tx,results)
                    })
                    resetForm()
                }
                else {
                    messageDialog.open()
                }
            }
        }

        Page2Form {
            exportButton.onClicked: {
                if (exportFile.text.length > 0)
                {
                    exporter.exportDBtoLoc(exportFile.text)
                }
            }
        }
    }
    MessageDialog {
        id: messageDialog
        title: "Error! "
        text: "Team # or Match# not set!"
        onAccepted: {

            Qt.quit()
        }

    }

    function handleSwitchSet(posSwitch)
    {
        if (posSwitch === 1.0)
        {
            return true;

        } else {
            return false;
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
