import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.plasmoid 2.0
import QtQuick 2.15
import QtQuick.Controls 2.15
import com.github.nofunever.pw_monitor_tool 1.0


ColumnLayout {


    width: 400
    height: 980


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
           // input_txt.text = input_split[1]
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
          //  output_txt.text = output_split[1]
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
           // input_txt.text = input_split[1]
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
          //  output_txt.text = output_split[1]
        }
    }

  Process {
        id: pw_loopback

    //    property string input_output_internal: ""
    //    property var input_split_internal: ""

        onStarted: print("Started pw_loopback")
        onFinished: print("Closed pw_loopback")

        onErrorOccurred: console.log("Error Ocuured: ", error)

        onReadyReadStandardOutput: {
         //   input_output_internal = list_inputs_internal.readAll()
     //       input_split_internal =input_output_internal.split("\n")
           // input_txt.text = input_split[1]
        }
    }
     Process {
        id: pw_loopback_selected

    //    property string input_output_internal: ""
    //    property var input_split_internal: ""

        onStarted: print("Started pw_loopback_selected")
        onFinished: print("Closed pw_loopback_selected")

        onErrorOccurred: console.log("Error Ocuured: ", error)

        onReadyReadStandardOutput: {
         //   input_output_internal = list_inputs_internal.readAll()
     //       input_split_internal =input_output_internal.split("\n")
           // input_txt.text = input_split[1]
        }
    }

    Item {
        Timer {
            interval: 500; running: true; repeat: false
            onTriggered:{

                list_inputs.start("bash",["-c", "pw-cli ls Node | grep -B 3 'Audio/Source' | grep 'node.description' | cut -d \\\" -f2 "])
                list_outputs.start("bash",["-c", "pw-cli ls Node | grep -B 3 'Audio/Sink' | grep 'node.description' | cut -d \\\" -f2 "])

                list_inputs_internal.start("bash",["-c", "pw-cli ls Node | grep -B 3 'Audio/Source' | grep 'node.name' | cut -d \\\" -f2 "])
                list_outputs_internal.start("bash",["-c", "pw-cli ls Node | grep -B 3 'Audio/Sink' | grep 'node.name' | cut -d \\\" -f2 "])


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


  ButtonGroup {
        id: group
    }

    PlasmaComponents3.RadioButton {
        width: 200

        text: i18n("Off")
        checked: true
        autoExclusive: true
              onClicked: {



              pw_loopback.kill()
              pw_loopback_selected.kill()
              destroy.start("bash", ["-c", "pw-cli destroy $(pw-cli ls Node | grep -B 4 'loopback' | head -n 1 | cut -f1 -d ',' | cut -c 5- )"])
              destroy.start("bash", ["-c", "pw-cli destroy $(pw-cli ls Node | grep -B 4 'loopback' | head -n 1 | cut -f1 -d ',' | cut -c 5- )"])
             // destroy.kill()
           //   list_inputs_internal.kill()
           //   list_inputs.kill()
          //    list_outputs_internal.kill()
         //     list_outputs.kill()

        }

    }
    PlasmaComponents3.RadioButton {


        width: 200
        text: i18n("Loopback Defaults")
        autoExclusive: true
        onClicked: {
        //pw_loopback.start("/home/jkl/Documents/pipewire-scripts/monitor_line-in.sh")
        pw_loopback.start("pw-loopback")

        }
    }

        PlasmaComponents3.RadioButton {
        property var in_var:{}
        property var out_var:{}
        property var argz:{}
        property var in_index:{}
        property var out_index:{}

      //  property var argz: ["-l", "1", "-n", in_var[2] + out_var[3], "-m", "'[FL FR ]'", "--capture="+in_var[2], "--playback="+out_var[3], "&" ]
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
          argz = ["-l", "1", "-n", "loopback", "-m", "[FL FR]",in_var , out_var ]
       // argz = ["-l", "1", "-n", "sb-line-in", "-m", "[FL FR]", "--capture=alsa_input.pci-0000_0a_00.0.pro-input-0", "--playback=alsa_output.pci-0000_0a_00.0.pro-output-0"]
        //argz = ["-l", "1", "-n", "bingo", "-m", "'[FL FR ]'", "--capture='" +in_var[2]+"'", "--playback='"+out_var[3]+"'", "&" ]
        //pw_loopback.start("/home/jkl/Documents/pipewire-scripts/monitor_line-in.sh")
        pw_loopback_selected.start("pw-loopback", argz)

        }
    }





PlasmaComponents3.Label {
    text: i18n("Inputs")
    height:30
}
    PlasmaComponents3.ComboBox {
    width: 300
    height:30
  //  textRole: "text"
  //  valueRole: "value"
    id: inputComboBox
    model: list_inputs.input_split
    delegate: ItemDelegate {
        text: modelData
        width: 300
        }
    }
    PlasmaComponents3.Label {
    text: i18n("Outputs")
    height:30
}
PlasmaComponents3.ComboBox {
    width: 300
    height:30
 //   textRole: "text"
//    valueRole: "value"
    id: outputComboBox
    model: list_outputs.output_split
    delegate: ItemDelegate {
        text: modelData
        width: 300
    }
    }

PlasmaComponents3.Button {
    icon.name: "view-refresh"
    text: i18n("Enable/Add")


        onClicked: {
            var button = Qt.createQmlObject('import QtQuick.Controls 2.0; RadioButton { text: "New Favorite"}', group)
            print("clicked")
            group.addButton(button)
        }
}









}



