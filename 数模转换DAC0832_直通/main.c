#include <reg52.h>
sbit CS=P2^0;
sbit WR1 = P2^1;
sbit WR2 = P2^2;
sbit XFER = P2^3;
void main()
{ 		

		/*
	CS = 0;
	P0 = 0xff;
	*/
	CS = 0;//片选
	WR1 = 0;//输入寄存器允许
	P0 = 0xff;//数据进入输入寄存器
	
	WR2 = 0;//DAC寄存器允许
	XFER = 0;//数据传送允许
	
	
}			



