#include <reg51.h>
sbit led = P2^0;
void main(void)
{ 
    IT1 = 1;//设置外部中断0为边缘触发
	EX1 = 1;//开外部中断0
	EA = 1;//开总中断允许
	while(1);
		}
void int0() interrupt 2
		{
	led = ~led;
	}
	