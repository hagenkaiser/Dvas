module canvas;

import cqt.widget;
public import std.typecons;

enum PenStyle
{
	NoPen,SolidLine,DashLine,DotLine,DashDotLine,DashDotDotLine
}

alias Tuple!(real, "x", real, "y", real, "z") Coord;
alias Tuple!(int, "r", int, "g", int, "b") Rgb;
alias Tuple!(PenStyle,"style",Rgb,"color") Pen;
alias Tuple!(Rgb,"color") Brush;


interface Canvas
{
	void setPen(Pen pen);
	void setBrush(Brush brush); 
    void drawRoundedRectangle(int x, int y, int w, int h, double rx, double ry);
    void drawPoint(int x, int y);
    void drawLine(int x, int y, int x2, int y2);
    void drawText ( int x, int y, string text);
}
