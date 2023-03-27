 
#pragma once

#include <QQmlEngine>
#include <QQmlExtensionPlugin>

class pw_monitor_toolPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri) override;
};
