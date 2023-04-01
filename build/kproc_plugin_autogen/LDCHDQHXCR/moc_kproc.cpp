/****************************************************************************
** Meta object code from reading C++ file 'kproc.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../kplugin/kproc.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'kproc.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_KProcess_t {
    QByteArrayData data[9];
    char stringdata0[62];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_KProcess_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_KProcess_t qt_meta_stringdata_KProcess = {
    {
QT_MOC_LITERAL(0, 0, 8), // "KProcess"
QT_MOC_LITERAL(1, 9, 5), // "start"
QT_MOC_LITERAL(2, 15, 0), // ""
QT_MOC_LITERAL(3, 16, 7), // "program"
QT_MOC_LITERAL(4, 24, 9), // "arguments"
QT_MOC_LITERAL(5, 34, 7), // "readAll"
QT_MOC_LITERAL(6, 42, 8), // "readLine"
QT_MOC_LITERAL(7, 51, 5), // "write"
QT_MOC_LITERAL(8, 57, 4) // "data"

    },
    "KProcess\0start\0\0program\0arguments\0"
    "readAll\0readLine\0write\0data"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_KProcess[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    2,   39,    2, 0x02 /* Public */,
       1,    1,   44,    2, 0x02 /* Public */,
       5,    0,   47,    2, 0x02 /* Public */,
       6,    0,   48,    2, 0x02 /* Public */,
       7,    1,   49,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::QVariantList,    3,    4,
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::QByteArray,
    QMetaType::QByteArray,
    QMetaType::LongLong, QMetaType::QString,    8,

       0        // eod
};

void KProcess::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<KProcess *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->start((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QVariantList(*)>(_a[2]))); break;
        case 1: _t->start((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 2: { QByteArray _r = _t->readAll();
            if (_a[0]) *reinterpret_cast< QByteArray*>(_a[0]) = std::move(_r); }  break;
        case 3: { QByteArray _r = _t->readLine();
            if (_a[0]) *reinterpret_cast< QByteArray*>(_a[0]) = std::move(_r); }  break;
        case 4: { qint64 _r = _t->write((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< qint64*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject KProcess::staticMetaObject = { {
    QMetaObject::SuperData::link<QProcess::staticMetaObject>(),
    qt_meta_stringdata_KProcess.data,
    qt_meta_data_KProcess,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *KProcess::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *KProcess::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_KProcess.stringdata0))
        return static_cast<void*>(this);
    return QProcess::qt_metacast(_clname);
}

int KProcess::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QProcess::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
