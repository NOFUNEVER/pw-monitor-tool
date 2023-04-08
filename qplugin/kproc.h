 
#pragma once
#include <KProcess>
//#include <QProcess>
#include <QVariant>


class Kprocess : public KProcess
{
    Q_OBJECT
public:
    explicit Kprocess( QObject* parent = Q_NULLPTR ) : KProcess( parent ) { }

    // If want to use Start with arguments
    Q_INVOKABLE void start( const QString& program, const QVariantList& arguments )
    {
        QStringList args;


        // convert QVariantList from QML to QStringList for QProcess
        for ( const auto& temp : arguments ) {
            args << temp.toString();
        }

        KProcess::setOutputChannelMode( KProcess::MergedChannels );
        KProcess::setProgram( program, args);
        KProcess::start();
    }
        Q_INVOKABLE qint64 startDetached( const QString& program, const QVariantList& arguments )
    {
        QStringList args;


        // convert QVariantList from QML to QStringList for QProcess
        for ( const auto& temp : arguments ) {
            args << temp.toString();
        }

        QProcess process; // Create an instance of KProcess
   // process->setOutputChannelMode(KProcess::MergedChannels);
    process.setProgram(program);
    process.setArguments(args);

    // Check if the process started successfully
 qint64 pid;
    bool success = process.startDetached(&pid); // Pass a pointer to store the PID

    if (success) {
        return pid;
    } else {
        return 0; // Return 0 if the process failed to start
    }
    }

    

    // If wan to start without arguments for Qt > 5.14
    Q_INVOKABLE void start( const QString& program )
    {

        KProcess::setOutputChannelMode( KProcess::MergedChannels );
        KProcess::setProgram( program );
        KProcess::start();
        KProcess::open( KProcess::ReadWrite );
    }

       Q_INVOKABLE void startDetached( const QString& program )
    {

        KProcess::setOutputChannelMode( KProcess::MergedChannels );
        KProcess::setProgram( program );
        KProcess::startDetached();
    
    }
    Q_INVOKABLE bool waitForReadyRead(int msecs)
    {
        return KProcess::waitForReadyRead(msecs);
        


    }

     Q_INVOKABLE bool waitForFinished(int msecs)
    {
        return KProcess::waitForFinished(msecs)    ;    


    }

    Q_INVOKABLE QByteArray readAll() { return KProcess::readAll(); }
    Q_INVOKABLE QByteArray readLine() { return KProcess::readLine(); }

    

    // if you want to write to an active process, not fully tested!
    Q_INVOKABLE qint64 write( const QString& data )
    {
        return KProcess::write( qPrintable( data ) );
    }

private:
    Q_DISABLE_COPY( Kprocess )
};

