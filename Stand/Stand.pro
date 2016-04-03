TEMPLATE = app

QT += qml quick 3dcore 3drender 3dinput 3dquick
CONFIG += c++11

SOURCES += main.cpp

RESOURCES += qml.qrc \
    data.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    g_wireframe.vsh \
    g_wireframe.fsh \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

