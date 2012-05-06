module cqt.cqt;

extern(C++):

	void* createQPen();
	void _QPen_setStyle(void*,int);
	void _QPen_setColor(void*,int,int,int);
	
	void* createQBrush();
	void _QBrush_setStyle(void*,int);
	void _QBrush_setColor(void*,int,int,int);

	void* createQApplication();
	void destroyQApplication(void*);
	int _QApplication_exec(void*);
	
	void* createQMainWindow();
	void _QMainWindow_setCentralWidget(void*,void*);
	
	
	void* createDynamicQObject();
	void _QObject_setProperty(void*,const char*, const char*);
	void _DynamicQObject_connectDynamicSlot(void*,void*,const char*, const char*,DynamicSlot);
	
	interface DynamicSlot
	{
		void call(void* sender, void** args);
	}
	
	
	