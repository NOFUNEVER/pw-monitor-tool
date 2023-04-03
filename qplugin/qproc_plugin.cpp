 
#include "qproc_plugin.h"
#include "qproc.h"
#include "audiodevicewrapper.h"

#include "kproc.h"




void qproc_Plugin::registerTypes(const char *uri)
{
    Q_ASSERT(QLatin1String(uri) == QLatin1String("com.github.nofunever.pw_monitor_tool"));

    qmlRegisterType<Process>(uri, 1, 0, "Process");
    qmlRegisterType<Kprocess>(uri, 1, 0, "Kprocess");
    qmlRegisterType<AudioDeviceInfoWrapper>(uri, 1, 0, "AudioDeviceInfoWrapper");


}
