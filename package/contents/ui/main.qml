import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.plasmoid 2.0
import QtQuick 2.15
import QtQuick.Controls 2.15
import com.github.nofunever.pw_monitor_tool 1.0

/*

ApplicationWindow {
    visible: true

    title: "Run a sh file in CMD!"


}

*/
ColumnLayout {


 width: 640
  height: 980


 Process {
        id: list_inputs

        property string input_output: ""
        property var input_split: ""

        onStarted: print("Started")
        onFinished: print("Closed")

        onErrorOccurred: console.log("Error Ocuured: ", error)

        onReadyReadStandardOutput: {
            input_output = list_inputs.readAll()
            input_split =input_output.split("\n")
           // input_txt.text = input_split[1]
var modelString = "\
    ListModel {\
        id: myModel\
        property var data: " + JSON.stringify(input_split) + "\
        ListElement { name: 'default'; }\
    }"

// Create the ListModel object from the string
var myListModel = Qt.createQmlObject(modelString, parent, "myListModel")

        }
    }

 Process {
        id: list_outputs

        property string output_output: ""
        property var output_split: ""

        onStarted: print("Started")
        onFinished: print("Closed")

        onErrorOccurred: console.log("Error Ocuured: ", error)

        onReadyReadStandardOutput: {
             output_output = list_outputs.readAll()
            output_split =output_output.split("\n")
          //  output_txt.text = output_split[1]
        }
    }


    Item {
    Timer {
        interval: 500; running: true; repeat: false
        onTriggered:{ list_inputs.start("/home/eos_jlamphere/pw-monitor-tool/plugin/list_inputs.sh")


            list_outputs.start("/home/eos_jlamphere/pw-monitor-tool/plugin/list_outputs.sh")



        }
    }


}





 /*
 Row {
        TextArea {
            id: output_txt
            text: ""
        }

        Button {
            text: "Run!"
            onClicked: list_outputs.start("/home/eos_jlamphere/pw-monitor-tool/plugin/list_outputs.sh")
        }
    }


*/















    Process {
        id: pw_cli


        property string output: ""


        onStarted: print("Started")
        onFinished: print("Closed")

        onErrorOccurred: console.log("Error Ocuured: ", error)

        onReadyReadStandardOutput: {
            output = pw_cli.readAll()
     //       txt.text += output
        }
    }
       Process {
        id: destroy

        property string output: ""

        onStarted: print("Started")
        onFinished: print("Closed")

        onErrorOccurred: console.log("Error Ocuured: ", error)

        onReadyReadStandardOutput: {
            output = destroy.readAll()
       //     txt.text += output
        }
    }



    PlasmaComponents3.RadioButton {
        property var argz: ["pw-cli destroy $(pw-cli ls Node | grep -B 4 'loopback' | sed '2,$d' | cut -f1 -d"," | cut -c 5-)"]
        text: i18n("Off")
        checked: true
        autoExclusive: true
              onClicked: {

              destroy.start("/home/eos_jlamphere/pw-monitor-tool/plugin/destroy.sh")
              pw_cli.kill()
              destroy.kill()

        }

    }
    PlasmaComponents3.RadioButton {



        text: i18n("Loopback Defaults")
        autoExclusive: true
        onClicked: {
        //pw_loopback.start("/home/jkl/Documents/pipewire-scripts/monitor_line-in.sh")
        pw_cli.start("pw-loopback")
//"destroy $(pw-cli ls Node | grep -B 4 'loopback' | sed '2,$d' | cut -f1 -d"," | cut -c 5-)"
        }
    }
RowLayout{
PlasmaComponents3.ComboBox {
    width:300
    //property ListModel inputs : {}
    //list_inputs.start("/home/eos_jlamphere/pw-monitor-tool/list_inputs.sh")
    textRole: "text"
    valueRole: "value"
    model: list_inputs.mylistModel
}


PlasmaComponents3.ComboBox {
   // property ListModel outputs : {}
   //  list_outputs.start("/home/jkl/monitor-tool/list_outputs.sh")
    textRole: "text"
    valueRole: "value"

    model: [
       { value: "a", text: i18n(list_outputs.output_split[0]) },
      { value: "b", text: i18n(list_outputs.output_split[1]) },

    ]
}
}
}



