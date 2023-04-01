
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.plasmoid 2.0
import QtQuick 2.15
import QtQuick.Controls 2.15
import com.github.nofunever.pw_monitor_tool 1.0
import QtQuick.LocalStorage 2.0
import org.kde.kcoreaddons 1.0 as Kcoreaddons

ColumnLayout {
    id: appz
    Layout.margins: 20
    PlasmaComponents3.Label {
        Layout.alignment: Qt.AlignHCenter

        text: i18n("Pipewire Loopback UI")
        height: 30
    }

    width: 500
    height: 1980

    property var favoritesDB: null
    property var temp_list: {}
    property var input_list: {}
    property var output_list: {}
    property var internal_input_list: {}
    property var internal_output_list: {}

    Kprocess {
        id: list_devices

        property string pw_cli_response: ""
        property var response_list: ""

        onStarted: print("Started list_devices")
        onFinished: print("Closed list_devices")
        onErrorOccurred: console.log("List Inputs Error Ocuured: ", error)
        onReadyReadStandardOutput: {
            pw_cli_response = list_devices.readAll()
            response_list = pw_cli_response.split("\n")
            temp_list = response_list
        }
    }

    Kprocess {
        id: pw_loopback
        onStarted: print("Started pw_loopback")
        onFinished: print("Closed pw_loopback")
        onErrorOccurred: console.log("pw-loopback Error Ocuured: ", error)
        onReadyReadStandardOutput: {
        }
    }

    Kprocess {
        id: destroy

        property string output: ""

        onStarted: print("Started destroy")
        onFinished: print("Closed destroy")
        onErrorOccurred: console.log("destroy Error Ocuured: ", error)
        onReadyReadStandardOutput: {
            output = destroy.readAll()
        }
    }

    Column {
        id: radioGroup

        PlasmaComponents3.Label {
            text: i18n("Defaults")
            height: 35
        }
        PlasmaComponents3.RadioButton {
            width: 200

            text: i18n("Off")
            checked: true
            autoExclusive: true
            onClicked: {
                destroy.start("bash", ["-c", "pw-cli destroy $(pw-cli ls Node | grep -B 4 'loopback' | head -n 1 | cut -f1 -d ',' | cut -c 5- )"])
                destroy.write("exit")
            }
        }
        PlasmaComponents3.RadioButton {
            width: 200
            text: i18n("Loopback Defaults")
            autoExclusive: true
            onClicked: {
                pw_loopback.startDetached("pw-loopback")
            }
        }

        PlasmaComponents3.RadioButton {
            property var in_var: {}
            property var out_var: {}
            property var argz: {}
            property var in_index: {}
            property var out_index: {}
            width: 200
            text: i18n("Loopback Selected")
            autoExclusive: true
            onClicked: {
                in_index = inputComboBox.currentIndex
                out_index = outputComboBox.currentIndex
                in_var = "--capture=" + internal_input_list[in_index]
                out_var = "--playback=" + internal_output_list[out_index]
                argz = ["-l", "1", "-n", "loopback", "-m", "[FL FR]", in_var, out_var]
                pw_loopback.startDetached("pw-loopback", argz)
            }
        }
        PlasmaComponents3.Label {
            text: i18n("Favorites")
            height: 35
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
            model: input_list
            delegate: ItemDelegate {
            text: modelData
            width: 400
            }
        }
        PlasmaComponents3.Label {
            Layout.alignment: Qt.AlignLeft
            text: i18n("Outputs")
            height: 20
        }
    PlasmaComponents3.ComboBox {
        Layout.alignment: Qt.AlignHCenter
        width: 200
        height: 20
        id: outputComboBox
        model: output_list
        delegate: ItemDelegate {
            text: modelData
            width: 300
        }
    }

    Component.onCompleted: {
        destroy.start("bash", ["-c", "pw-cli destroy $(pw-cli ls Node | grep -B 4 'loopback' | head -n 1 | cut -f1 -d ', ' | cut -c 5- )"])
        destroy.write("exit")

        list_devices.start("bash", ["-c", "pw-cli ls Node | grep -B 3 'Audio/Source' | grep 'node.description' | cut -d \\\" -f2 "])
        list_devices.waitForReadyRead(-1)
        input_list = temp_list
        list_devices.write("exit")
        list_devices.waitForFinished(-1)
        list_devices.destroy()

        list_devices.start("bash", ["-c", "pw-cli ls Node | grep -B 3 'Audio/Sink' | grep 'node.description' | cut -d \\\" -f2 "])
        list_devices.waitForReadyRead(-1)
        output_list = temp_list
        list_devices.write("exit")
        list_devices.waitForFinished(-1)
        list_devices.destroy()

        list_devices.start("bash", ["-c", "pw-cli ls Node | grep -B 3 'Audio/Source' | grep 'node.name' | cut -d \\\" -f2 "])
        list_devices.waitForReadyRead(-1)
        internal_input_list = temp_list
        list_devices.write("exit")
        list_devices.waitForFinished(-1)
        list_devices.destroy()

        list_devices.start("bash", ["-c", "pw-cli ls Node | grep -B 3 'Audio/Sink' | grep 'node.name' | cut -d \\\" -f2 "])
        list_devices.waitForReadyRead(-1)
        print(temp_list)
        internal_output_list = temp_list
        list_devices.write("exit")

        favoritesDB = LocalStorage.openDatabaseSync("MyApp", "1.0", "Storage", 1000000);

        favoritesDB.transaction(function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS favorites(name TEXT, in_var TEXT, out_var TEXT)");
        });

        favoritesDB.readTransaction(function(tx) {
            var rs = tx.executeSql("SELECT * FROM favorites");
            for (var i = 0; i < rs.rows.length; i++) {
                var favorite = rs.rows.item(i);
                var big_string = "";

                big_string = 'import QtQuick.Controls 2.0; RadioButton { property var in_var: {}; property var out_var: {}; onClicked: { pw_loopback.startDetached("pw-loopback", ["-l", "1", "-n", "loopback", "-m", "[FL FR]", "' + favorite.in_var + '", "' + favorite.out_var + '" ]); } }'

                var radioBtn = Qt.createQmlObject(big_string, radioGroup);
                radioBtn.text = favorite.name;
                radioBtn.in_var = favorite.in_var;
                radioBtn.out_var = favorite.out_var
            }
        });
    }


                // button to add new radio button
    PlasmaComponents3.Button {
        Layout.alignment: Qt.AlignRight
        property string in_var: ""
        property string out_var: ""
        property var in_var2: {}
        property var out_var2: {}
        property var in_index: {}
        property var out_index: {}
        property string big_string: ""
        id: newy
        text: qsTr("Add Favorite")
        onClicked: {
            in_index = inputComboBox.currentIndex
            out_index = outputComboBox.currentIndex
            in_var2 = input_list[in_index]
            out_var2 = output_list[out_index]
            in_var = "--capture=" + internal_input_list[in_index]
            out_var = "--playback=" + internal_output_list[out_index]
            print(in_var)
            print(out_var)
            big_string = 'import QtQuick.Controls 2.0; RadioButton { property var in_index: {}; property var out_index: {}; property var in_var: {}; property var out_var: {}; onClicked: { in_index = inputComboBox.currentIndex; out_index = outputComboBox.currentIndex; pw_loopback.startDetached("pw-loopback", ["-l", "1", "-n", "loopback", "-m", "[FL FR]", "' + in_var + '", "' + out_var + '" ]); } }'
            print(big_string)
            var radioBtn = Qt.createQmlObject(big_string, radioGroup);
            radioBtn.text = in_var2 + " + " + out_var2;
            radioBtn.checked = true;
            radioBtn.in_var = in_var;
            radioBtn.out_var = out_var;

            favoritesDB.transaction(function(tx) {
                tx.executeSql("INSERT INTO favorites VALUES(?, ?, ?)", [radioBtn.text, in_var, out_var]);
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









