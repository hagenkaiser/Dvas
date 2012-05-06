#-------------------------------------------------
#
# Project created by QtCreator 2012-04-21T20:19:37
#
#-------------------------------------------------

QT       += opengl webkit

TARGET = bridgeqt
TEMPLATE = lib
CONFIG += staticlib

SOURCES += \
    constructors.cpp \
    dynamicqobject.cpp \
    widget.cpp

HEADERS += \
    defines.h \
    dynamicqobject.h \
    widget.h
unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}

OTHER_FILES +=
