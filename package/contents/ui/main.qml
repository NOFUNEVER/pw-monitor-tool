import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.plasmoid 2.0
import QtQuick 2.15
import QtQuick.Controls 2.15
import com.github.nofunever.pw_monitor_tool 1.0



ColumnLayout {


        Process {
        id: list_inputs


        property string output: ""


        onStarted: print("Gettings Inputs")
        onFinished: print("Inputs Collected")

        onErrorOccurred: console.log("Error Ocuured: ", error)

        onReadyReadStandardOutput: {
            output = list_inputs.readAll()
     //       txt.text += output
        }
    }



        Process {
        id: list_outputs


        property string output: ""


        onStarted: print("Gettings Inputs")
        onFinished: print("Inputs Collected")

        onErrorOccurred: console.log("Error Ocuured: ", error)

        onReadyReadStandardOutput: {
            output = list_outputs.readAll()
     //       txt.text += output
        }
    }














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

              destroy.start("/home/jkl/monitor-tool/plugin/destroy.sh")
 //destroy.start("/bin/bash", argz)
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
    //property ListModel inputs : {}
    //list_inputs.start("/home/jkl/monitor-tool/list_inputs.sh")
    textRole: "text"
    valueRole: "value"
    model: [
        { value: "a", text: i18n("A") },
        { value: "b", text: i18n("B") },
        { value: "c", text: i18n("C") },
    ]
}


PlasmaComponents3.ComboBox {
   // property ListModel outputs : {}
   //  list_outputs.start("/home/jkl/monitor-tool/list_outputs.sh")
    textRole: "text"
    valueRole: "value"
    model: [
        { value: "a", text: i18n("A") },
        { value: "b", text: i18n("B") },
        { value: "c", text: i18n("C") },
    ]
}
}
}


