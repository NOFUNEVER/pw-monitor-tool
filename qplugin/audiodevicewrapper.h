// audiodevicewrapper.h
#pragma once

#include <QObject>
#include <QAudioDeviceInfo>

class AudioDeviceInfoWrapper : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString defaultInputDeviceName READ defaultInputDeviceName CONSTANT)
    Q_PROPERTY(QString defaultOutputDeviceName READ defaultOutputDeviceName CONSTANT)

public:
    explicit AudioDeviceInfoWrapper(QObject *parent = nullptr);

    QString defaultInputDeviceName() const;
    QString defaultOutputDeviceName() const;
};

