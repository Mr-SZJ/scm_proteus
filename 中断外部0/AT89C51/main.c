#include <reg51.h>
sbit led = P2^0;
void main(void)
{ 
    IT1 = 1;//�����ⲿ�ж�0Ϊ��Ե����
	EX1 = 1;//���ⲿ�ж�0
	EA = 1;//�����ж�����
	while(1);
		}
void int0() interrupt 2
		{
	led = ~led;
	}
	