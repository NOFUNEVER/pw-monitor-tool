import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.plasmoid 2.0
import QtQuick 2.15
import QtQuick.Controls 2.15
import com.github.nofunever.pw_monitor_tool 1.0
import QtQuick.LocalStorage 2.0

ColumnLayout {
    Layout.margins: 20
    PlasmaComponents3.Label {
        Layout.alignment: Qt.AlignHCenter

        text: i18n("Pipewire Loopback UI")
        height:30
    }

    width: 400
    height: 1980

property var favoritesDB: null

Component.onCompleted: {
    favoritesDB = LocalStorage.openDatabaseSync("MyApp", "1.0", "Storage", 1000000);
    
    favoritesDB.transaction(function(tx) {
        tx.executeSql("CREATE TABLE IF NOT EXISTS favorites(name TEXT, in_index INT, out_index INT)");
    });

     favoritesDB.readTransaction(function(tx) {
            var rs = tx.executeSql("SELECT * FROM favorites");
            for (var i = 0; i < rs.rows.length; i++) {
                var favorite = rs.rows.item(i);
                 var radioBtn = Qt.createQmlObject('import QtQuick.Controls 2.0; RadioButton { property var in_index: {} ; property var out_index: {}; property var in_var: {}; property var out_var: {}; property var in_var2: {}; property var out_var2: {}; onClicked: { in_index = inputComboBox.currentIndex; out_index = outputComboBox.currentIndex; in_var2 = "--capture="+list_inputs_internal.input_split_internal[in_index]; out_var2 = "--playback="+list_outputs_internal.output_split_internal[out_index]; pw_loopback_selected.start("pw-loopback", ["-l", "1", "-n", "loopback", "-m", "[FL FR]", in_var2, out_var2 ]); } }', radioGroup);
                radioBtn.text = favorite.name;
                radioBtn.in_index = favorite.in_index;
                radioBtn.out_index = favorite.out_index;
            }
        });
}
 

    Process {
        id: list_inputs

        property string input_output: ""
            property var input_split: ""

                onStarted: print("Started list_inputs")
                onFinished: print("Closed list_inputs")

                onErrorOccurred: console.log("Error Ocuured: ", error)

                onReadyReadStandardOutput: {
                    input_output = list_inputs.readAll()
                    input_split =input_output.split("\n")

                }
            }

            Process {
                id: list_outputs

                property string output_output: ""
                    property var output_split: ""

                        onStarted: print("Started list_output")
                        onFinished: print("Closed list_output")

                        onErrorOccurred: console.log("Error Ocuured: ", error)

                        onReadyReadStandardOutput: {
                            output_output = list_outputs.readAll()
                            output_split =output_output.split("\n")

                        }
                    }
                    Process {
                        id: list_inputs_internal

                        property string input_output_internal: ""
                            property var input_split_internal: ""

                                onStarted: print("Started list_inputs_internal")
                                onFinished: print("Closed list_inputs_internal")

                                onErrorOccurred: console.log("Error Ocuured: ", error)

                                onReadyReadStandardOutput: {
                                    input_output_internal = list_inputs_internal.readAll()
                                    input_split_internal =input_output_internal.split("\n")

                                }
                            }

                            Process {
                                id: list_outputs_internal

                                property string output_output_internal: ""
                                    property var output_split_internal: ""

                                        onStarted: print("Started list_outputs_internal")
                                        onFinished: print("Closed list_outputs_internal")

                                        onErrorOccurred: console.log("Error Ocuured: ", error)

                                        onReadyReadStandardOutput: {
                                            output_output_internal = list_outputs_internal.readAll()
                                            output_split_internal =output_output_internal.split("\n")

                                        }
                                    }

                                    Process {
                                        id: pw_loopback



                                        onStarted: print("Started pw_loopback")
                                        onFinished: print("Closed pw_loopback")

                                        onErrorOccurred: console.log("Error Ocuured: ", error)

                                        onReadyReadStandardOutput: {

                                        }
                                    }
                                    Process {
                                        id: pw_loopback_selected


                                        onStarted: print("Started pw_loopback_selected")
                                        onFinished: print("Closed pw_loopback_selected")

                                        onErrorOccurred: console.log("Error Ocuured: ", error)

                                        onReadyReadStandardOutput: {

                                        }
                                    }

                                    Item {
                                        Timer {
                                            interval: 500; running: true; repeat: false
                                            onTriggered: {

                                                list_inputs.start("bash", ["-c", "pw-cli ls Node | grep -B 3 'Audio/Source' | grep 'node.description' | cut -d \\\" -f2 "])
                                                list_outputs.start("bash", ["-c", "pw-cli ls Node | grep -B 3 'Audio/Sink' | grep 'node.description' | cut -d \\\" -f2 "])

                                                list_inputs_internal.start("bash", ["-c", "pw-cli ls Node | grep -B 3 'Audio/Source' | grep 'node.name' | cut -d \\\" -f2 "])
                                                list_outputs_internal.start("bash", ["-c", "pw-cli ls Node | grep -B 3 'Audio/Sink' | grep 'node.name' | cut -d \\\" -f2 "])


                                            }
                                        }
                                    }


                                    Process {
                                        id: destroy

                                        property string output: ""

                                            onStarted: print("Started destroy")
                                            onFinished: print("Closed destroy")

                                            onErrorOccurred: console.log("Error Ocuured: ", error)

                                            onReadyReadStandardOutput: {
                                                output = destroy.readAll()
                                                //     txt.text += outputc
                                            }
                                        }


                                        Column {
                                            id: radioGroup

                                            PlasmaComponents3.Label {
                                                text: i18n("Defaults")
                                                height:35
                                            }
                                            PlasmaComponents3.RadioButton {
                                                width: 200

                                                text: i18n("Off")
                                                checked: true
                                                autoExclusive: true
                                                onClicked: {



                                                    pw_loopback.kill()
                                                    pw_loopback_selected.kill()
                                                    destroy.start("bash", ["-c", "pw-cli destroy $(pw-cli ls Node | grep -B 4 'loopback' | head -n 1 | cut -f1 -d ', ' | cut -c 5- )"])
                                                    destroy.start("bash", ["-c", "pw-cli destroy $(pw-cli ls Node | grep -B 4 'loopback' | head -n 1 | cut -f1 -d ', ' | cut -c 5- )"])
                                                }

                                            }
                                            PlasmaComponents3.RadioButton {


                                                width: 200
                                                text: i18n("Loopback Defaults")
                                                autoExclusive: true
                                                onClicked: {

                                                    pw_loopback.start("pw-loopback")

                                                }
                                            }

                                            PlasmaComponents3.RadioButton {

                                                property var in_var: { }
                                                property var out_var: { }
                                                property var argz: { }
                                                property var in_index: { }
                                                property var out_index: { }
                                                width: 200
                                                text: i18n("Loopback Selected")
                                                autoExclusive: true
                                                onClicked: {
                                                    in_index = inputComboBox.currentIndex
                                                    out_index = outputComboBox.currentIndex
                                                    in_var = "--capture="+list_inputs_internal.input_split_internal[in_index]
                                                    out_var = "--playback="+list_outputs_internal.output_split_internal[out_index]
                                                    print(in_var)
                                                    print(out_var)
                                                    argz = ["-l", "1", "-n", "loopback", "-m", "[FL FR]", in_var, out_var ]
                                                    pw_loopback_selected.start("pw-loopback", argz)

                                                }
                                            }
                                            PlasmaComponents3.Label {
                                                text: i18n("Favorites")
                                                height:35
                                            }
                                        }


                                        PlasmaComponents3.Label {

                                            text: i18n("Inputs")
                                            height:20
                                        }
                                        PlasmaComponents3.ComboBox {
                                            Layout.alignment: Qt.AlignHCenter
                                            width: 300
                                            height:20
                                            id: inputComboBox

                                            onModelChanged: {

                                                Layout.minimumWidth = 100
                                            }
                                            model: list_inputs.input_split
                                            delegate: ItemDelegate {
                                                text: modelData
                                                width: 400
                                            }
                                        }
                                        PlasmaComponents3.Label {
                                            Layout.alignment: Qt.AlignLeft
                                            text: i18n("Outputs")
                                            height:20
                                        }
                                        PlasmaComponents3.ComboBox {

                                            onModelChanged: {

                                                // Layout.minimumWidth = 40//_maxWidth + implicitIndicatorWidth + leftPadding + rightPadding
                                            }

                                            Layout.alignment: Qt.AlignHCenter
                                            width: 200
                                            height:20
                                            id: outputComboBox
                                            model: list_outputs.output_split
                                            delegate: ItemDelegate {
                                                text: modelData
                                                width: 300
                                            }
                                        }





                                        // button to add new radio button
                                        PlasmaComponents3.Button {
                                            Layout.alignment: Qt.AlignRight
                                            property var in_var: { }
                                            property var out_var: { }
                                            property var in_var2: { }
                                            property var out_var2: { }
                                            property var in_index: { }
                                            property var out_index: { }
                                            id: newy
                                            text: qsTr("Add Favorite")
                                            onClicked: {
                                                in_index = inputComboBox.currentIndex
                                                out_index = outputComboBox.currentIndex
                                                in_var = list_inputs.input_split[in_index]
                                                out_var = list_outputs.output_split[out_index]
                                                in_var2 = "--capture="+list_inputs_internal.input_split_internal[in_index]
                                                out_var2 = "--playback="+list_outputs_internal.output_split_internal[out_index]
                                                var radioBtn = Qt.createQmlObject('import QtQuick.Controls 2.0; RadioButton { property var in_index: {} ; property var out_index: {}; property var in_var: {}; property var out_var: {}; property var in_var2: {}; property var out_var2: {}; onClicked: { in_index = inputComboBox.currentIndex; out_index = outputComboBox.currentIndex; in_var2 = "--capture="+list_inputs_internal.input_split_internal[in_index]; out_var2 = "--playback="+list_outputs_internal.output_split_internal[out_index]; pw_loopback_selected.start("pw-loopback", ["-l", "1", "-n", "loopback", "-m", "[FL FR]", in_var2, out_var2 ]); } }', radioGroup);
                                                radioBtn.text = in_var + " + " + out_var;
                                                radioBtn.checked = true;

    favoritesDB.transaction(function(tx) {
            tx.executeSql("INSERT INTO favorites VALUES(?, ?, ?)", [radioBtn.text, in_index, out_index]);
        });

                                            }
                                        }

PlasmaComponents3.Button {
    text: i18n("Clear Favorites")
    onClicked: {
        // Clear the favorites from the database
        favoritesDB.transaction(function(tx) {
            tx.executeSql("DELETE FROM favorites");
        });

        // Remove the radio buttons from the UI
        for (var i = 0; i < radioGroup.children.length; i++) {
            var child = radioGroup.children[i];
            if (child instanceof RadioButton) {
                child.destroy();
            }
        }
    }
}

                                    }











