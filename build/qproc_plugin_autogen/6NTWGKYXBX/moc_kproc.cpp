/****************************************************************************
** Meta object code from reading C++ file 'kproc.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.6)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../qplugin/kproc.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'kproc.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.6. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Kprocess_t {
    QByteArrayData data[13];
    char stringdata0[115];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Kprocess_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Kprocess_t qt_meta_stringdata_Kprocess = {
    {
QT_MOC_LITERAL(0, 0, 8), // "Kprocess"
QT_MOC_LITERAL(1, 9, 5), // "start"
QT_MOC_LITERAL(2, 15, 0), // ""
QT_MOC_LITERAL(3, 16, 7), // "program"
QT_MOC_LITERAL(4, 24, 9), // "arguments"
QT_MOC_LITERAL(5, 34, 13), // "startDetached"
QT_MOC_LITERAL(6, 48, 16), // "waitForReadyRead"
QT_MOC_LITERAL(7, 65, 5), // "msecs"
QT_MOC_LITERAL(8, 71, 15), // "waitForFinished"
QT_MOC_LITERAL(9, 87, 7), // "readAll"
QT_MOC_LITERAL(10, 95, 8), // "readLine"
QT_MOC_LITERAL(11, 104, 5), // "write"
QT_MOC_LITERAL(12, 110, 4) // "data"

    },
    "Kprocess\0start\0\0program\0arguments\0"
    "startDetached\0waitForReadyRead\0msecs\0"
    "waitForFinished\0readAll\0readLine\0write\0"
    "data"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Kprocess[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    2,   59,    2, 0x02 /* Public */,
       5,    2,   64,    2, 0x02 /* Public */,
       1,    1,   69,    2, 0x02 /* Public */,
       5,    1,   72,    2, 0x02 /* Public */,
       6,    1,   75,    2, 0x02 /* Public */,
       8,    1,   78,    2, 0x02 /* Public */,
       9,    0,   81,    2, 0x02 /* Public */,
      10,    0,   82,    2, 0x02 /* Public */,
      11,    1,   83,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::QVariantList,    3,    4,
    QMetaType::Void, QMetaType::QString, QMetaType::QVariantList,    3,    4,
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Bool, QMetaType::Int,    7,
    QMetaType::Bool, QMetaType::Int,    7,
    QMetaType::QByteArray,
    QMetaType::QByteArray,
    QMetaType::LongLong, QMetaType::QString,   12,

       0        // eod
};

void Kprocess::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Kprocess *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->start((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QVariantList(*)>(_a[2]))); break;
        case 1: _t->startDetached((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QVariantList(*)>(_a[2]))); break;
        case 2: _t->start((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 3: _t->startDetached((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 4: { bool _r = _t->waitForReadyRead((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 5: { bool _r = _t->waitForFinished((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 6: { QByteArray _r = _t->readAll();
            if (_a[0]) *reinterpret_cast< QByteArray*>(_a[0]) = std::move(_r); }  break;
        case 7: { QByteArray _r = _t->readLine();
            if (_a[0]) *reinterpret_cast< QByteArray*>(_a[0]) = std::move(_r); }  break;
        case 8: { qint64 _r = _t->write((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< qint64*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject Kprocess::staticMetaObject = { {
    QMetaObject::SuperData::link<KProcess::staticMetaObject>(),
    qt_meta_stringdata_Kprocess.data,
    qt_meta_data_Kprocess,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *Kprocess::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Kprocess::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Kprocess.stringdata0))
        return static_cast<void*>(this);
    return KProcess::qt_metacast(_clname);
}

int Kprocess::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = KProcess::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 9;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
