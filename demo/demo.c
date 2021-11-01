#include "demo.h"

#include <stdlib.h>
#include <stdio.h>

typedef struct
{
    int32_t a;
    int32_t b;
    int32_t c;
} Demo_PrivateStruct;

Demo_TestClass *Demo_TestClass__create()
{
    Demo_TestClass *_this = malloc(sizeof(Demo_TestClass));
    return _this;
}
void Demo_TestClass__destroy(Demo_TestClass *_this)
{
    free(_this);
}
int Demo_TestClass_testMethod(Demo_TestClass *_this, int a, int b)
{
    if (a < b)
    {
        return -44;
    }
    for (int i = 0; i < b; i++)
    {
        printf("krebskopf");
    }
    return 5;
}