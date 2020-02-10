import QtQuick 2.12
import QtQuick.Controls 2.5
import Qt.labs.settings 1.0
import QtQuick.LocalStorage 2.12
import QtQuick.Dialogs 1.3
import "dbFunctions.js" as DbFunc
ApplicationWindow {
    id: mainWindow
    visible: true
    width: 1024
    height: 768
    title: qsTr("Scouting App")

    Component.onCompleted: {
        var db = DbFunc.getDbHandle()
        db.transaction( function(tx){
                        DbFunc.init(tx,compString,allianceStationList[allianceIndex])
                    }
                    )
        if (settings.isFirstRun == true)
        {


            settings.isFirstRun = false
        }

    }
    property var allianceStationList : ["red_1","red_2","red_3","blue_1","blue_2","blue_3"]
    property string compString: "default"
    property string allianceStationString: "Red 1"
    property int allianceIndex: 0
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

    property alias scoutingPage: scoutingPage

    Settings {
        id: settings
        property bool isFirstRun: true
        property alias allianceIndex: mainWindow.allianceIndex
        property alias compString: mainWindow.compString
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
            id: scoutingPage
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
                                matchNum.text,
                                teamNum.text,
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
                    try {
                        db.transaction( function(tx){

                            DbFunc.addMatchResult(tx,results)
                        })
                        resetForm()
                    }
                    catch (err){
                        messageDialog.text = "Error Inserting results into table:" + err
                        messageDialog.open()
                    }


                }
                else {
                    messageDialog.text = "Team # or Match# not set!"
                    messageDialog.open()
                }
            }
        }

        Page2Form {
            exportButton.onClicked: {
                if (exportFile.text.length > 0)
                {
                    exporter.exportDBtoLoc(exportFile.text+".sqlite")
                }
            }
            allianceStation.onCurrentIndexChanged: {
                allianceIndex = allianceStation.currentIndex
                allianceStationString = allianceStation.currentText
                scoutingPage.headerText.text = allianceStationString + " Scouting"
            }
            compName.onTextChanged: {
                compString = compName.text
            }
            updateSettings.onClicked: {
                var db = DbFunc.getDbHandle()
                db.transaction( function(tx){
                                DbFunc.init(tx,compString,allianceStationList[allianceIndex])
                            }
                            )
                allianceIndex = allianceStation.currentIndex
                allianceStationString = allianceStation.currentText
                scoutingPage.headerText.text = allianceStationString + " Scouting"
            }
            uploadButton.onPressed:
            {
                if (serverUrl.length <= 0)
                {
                    messageDialog.text = "Please set a server URL"
                    messageDialog.open()
                }
                else {
                    var db = DbFunc.getDbHandle()
                    db.transaction(function (tx){
                        var res = DbFunc.selectAllResults(tx)
                        scoutingAPI.setServerUrl(serverUrl.text)
                        var progressInc = 1.0/res.rows.length;
                        var progress = 0.0;
                        for (var i = 0; i<res.rows.length; i++)
                        {
                            var resMap = res.rows.item(i);
                            resMap["compLoc"] = compName
                            resMap["allianceStation"] = allianceStationString
                            scoutingAPI.postMatch(resMap);
                            uploadProgress = progress += progressInc;
                        }
                    }
                    )
                }
            }

            Component.onCompleted: {
                compName.text = compString
                allianceStation.currentIndex = allianceIndex
                allianceStationString = allianceStation.currentText
                scoutingPage.headerText.text = allianceStationString + " Scouting"
            }
        }
    }
    MessageDialog {
        id: messageDialog
        title: "Error! "
        text: "Team # or Match# not set!"
        onAccepted: {

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
            text: qsTr("Match Scouting")
        }
        TabButton {
            text: qsTr("Configuration Tab")
        }
    }
}
