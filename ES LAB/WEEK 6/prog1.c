#include <LPC17xx.h>

unsigned int i, j;
unsigned long LEG = 0x00000010;

int main()
{
    SystemInit();
    SystemCoreClockUpdate();

    LPC_PINCON->PINSEL0 &= 0XFF0000FF;
    LPC_GPIO0->FIODIR |= 0X00000FF0;

    while (1)
    {
        LED = 0x00000010;

        for (i = 0; i < 9; i++)
        {
            LPC_GPFO0->FIOSET = LED;
            for (j = 0; j < count; j++)
                ;
            LED <<= 1;
        }
        LED = 0X00000010;
        for (i = 0; i < 9; i++)
        {
            LPC_GPIO0->FIOCLR = LED;
            for (j = 0; j < count; j++)
                ;
            LED <<= 1;
        }
    }
}