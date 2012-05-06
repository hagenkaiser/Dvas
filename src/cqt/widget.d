module cqt.widget;

import window;
import canvas;
import cqt.widget;
import cqt.cqt;
import std.stdio;
import std.string;

struct QtPen
{
	void* voidptr;
	
	this(int r, int g, int b, int style)
	{
		voidptr = createQPen();
		_QPen_setColor(voidptr,r,g,b);
	}
	
	void* opCast()
	{
		return voidptr;
	}
	
}

class QtCanvas : Canvas
{
	private QtGraphicsContext ctx;
	void setPen(Pen pen)
	{
		auto qtpen = QtPen(pen.color.r,pen.color.g,pen.color.b,pen.style);
		ctx.setPen(qtpen.voidptr);
	}
	
	void setBrush(Brush brush)
	{
		
	}
	
    void drawRoundedRectangle(int x, int y, int w, int h, double rx, double ry)
    {
    	ctx.drawRoundedRectangle(x,y,w,h,rx,ry);
	}
    
    void drawPoint(int x, int y)
    {
    	ctx.drawPoint(x,y);	
	}
    
    void drawLine(int x, int y, int x2, int y2)
    {
    	ctx.drawLine(x,y,x2,y2);
	}
    
    void drawText ( int x, int y, string text ){
    	ctx.drawText(x,y,text.toStringz);
	}
}

class QtWindow : Window
{
	void* widgetAdapter;
	private WidgetReciever widgetreciever;	
	private QtCanvas canvas;
	
	this()
	{
		canvas = new QtCanvas;
		widgetreciever = 
		new class WidgetReciever {
			
			extern (C++)
			{
				void mouseDoubleClickEvent (  int x,  int y, short buttons )
				{
					mouseDoubleClicked.emit(x,y,buttons);
				}
				
				void mouseMoveEvent (  int x,  int y, short buttons )
				{
				}
				
				void mousePressEvent (  int x,  int y, short buttons )
				{
					mousePressed.emit(x,y,buttons);
				}
				
				void mouseReleaseEvent (  int x,  int y, short buttons )
				{
					mouseReleased.emit(x,y,buttons);
				}
				
				void paintEvent (QtGraphicsContext gc )
				{
					canvas.ctx=gc;
					paint.emit(canvas);
				}
			}
		};
		
		widgetAdapter = connectToQWidget(widgetreciever);
	}
	
	void update()
	{
		_QWidget_update(widgetAdapter);
	}
	
	void repaint()
	{
		_QWidget_repaint(widgetAdapter);
	}
	
	void show()
	{
		_QWidget_show(widgetAdapter);
	}
	
}


extern (C++)
{

interface QtGraphicsContext
{
	void setPen(void* pen);
	void setBrush(void* Brush); 
    void drawRoundedRectangle(int x, int y, int w, int h, double rx, double ry);
    void drawPoint(int x, int y);
    void drawLine(int x, int y, int x2, int y2);
    void drawText ( int x, int y, const char* text );
};

interface WidgetReciever
{ 
  void	mouseDoubleClickEvent (  int x,  int y, short buttons );
  void	mouseMoveEvent (  int x,  int y, short buttons );
  void	mousePressEvent (  int x,  int y, short buttons );
  void	mouseReleaseEvent (  int x,  int y, short buttons );
  void	paintEvent (QtGraphicsContext event );
}

void* connectToQWidget(WidgetReciever reciever);
void _QWidget_show(void*);
void _QWidget_update(void*);
void _QWidget_repaint(void*);

}