 
#include "pw_monitor_toolplugin.h"
#include "monitor-tool.h"

void pw_monitor_toolPlugin::registerTypes(const char *uri)
{
    Q_ASSERT(QLatin1String(uri) == QLatin1String("com.github.nofunever.pw_monitor_tool"));

    qmlRegisterType<Process>(uri, 1, 0, "Process");



}
