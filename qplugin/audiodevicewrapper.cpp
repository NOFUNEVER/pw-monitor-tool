 
// audiodevicewrapper.cpp
#include "audiodevicewrapper.h"

AudioDeviceInfoWrapper::AudioDeviceInfoWrapper(QObject *parent) : QObject(parent)
{
}

QString AudioDeviceInfoWrapper::defaultInputDeviceName() const
{
    return QAudioDeviceInfo::defaultInputDevice().deviceName();
}

QString AudioDeviceInfoWrapper::defaultOutputDeviceName() const
{
    return QAudioDeviceInfo::defaultOutputDevice().deviceName();
}
