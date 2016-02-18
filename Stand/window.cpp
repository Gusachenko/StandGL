#include "window.h"

#include <QKeyEvent>
#include <QGuiApplication>
#include <QOpenGLContext>

Window::Window(QScreen *screen)
    : QWindow(screen)

{
    setSurfaceType(QSurface::OpenGLSurface);

    resize(600, 400);

    QSurfaceFormat format;
    if (QOpenGLContext::openGLModuleType() == QOpenGLContext::LibGL) {
        format.setVersion(4, 3);
        format.setProfile(QSurfaceFormat::CoreProfile);
    }
    format.setDepthBufferSize( 24 );
    format.setSamples( 4 );
    format.setStencilBufferSize(8);
    setFormat(format);
    create();
}

Window::~Window()
{
}

void Window::keyPressEvent( QKeyEvent* e )
{
    switch ( e->key() )
    {
        case Qt::Key_Escape:
            QGuiApplication::quit();
            break;

        default:
            QWindow::keyPressEvent( e );
    }
}
