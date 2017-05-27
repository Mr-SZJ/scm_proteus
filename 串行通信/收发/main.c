#include <reg51.h>
sbit LED = P2^0;
void SendOneByte(unsigned char c);
unsigned char i = 0;
void InitUART(void)
{
		//外部中断1
	  EX1 = 1;//分开关
		IT1 = 1;//下降沿触发
	
    TMOD = 0x20;//0010 0000  定时器1工作方式2，8位自动装载初值的定时器
    SCON = 0x50;//0101 0000 串口控制寄存器，工作方式1允许接收
    TH1 = 0xF3;//初值
    TL1 = TH1;//TL1用来定时器计数
    //PCON = 0x80;
    EA = 1;//中断总开关
    ES = 1;//允许串口中断
    TR1 = 1;//启动定时器1
}

void main(void)
{
    InitUART();
	//使用小精灵复制过来的代码需要在主函数后面加锁死。
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