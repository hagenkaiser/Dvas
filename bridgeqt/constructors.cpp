#include <QtGui>
#include <QtCore>
#include "defines.h"
#include "dynamicqobject.h"


//QOBJECT and DYNAMICOBJECT
EXPORT_METHOD2(QObject,setProperty,const char*, const char*)
EXPORT_METHOD2(QObject,setProperty,const char*, int)
EXPORT_METHOD2(QObject,setProperty,const char*, double)
CONSTRUCTOR(DynamicQObject)
EXPORT_METHODR(DynamicQObject,createSlot,void*)
void _DynamicQObject_connectDynamicSlot(void* clazz,void* sender ,const char* signal, const char* slotname,DynamicSlot* slot)
{
    ((DynamicQObject*)clazz)->connectDynamicSlot((QObject*)sender,signal,slotname,slot);
}

//MAINWINDOW
CONSTRUCTOR(QMainWindow)

EXPORT_METHOD1(QMainWindow,setCentralWidget,QWidget*)

//WIDGET
CONSTRUCTOR(QWidget)
EXPORT_METHOD(QWidget,show)
EXPORT_METHOD(QWidget,update)
EXPORT_METHOD(QWidget,repaint)


//PEN
CONSTRUCTOR(QPen)
EXPORTSPECIAL_METHOD1(QPen,setStyle, int, Qt::PenStyle)
void _QPen_setColor(void* pen, int r, int g, int b)
{
    QColor color(r,g,b);
    ((QPen*)pen)->setColor(color);
}

//Brush
CONSTRUCTOR(QBrush)
EXPORTSPECIAL_METHOD1(QBrush,setStyle, int, Qt::BrushStyle)
void _QBrush_setColor(void* brush, int r, int g, int b)
{
    QColor color(r,g,b);
    ((QPen*)brush)->setColor(color);
}



//APPLICATION
void* createQApplication()
{
    int argc=0;
    char* argv=NULL;
    return new QApplication(argc,&argv);
}

int _QApplication_exec(void* arg)
{
    QApplication* app = (QApplication*)arg;
    int x = app->exec();
    return x;
}
DESTRUCTOR(QApplication)





