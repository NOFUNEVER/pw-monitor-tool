import org.kde.plasma.components 3.0
import "."

    

RadioButton {
    id: customFavoriteRadioButton

    property string customText: ""
    property string customInVar: ""
    property string customOutVar: ""
    property int pid: -1


    autoExclusive: false

    onClicked: {
        
        in_index = inputComboBox.currentIndex
        out_index = outputComboBox.currentIndex
        if (checked == false){                
            print(processPids)
            destroy2.startDetached("kill",[-9,pid]);
            removePid(pid)         
        }else{

        pid = pw_loopback.startDetached("pw-loopback", ["-l", "32", "-n", "loopback", "-m", "[FL FR]", customInVar, customOutVar]);
        processPids.push(pid)
    }
}
}
