
#line 1 "..\main.c" /0





 
  
#line 1 "D:\Keil_v5\C51\BIN\..\INC\reg52.h" /0






 
 
 
 
 
 
 sfr P0    = 0x80;
 sfr P1    = 0x90;
 sfr P2    = 0xA0;
 sfr P3    = 0xB0;
 sfr PSW   = 0xD0;
 sfr ACC   = 0xE0;
 sfr B     = 0xF0;
 sfr SP    = 0x81;
 sfr DPL   = 0x82;
 sfr DPH   = 0x83;
 sfr PCON  = 0x87;
 sfr TCON  = 0x88;
 sfr TMOD  = 0x89;
 sfr TL0   = 0x8A;
 sfr TL1   = 0x8B;
 sfr TH0   = 0x8C;
 sfr TH1   = 0x8D;
 sfr IE    = 0xA8;
 sfr IP    = 0xB8;
 sfr SCON  = 0x98;
 sfr SBUF  = 0x99;
 
 
 sfr T2CON  = 0xC8;
 sfr RCAP2L = 0xCA;
 sfr RCAP2H = 0xCB;
 sfr TL2    = 0xCC;
 sfr TH2    = 0xCD;
 
 
 
 
 sbit CY    = PSW^7;
 sbit AC    = PSW^6;
 sbit F0    = PSW^5;
 sbit RS1   = PSW^4;
 sbit RS0   = PSW^3;
 sbit OV    = PSW^2;
 sbit P     = PSW^0;  
 
 
 sbit TF1   = TCON^7;
 sbit TR1   = TCON^6;
 sbit TF0   = TCON^5;
 sbit TR0   = TCON^4;
 sbit IE1   = TCON^3;
 sbit IT1   = TCON^2;
 sbit IE0   = TCON^1;
 sbit IT0   = TCON^0;
 
 
 sbit EA    = IE^7;
 sbit ET2   = IE^5;  
 sbit ES    = IE^4;
 sbit ET1   = IE^3;
 sbit EX1   = IE^2;
 sbit ET0   = IE^1;
 sbit EX0   = IE^0;
 
 
 sbit PT2   = IP^5;
 sbit PS    = IP^4;
 sbit PT1   = IP^3;
 sbit PX1   = IP^2;
 sbit PT0   = IP^1;
 sbit PX0   = IP^0;
 
 
 sbit RD    = P3^7;
 sbit WR    = P3^6;
 sbit T1    = P3^5;
 sbit T0    = P3^4;
 sbit INT1  = P3^3;
 sbit INT0  = P3^2;
 sbit TXD   = P3^1;
 sbit RXD   = P3^0;
 
 
 sbit SM0   = SCON^7;
 sbit SM1   = SCON^6;
 sbit SM2   = SCON^5;
 sbit REN   = SCON^4;
 sbit TB8   = SCON^3;
 sbit RB8   = SCON^2;
 sbit TI    = SCON^1;
 sbit RI    = SCON^0;
 
 
 sbit T2EX  = P1^1;  
 sbit T2    = P1^0;  
 
 
 sbit TF2    = T2CON^7;
 sbit EXF2   = T2CON^6;
 sbit RCLK   = T2CON^5;
 sbit TCLK   = T2CON^4;
 sbit EXEN2  = T2CON^3;
 sbit TR2    = T2CON^2;
 sbit C_T2   = T2CON^1;
 sbit CP_RL2 = T2CON^0;
 
 
#line 7 "..\main.c" /0
 
 
 
 void delayMS(unsigned int z);
  unsigned char keyscan(void);
 void main(void)
 {
  unsigned char key;
 while(1)
 {
 key=keyscan();
 delayMS(50);
 }
 }
 void delayMS(unsigned int z)
 {
 unsigned i,j;
 for(i=z;i>0;i--)
 for(j=122;j>0;j--);
 }
  unsigned char keyscan(void)
 {
  unsigned char scode,scode1,scode2,k;
 P1=0xf0;
 scode1=P1&0xf0;
 if(scode1!=0xf0)
 {
 delayMS(10);
 scode1=P1&0xf0;
 if(scode1!=0xf0)
 {
 scode1=P1^0xf0;           
 P1=0x0f;               
 scode2=P1^0x0f;          
 scode=scode1+scode2;
 switch(scode)
 {
 case 0x11: k=1;break;
 case 0x12: k=2;break;
 case 0x14: k=3;break;
 case 0x18: k=4;break;
 case 0x21: k=5;break;
 case 0x22: k=6;break;
 case 0x24: k=7;break;
 case 0x28: k=8;break;
 case 0x41: k=9;break;
 case 0x42: k=10;break;
 case 0x44: k=11;break;
 case 0x48: k=12;break;
 case 0x81: k=13;break;
 case 0x82: k=14;break;
 case 0x84: k=15;break;
 case 0x88: k=16;break;
 default: k=0;break;
 }
 
 }
 }
 return k;
 }
