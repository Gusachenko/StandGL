#include <window.h>
#include <Qt3DRenderer/qrenderaspect.h>
#include <Qt3DInput/QInputAspect>
#include <Qt3DQuick/QQmlAspectEngine>

#include <QGuiApplication>
#include <QtQml>

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);

    Window view;
    Qt3D::Quick::QQmlAspectEngine engine;

    engine.aspectEngine()->registerAspect(new Qt3D::QRenderAspect());
    engine.aspectEngine()->registerAspect(new Qt3D::QInputAspect());

    // Expose the window as a context property so we can set the aspect ratio
    engine.qmlEngine()->rootContext()->setContextProperty("_window", &view);
    QVariantMap data;
    data.insert(QStringLiteral("surface"), QVariant::fromValue(static_cast<QSurface *>(&view)));
    data.insert(QStringLiteral("eventSource"), QVariant::fromValue(&view));
    engine.aspectEngine()->setData(data);
    engine.aspectEngine()->initialize();
    engine.setSource(QUrl("qrc:/main.qml"));

    view.show();

    return app.exec();
}

