
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
import QtMultimedia 5.12
import "."

ColumnLayout{
    
    
    width: 600
    height: 600

   

    property var favoritesDB: null
    property var temp_list: {}
    property var input_list: {}
    property var output_list: {}
    property var internal_input_list: {}
    property var internal_output_list: {}
      property var in_index: {}
                property var out_index: {}
    property string capture_props:"--capture-props='[media.class=Audio/Sink]'"
    property string playback_props:"--playback-props='[media.class=Audio/Source]'"
    property alias defaultInputDeviceName: audioDeviceInfo.defaultInputDeviceName
    property alias defaultOutputDeviceName: audioDeviceInfo.defaultOutputDeviceName
    property var processPids:[]
    property string custom_name:""   
    AudioDeviceInfoWrapper {
        id: audioDeviceInfo
    }   
    
    Kprocess {
        id: list_devices

        property string pw_cli_response: ""
        property var response_list: ""

        onStarted: print("Started list_devices")
        onFinished: print("Closed list_devices")
        onErrorOccurred: console.log("List devices Error Ocuured: ", error)
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
        Kprocess {
        id: destroy2

        property string output: ""

        onStarted: print("Started destroy")
        onFinished: print("Closed destroy")
        onErrorOccurred: console.log("destroy Error Ocuured: ", error)
        onReadyReadStandardOutput: {
            output = destroy.readAll()
        }
    }

    function getDefaultInput() {
        var inputIndex = internal_input_list.indexOf(defaultInputDeviceName);
   

        if (inputIndex === -1 ) {
            return qsTr("Default In/Out: Not set");
        }

        return qsTr("  %1 ").arg(input_list[inputIndex]);
    }

    function getDefaultOutput() {
        var outputIndex = internal_output_list.indexOf(defaultOutputDeviceName);
   

        if (outputIndex === -1 ) {
            return qsTr("Default In/Out: Not set");
        }

        return qsTr("  %1 ").arg(output_list[outputIndex]);
    }


    function getLoopbackText() {
        var inputIndex = internal_input_list.indexOf(defaultInputDeviceName);
        var outputIndex = internal_output_list.indexOf(defaultOutputDeviceName);

        if (inputIndex === -1 || outputIndex === -1) {
            return qsTr("Default In/Out: Not set");
        }

        return qsTr("");
    }
    function findMaxWidth(listModel) {
        var maxLength = 0;
        var tempText = Qt.createQmlObject('import QtQuick 2.0; Text { }', root);

        for (var i = 0; i < listModel.count; i++) {
            var currentString = listModel.get(i).value;
            tempText.text = currentString;
            var currentWidth = tempText.width;

            if (currentWidth > maxLength) {
                maxLength = currentWidth;
            }
        }

        tempText.destroy();
        return maxLength;
    }
    function removePid(pidToRemove) {
        for (var i = 0; i < processPids.length; ++i) {
        if (processPids[i] === pidToRemove) {
            processPids.splice(i, 1);
            break;
        }
    }
    }

    Component.onCompleted: {

        destroy.start("bash", ["-c", "pw-cli destroy $(pw-cli ls Node | grep -B 4 'loopback' | head -n 1 | cut -f1 -d ', ' | cut -c 5- )"])
       
        list_devices.start("bash", ["-c", "pw-cli ls Node | grep -B 3 'Audio/Source' | grep 'node.description' | cut -d \\\" -f2 "])
        list_devices.waitForReadyRead(-1)
        input_list = temp_list
      //  inputComboBox.width = findMaxWidth(input_list)
        list_devices.waitForFinished(-1)
        list_devices.destroy()

        list_devices.start("bash", ["-c", "pw-cli ls Node | grep -B 3 'Audio/Sink' | grep 'node.description' | cut -d \\\" -f2 "])
        list_devices.waitForReadyRead(-1)
        output_list = temp_list
       
        list_devices.waitForFinished(-1)
        list_devices.destroy()

        list_devices.start("bash", ["-c", "pw-cli ls Node | grep -B 3 'Audio/Source' | grep 'node.name' | cut -d \\\" -f2 "])
        list_devices.waitForReadyRead(-1)
        internal_input_list = temp_list
        
        list_devices.waitForFinished(-1)
        list_devices.destroy()

        list_devices.start("bash", ["-c", "pw-cli ls Node | grep -B 3 'Audio/Sink' | grep 'node.name' | cut -d \\\" -f2 "])
        list_devices.waitForReadyRead(-1)
        internal_output_list = temp_list
        list_devices.waitForFinished(-1)
        list_devices.destroy()

        favoritesDB = LocalStorage.openDatabaseSync("MyApp", "1.0", "Storage", 1000000);
        favoritesDB.transaction(function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS favorites(name TEXT, in_var TEXT, out_var TEXT)");
        });

        favoritesDB.readTransaction(function(tx) {
            var rs = tx.executeSql("SELECT * FROM favorites");
            for (var i = 0; i < rs.rows.length; i++) {
                var favorite = rs.rows.item(i);
                var component = Qt.createComponent("CustomFavoriteRadioButton.qml");
                //if (component.status === Qt.Ready) {
                var radioBtn = component.createObject(radioGroup);
                radioBtn.text = favorite.name;
                radioBtn.customInVar = favorite.in_var;
                radioBtn.customOutVar = favorite.out_var;

                
            }
        });


    }



ColumnLayout{
    
    id: root
    
    PlasmaComponents3.Label {
        Layout.alignment: Qt.AlignHCenter
        text: i18n("Pipewire Loopback UI")
        height: 30
    }

    RowLayout{
        id:prim_row1
        Layout.preferredHeight:root.heigh*.66
        Layout.leftMargin: 10
        Layout.rightMargin: 10
        ColumnLayout{
            id:upperLeftQuad
            Layout.alignment: Qt.AlignTop
            
            PlasmaComponents3.Label {
            Layout.alignment: Qt.AlignLeft
            Layout.rightMargin:60
                        text: i18n("Independent Inputs")
            height:20         
            }
            RowLayout{
                id:upper_left_row1
                PlasmaComponents3.ComboBox {
                    height:30
                    implicitWidth:260
                    id: inputComboBox       
                    model: input_list
                    delegate: ItemDelegate {
                        text: modelData
                        width:260
                    }
                }

                PlasmaComponents3.RadioButton {
                    property var in_var: {}
                    property var out_var: {}
                    property var argz: {}
                    property var in_index: {}
                    property var out_index: {}
                    property string big_string2: " "
                    property var pid:-1
                    width: 60
                    id:inindefout
                    text: i18n(">")
                    autoExclusive: false
                    onClicked: {
                       
                        if (checked == false){
                            in_var = "--capture=" + internal_input_list[in_index]
                         // print(pid)
                          print(processPids)
                            destroy.startDetached("kill",[-9,pid]);
                            //processPids[0].pop()

                            removePid(pid) 


                            for(var i = 0; i < runningRadioGroup.children.length; ++i){
                                var child = runningRadioGroup.children[i];
                                if( child instanceof PlasmaComponents3.RadioButton && child.text === in_var){
                                    child.destroy();
                                    break;
                                }
                            }
                        }else{

                        in_index = inputComboBox.currentIndex
                        out_index = outputComboBox.currentIndex
                        in_var = "--capture=" + internal_input_list[in_index]
                        out_var = "--playback=" + internal_output_list[out_index]
                        argz = ["-l", "32", "-n", "loopback", "-m", "[FL FR]", capture_props, in_var]
                        pid = pw_loopback.startDetached("pw-loopback", argz)
                        var argzString = argz.join(' ');
                       // print("farts")
                      //  print(pid)
                        processPids.push(pid)
                         big_string2 = 'import org.kde.plasma.components 3.0; RadioButton { autoExclusive: false; checked: true; property var in_index: {}; property var out_index: {}; property var in_var: {}; property var out_var: {}; onClicked: {  } }'
                        var radioBtn = Qt.createQmlObject(big_string2, runningRadioGroup);
                        radioBtn.text = in_var
                    
                        }
                    }
                }
            }   


            PlasmaComponents3.RadioButton {
                id:inininout
                property var in_var: {}
                property var out_var: {}
                property var argz: {}
                property var in_index: {}
                property var out_index: {}
                property string big_string2: " "
                property var pid:-1
                width: 200
                Layout.topMargin:20
                Layout.rightMargin:50
                Layout.alignment: Qt.AlignRight
                text: i18n("")
                autoExclusive: false
                onClicked: {


                     if (checked == false){
                              // print(pid)
                          print(processPids)
                            destroy.startDetached("kill",[-9,pid]);
                            //processPids[0].pop()

                            removePid(pid)   
                       //     destroy.start("bash", ["-c", "pw-cli destroy $(pw-cli ls Node | grep -B 4 'loopback' | head -n 1 | cut -f1 -d ',' | cut -c 5- )"])
                            for(var i = 0; i < runningRadioGroup.children.length; ++i){
                                var child = runningRadioGroup.children[i];
                                if( child instanceof PlasmaComponents3.RadioButton && child.text === in_var + " + " + out_var){
                                    child.destroy();
                                    break;
                                }
                            }


                    }else{
                        in_index = inputComboBox.currentIndex
                        out_index = outputComboBox.currentIndex
                        in_var = "--capture=" + internal_input_list[in_index]
                        out_var = "--playback=" + internal_output_list[out_index]
                        argz = ["-l", "32", "-n", "loopback", "-m", "[FL FR]", in_var, out_var]
                        pid = pw_loopback.startDetached("pw-loopback", argz)
                        processPids.push(pid)
                        big_string2 = 'import org.kde.plasma.components 3.0; RadioButton { autoExclusive: false; checked: true; property var in_index: {}; property var out_index: {}; property var in_var: {}; property var out_var: {}; onClicked: {  } }'
                        var radioBtn = Qt.createQmlObject(big_string2, runningRadioGroup);
                        radioBtn.text = in_var + " + " + out_var;
                    }
                }
            }

             
            PlasmaComponents3.Label {
                  Layout.alignment: Qt.AlignLeft
            Layout.rightMargin:60
                text: i18n("Independent Outputs")
                height:20
            }
            RowLayout{
                id: upper_left_row2
                
                PlasmaComponents3.ComboBox {
                    implicitWidth: 260
                    height: 30
                    id: outputComboBox
                    model: output_list
                    delegate: ItemDelegate {
                        text: modelData
                        width: 300
                    }
                }
                PlasmaComponents3.RadioButton {
                    id:defininout
                    property var in_var: {}
                    property var out_var: {}
                    property var argz: {}
                    property var in_index: {}
                    property var out_index: {}
                    property string  big_string2: ""
                    property var pid: -1
                    width:60
                    text: i18n("< ")
                    autoExclusive: false
                    onClicked: {




                        in_index = inputComboBox.currentIndex
                        out_index = outputComboBox.currentIndex
                        in_var = "--capture=" + internal_input_list[in_index]
                        out_var = "--playback=" + internal_output_list[out_index]
                        argz = ["-l", "32", "-n", "loopback", "-m", "[FL FR]", playback_props, out_var]



                         if (checked == false){
                            
                            print(processPids)
                            destroy.startDetached("kill",[-9,pid]);
                            //processPids[0].pop()

                            removePid(pid) 

                            for(var i = 0; i < runningRadioGroup.children.length; ++i){
                                var child = runningRadioGroup.children[i];
                                if( child instanceof PlasmaComponents3.RadioButton && child.text ===  out_var){
                                    child.destroy();
                                    break;
                                }


                            }
                            


                        }else{
                        pid =pw_loopback.startDetached("pw-loopback", argz)
                        processPids.push(pid)

                         big_string2 = 'import org.kde.plasma.components 3.0; RadioButton { autoExclusive: false; checked: true; property var in_index: {}; property var out_index: {}; property var in_var: {}; property var out_var: {}; onClicked: {  } }'
                        var radioBtn = Qt.createQmlObject(big_string2, runningRadioGroup);
                        radioBtn.text = out_var
                    }
                    }
                }

            }
        }
        ColumnLayout {
            id: upperRightQuad
            Layout.alignment: Qt.AlignTop
            PlasmaComponents3.Label {
                Layout.alignment: Qt.AlignLeft
                text: i18n("Default Output")
                
                
            }

            RowLayout{
                id:upper_right_row1
              
             PlasmaComponents3.ComboBox {
                model:[ getDefaultOutput()]
                Layout.preferredHeight:30
                enabled: false
                implicitWidth:250
                
            }
            }
             PlasmaComponents3.RadioButton {
                id:defindefout
                property var pid: -1
             width: 400
                Layout.topMargin:20
                Layout.alignment: Qt.AlignRight
                property string big_string2: ""
             text: i18n(getLoopbackText() ) 
            autoExclusive: false
            onClicked: {
                     
                     if (checked == false){
                            
                           print(processPids)
                            destroy.startDetached("kill",[-9,pid]);
                            //processPids[0].pop()

                            removePid(pid) 
                            for(var i = 0; i < runningRadioGroup.children.length; ++i){
                                var child = runningRadioGroup.children[i];
                                if( child instanceof PlasmaComponents3.RadioButton && child.text ===  "Defaults: pw-loopback"){
                                    child.destroy();
                                    break;
                                }


                            }

                     }else{
                            pid = pw_loopback.startDetached("pw-loopback",["-l","32"])
                            processPids.push(pid)
                            big_string2 = 'import org.kde.plasma.components 3.0; RadioButton { autoExclusive: false; checked: true; property var in_index: {}; property var out_index: {}; property var in_var: {}; property var out_var: {}; onClicked: {  } }'
                            var radioBtn = Qt.createQmlObject(big_string2, runningRadioGroup);
                            radioBtn.text = "Defaults: pw-loopback"
                     }
            }
        }
            PlasmaComponents3.Label {
                Layout.alignment: Qt.AlignLeft
                text: i18n("Default Input")
                 
                
            }
            RowLayout{
                id:upper_right_row2
                
             PlasmaComponents3.ComboBox {
                model: [ getDefaultInput()]
                implicitWidth:250
                enabled:false
                   Layout.preferredHeight:30
                
            }
            }

         
        }
    }
    RowLayout{

      PlasmaComponents3.Button {
                Layout.alignment: Qt.AlignRight
                property string in_var: ""
                property string out_var: ""
                property var in_var2: {}
                property var out_var2: {}
              
                property string big_string: ""
                id: newy
                Layout.leftMargin:10
                text: qsTr("Add Favorite")
                    onClicked: {
                    in_index = inputComboBox.currentIndex
                    out_index = outputComboBox.currentIndex
                    in_var2 = input_list[in_index]
                    out_var2 = output_list[out_index]
                    in_var = "--capture=" + internal_input_list[in_index]
                    out_var = "--playback=" + internal_output_list[out_index]
                    big_string = 'import org.kde.plasma.components 3.0; RadioButton { autoExclusive: false ; property var in_index: {}; property var out_index: {}; property var in_var: {}; property var out_var: {}; property var pid: -1;  onClicked: { in_index = inputComboBox.currentIndex; out_index = outputComboBox.currentIndex; pid = pw_loopback.startDetached("pw-loopback", ["-l", "32", "-n", "loopback", "-m", "[FL FR]", "' + in_var + '", "' + out_var + '" ]); } }'
                    popup.open()
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
                        if (child instanceof PlasmaComponents3.RadioButton) {
                            child.destroy();
                        }
                    }
                }
            }

            PlasmaComponents3.RadioButton {
                width: 20
                Layout.alignment: Qt.AlignRight
                text: i18n("Off")
                checked: false
                autoExclusive: false
                onClicked: {
                  // destroy.start("bash", ["-c", "pw-cli destroy $(pw-cli ls Node | grep -B 4 'loopback' | head -n 1 | cut -f1 -d ',' | cut -c 5- )"])   
                    inindefout.checked=false
                    inininout.checked=false
                    defindefout.checked=false
                    defininout.checked=false
                    
                    for (var i = 0; i <processPids.length; i++){
                    destroy.startDetached("kill",[-9,processPids[i]]);
                            //processPids[0].pop()
                    destroy.waitForFinished(-1)
                        //    removePid(processPids[i]) 

                    }
                      for (var i = 0; i <processPids.length; i++){
          
                          removePid(processPids[i]) 

                    }
                     for (var i = 0; i < runningRadioGroup.children.length; i++) {
                        var child = runningRadioGroup.children[i];
                        if (child instanceof PlasmaComponents3.RadioButton) {
                            child.destroy();
                        }
                    }
                }
            }
                    PlasmaComponents3.RadioButton {
                width: 20
                Layout.alignment: Qt.AlignRight
                text: i18n("Clear Stray(Debug)")
                checked: false
                autoExclusive: false
                onClicked: {
                    destroy.start("bash", ["-c", "pw-cli destroy $(pw-cli ls Node | grep -B 4 'loopback' | head -n 1 | cut -f1 -d ',' | cut -c 5- )"])   
                    inindefout.checked=false
                    inininout.checked=false
                    defindefout.checked=false
                    defininout.checked=false
                    
                    for (var i = 0; i <processPids.length; i++){
                    destroy.startDetached("kill",[-9,processPids[i]]);
                            //processPids[0].pop()
                    destroy.waitForFinished()
                        //    removePid(processPids[i]) 

                    }
                     for (var i = 0; i < runningRadioGroup.children.length; i++) {
                        var child = runningRadioGroup.children[i];
                        if (child instanceof PlasmaComponents3.RadioButton) {
                            child.destroy();
                        }
                    }
                }
            }


    }
    RowLayout{
        id:prim_row2

        Layout.leftMargin: 10
        Layout.rightMargin: 10
        ColumnLayout{
                id:lowerLeftQuad
                implicitWidth:300
             
                Column{
                id: runningRadioGroup
                PlasmaComponents3.Label {
                    text: i18n("Running")
                    height: 35
                    width:300
                }
            }
                 Column{
                id: radioGroup
                PlasmaComponents3.Label {
                    text: i18n("Favorites")
                    height: 35
                }
            }






        }
        ColumnLayout {  
            id:lowerRightQuad


       
              
      





        }
    }

   PlasmaComponents3.Popup {
        id: popup

        ColumnLayout {
          //  anchors.fill: parent
            PlasmaComponents.Label {
                text: "Provide a Custom Name or Press Ok to use Defaults"
                font.pointSize: 12
                Layout.alignment: Qt.AlignCenter
            }
             PlasmaComponents.TextField {
                id: textField
                text: newy.in_var2 + " => " + newy.out_var2
                placeholderText: "Type something here"
                Layout.alignment: Qt.AlignCenter
                Layout.preferredWidth: parent.width - 40
            }
            PlasmaComponents.Button {
                text: "Save"
                onClicked:{

                 custom_name = textField.text//save the name   
           var component = Qt.createComponent("CustomFavoriteRadioButton.qml");
//if (component.status === Qt.Ready) {
    var radioBtn = component.createObject(radioGroup);
    radioBtn.text = custom_name;
    radioBtn.customInVar = newy.in_var;
    radioBtn.customOutVar = newy.out_var;
      favoritesDB.transaction(function(tx) {
                tx.executeSql("INSERT INTO favorites VALUES(?, ?, ?)", [radioBtn.text, newy.in_var, newy.out_var]);
            });
                popup.close()
//} else {
 //   console.error("Error creating CustomFavoriteRadioButton:", component.errorString());
 //   console.log("Component status:", component.status);
//}

          
                } 
                
            }
        }
    }
        

}
}
