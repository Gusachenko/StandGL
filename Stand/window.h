#ifndef WINDOW_H
#define WINDOW_H

#include <QWindow>

class Window : public QWindow
{
    Q_OBJECT
public:
    explicit Window(QScreen *screen = 0);
    ~Window();

protected:
    virtual void keyPressEvent(QKeyEvent *e);
};

#endif // QT3D_WINDOW_H
