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
	CS = 0;//Ƭѡ
	WR1 = 0;//����Ĵ�������
	P0 = 0xff;//���ݽ�������Ĵ���
	
	WR2 = 0;//DAC�Ĵ�������
	XFER = 0;//���ݴ�������
	
	
}			



