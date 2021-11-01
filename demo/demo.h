#include <stdint.h>

#define Demo_TestEnum_TypeA 0
#define Demo_TestEnum_TypeB 32
#define Demo_TestEnum_TypeC 33

typedef struct
{
    uint32_t a;
    uint32_t b;
} Demo_PackedStruct __attribute__((packed));

typedef struct
{
    int32_t val1;
    int16_t val2;
    uint8_t val3;
} Demo_TestStruct;

typedef struct
{
    int32_t test;
} Demo_TestClass;

Demo_TestClass* Demo_TestClass__create();
void Demo_TestClass__destroy(Demo_TestClass *_this);
int Demo_TestClass_testMethod(Demo_TestClass *_this, int a, int b);