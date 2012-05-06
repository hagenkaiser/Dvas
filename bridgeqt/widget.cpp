#include "widget.h"
#include "defines.h"

#include <QtOpenGL>


struct GraphicsContext
{
    QPainter* painter;

    virtual void setPen(void* pen)
    {
        painter->setPen(*((QPen*)pen));
    }

    virtual void setBrush(void* brush)
    {
        painter->setBrush(*((QBrush*)brush));
    }

    virtual void drawRoundedRectangle(int x, int y, int w, int h, double rx, double ry)
    {
        painter->drawRoundedRect(x,y,w,h,rx,ry);
    }

    virtual void drawPoint(int x, int y)
    {
        painter->drawPoint(x,y);
    }

    virtual void drawLine(int x, int y, int x2, int y2)
    {
        painter->drawLine(x,y,x2,y2);
    }

    virtual void drawText ( int x, int y, const char* text )
    {
        painter->drawText(x,y,QString(text));
    }
};

struct WidgetReciever
{
    virtual void	mouseDoubleClickEvent (  int x,  int y, short buttons );
    virtual void	mouseMoveEvent (  int x,  int y, short buttons );
    virtual void	mousePressEvent (  int x,  int y, short buttons );
    virtual void	mouseReleaseEvent (  int x,  int y, short buttons );
    virtual void	paintEvent ( GraphicsContext* event );
};

class WidgetAdapter : public QGLWidget
{
public:
    WidgetReciever* reciever;
    QPainter painter;
    GraphicsContext ctx;
    WidgetAdapter()
    {
        ctx.painter = &painter;
    }

    virtual void	mouseDoubleClickEvent ( QMouseEvent * event )
    {
        reciever->mouseDoubleClickEvent(event->x(), event->y(), (short)event->buttons());
    }

    virtual void mouseMoveEvent ( QMouseEvent * event )
    {
        reciever->mouseMoveEvent(event->x(), event->y(), (short)event->buttons());
    }

    virtual void mousePressEvent ( QMouseEvent * event )
    {
        reciever->mousePressEvent(event->x(), event->y(), (short)event->buttons());
    }

    virtual void mouseReleaseEvent ( QMouseEvent * event )
    {
        reciever->mouseReleaseEvent(event->x(), event->y(), (short)event->buttons());
    }

    virtual void paintEvent ( QPaintEvent * event )
    {
        painter.begin(this);
        painter.setPen(Qt::blue);
        reciever->paintEvent(&ctx);
        painter.end();
    }
};

void* connectToQWidget(WidgetReciever* reciever)
{
    WidgetAdapter* result = new WidgetAdapter();
    result->reciever = reciever;
    return result;
}






