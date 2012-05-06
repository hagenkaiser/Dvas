import std.stdio;
import cqt.gui;
import window;
import canvas;

class Line
{

	void paint(Canvas cv)
	{
		cv.drawLine(10,10,100,100);
	}

}

int main()
{
	writefln("WID0");
	
	auto window = cqt.gui.createWindow();
	auto line = new Line();
	
	window.paint.connect(&line.paint);
	window.show();
	
	return cqt.gui.run();
}
