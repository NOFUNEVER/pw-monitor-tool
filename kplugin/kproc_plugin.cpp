 
#include "kproc_plugin.h"
#include "kproc.h"

void kproc_Plugin::registerTypes(const char *uri)
{
    Q_ASSERT(QLatin1String(uri) == QLatin1String("com.github.nofunever.pw_monitor_tool"));

    qmlRegisterType<KProcess>(uri, 1, 0, "KProcess");



}
