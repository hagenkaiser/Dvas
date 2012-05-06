module window;

import canvas;
public import std.signals;

abstract class Window
{
	mixin Signal!(int,int, short) mousePressed;
	mixin Signal!(int,int, short) mouseReleased;
	mixin Signal!(int,int, short) mouseDoubleClicked;
	mixin Signal!(Canvas) paint;
	
	void show();
	void update();
	void repaint();
}

