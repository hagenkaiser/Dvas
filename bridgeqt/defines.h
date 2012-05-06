#ifndef DEFINES_H
#define DEFINES_H


#define CONSTRUCTOR(name) name* create##name () {return new name;}
#define DESTRUCTOR(name) void destroy##name (void* c) { delete (name*)c;}

#define EXPORT_METHOD(clazz,method) \
    void _##clazz##_##method (void* cl) { clazz* x = (clazz*)cl; x->method(); }

#define EXPORT_METHODR(clazz,method,ret) \
    ret _##clazz##_##method (void* cl) { clazz* x = (clazz*)cl; return x->method(); }

#define EXPORT_METHOD1(clazz,method,arg1) \
    void _##clazz##_##method (void* cl,void* a) { clazz* x = (clazz*)cl; x->method((arg1)a);}

#define EXPORTSPECIAL_METHOD1(clazz,method,arg1,castarg1) \
    void _##clazz##_##method (void* cl,arg1 a) { clazz* x = (clazz*)cl; x->method((castarg1)a);}

#define EXPORT_METHOD2(clazz,method,arg1,arg2) \
    void _##clazz##_##method (void* cl,arg1 a, arg2 b) { clazz* x = (clazz*)cl; x->method(a,b);}

#define EXPORT_METHOD3(clazz,method,arg1,arg2,arg3) \
    void _##clazz##_##method (void* cl,void* a, void* b,void* c) { clazz* x = (clazz*)cl;  x->method((arg1)a,(arg2)b,(arg3)c);}

#define EXPORT_METHOD4(clazz,method,arg1,arg2,arg3,arg4) \
    void _##clazz##_##method (void* cl,void* a, void* b,void* c,void* d) { clazz* x = (clazz*)cl;  x->method((arg1)a,(arg2)b,(arg3)c,(arg4)d);}

#endif // DEFINES_H
