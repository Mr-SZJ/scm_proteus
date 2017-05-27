#include <reg51.h>
sbit LED = P2^0;
void SendOneByte(unsigned char c);
unsigned char i = 0;
void InitUART(void)
{
		//�ⲿ�ж�1
	  EX1 = 1;//�ֿ���
		IT1 = 1;//�½��ش���
	
    TMOD = 0x20;//0010 0000  ��ʱ��1������ʽ2��8λ�Զ�װ�س�ֵ�Ķ�ʱ��
    SCON = 0x50;//0101 0000 ���ڿ��ƼĴ�����������ʽ1�������
    TH1 = 0xF3;//��ֵ
    TL1 = TH1;//TL1������ʱ������
    //PCON = 0x80;
    EA = 1;//�ж��ܿ���
    ES = 1;//�������ж�
    TR1 = 1;//������ʱ��1
}

void main(void)
{
    InitUART();
	//ʹ��С���鸴�ƹ����Ĵ�����Ҫ�������������������
	  while(1);
}

void EXTI0Interrupt(void) interrupt 2
{
	LED = ~LED;
	i++;
	if(i > 9) i=0;
	SendOneByte(i);
}
void UARTInterrupt(void) interrupt 4
{
		EA = 0;
    if(RI)
    {
        RI = 0;
        P1 = SBUF;
    }
    else
        TI = 0;
		EA = 1;
}

void SendOneByte(unsigned char c)
{
    SBUF = c;
}