TEMPLATE = app

QT += qml quick gui quick 3dcore 3drenderer 3dinput 3dquick
CONFIG += c++11

SOURCES += main.cpp \
    window.cpp

RESOURCES += qml.qrc \
    data.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    g_wireframe.vsh \
    g_wireframe.fsh

HEADERS += \
    window.h

