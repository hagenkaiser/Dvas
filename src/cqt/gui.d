module cqt.gui;

import cqt.cqt;
import std.stdio;
import std.signals;
import window;
import cqt.widget;



private
{
	void* application;
}

static this()
{
	application=createQApplication();
}

static ~this()
{
	destroyQApplication(application);
}

int run()
{
	return _QApplication_exec(application);
}

Window createWindow()
{
	return new QtWindow();
}

