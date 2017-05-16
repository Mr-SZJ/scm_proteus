
#line 1 "..\main.c" /0





 
 
  
#line 1 "D:\Keil_C51\C51\BIN\..\INC\Atmel\reg51.h" /0






 
 
 
 
 
 
 sfr P0   = 0x80;
 sfr P1   = 0x90;
 sfr P2   = 0xA0;
 sfr P3   = 0xB0;
 sfr PSW  = 0xD0;
 sfr ACC  = 0xE0;
 sfr B    = 0xF0;
 sfr SP   = 0x81;
 sfr DPL  = 0x82;
 sfr DPH  = 0x83;
 sfr PCON = 0x87;
 sfr TCON = 0x88;
 sfr TMOD = 0x89;
 sfr TL0  = 0x8A;
 sfr TL1  = 0x8B;
 sfr TH0  = 0x8C;
 sfr TH1  = 0x8D;
 sfr IE   = 0xA8;
 sfr IP   = 0xB8;
 sfr SCON = 0x98;
 sfr SBUF = 0x99;
 
 
 
 
 sbit CY   = 0xD7;
 sbit AC   = 0xD6;
 sbit F0   = 0xD5;
 sbit RS1  = 0xD4;
 sbit RS0  = 0xD3;
 sbit OV   = 0xD2;
 sbit P    = 0xD0;
 
 
 sbit TF1  = 0x8F;
 sbit TR1  = 0x8E;
 sbit TF0  = 0x8D;
 sbit TR0  = 0x8C;
 sbit IE1  = 0x8B;
 sbit IT1  = 0x8A;
 sbit IE0  = 0x89;
 sbit IT0  = 0x88;
 
 
 sbit EA   = 0xAF;
 sbit ES   = 0xAC;
 sbit ET1  = 0xAB;
 sbit EX1  = 0xAA;
 sbit ET0  = 0xA9;
 sbit EX0  = 0xA8;
 
 
 sbit PS   = 0xBC;
 sbit PT1  = 0xBB;
 sbit PX1  = 0xBA;
 sbit PT0  = 0xB9;
 sbit PX0  = 0xB8;
 
 
 sbit RD   = 0xB7;
 sbit WR   = 0xB6;
 sbit T1   = 0xB5;
 sbit T0   = 0xB4;
 sbit INT1 = 0xB3;
 sbit INT0 = 0xB2;
 sbit TXD  = 0xB1;
 sbit RXD  = 0xB0;
 
 
 sbit SM0  = 0x9F;
 sbit SM1  = 0x9E;
 sbit SM2  = 0x9D;
 sbit REN  = 0x9C;
 sbit TB8  = 0x9B;
 sbit RB8  = 0x9A;
 sbit TI   = 0x99;
 sbit RI   = 0x98;
 
 
#line 8 "..\main.c" /0
 
  
#line 1 "D:\Keil_C51\C51\BIN\..\INC\stdio.h" /0






 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 typedef unsigned int size_t;
 
 
 #pragma SAVE
 #pragma REGPARMS
 extern char _getkey (void);
 extern char getchar (void);
 extern char ungetchar (char);
 extern char putchar (char);
 extern int printf   (const char *, ...);
 extern int sprintf  (char *, const char *, ...);
 extern int vprintf  (const char *, char *);
 extern int vsprintf (char *, const char *, char *);
 extern char *gets (char *, int n);
 extern int scanf (const char *, ...);
 extern int sscanf (char *, const char *, ...);
 extern int puts (const char *);
 
 #pragma RESTORE
 
 
 
#line 9 "..\main.c" /0
 
 
 
 sbit RS = P2^0;
 sbit RW = P2^1;
 sbit E = P2^2;
 
  unsigned char code tab[] = {"123456789"};
 
 void Delayms(unsigned int ms)
 {
  unsigned char i;
 while(ms--)
 {
 for(i=0;i<120;i++);
 }
 }
 
 
  unsigned char Busy_Check()
 {
  unsigned char LCD_Status;
 RS = 0;
 RW = 1;
 E = 1;
 Delayms(1);
 LCD_Status = P1;
 E = 0;
 return LCD_Status;
 }
 
 void writeCMD(unsigned char cmd){
  unsigned char m;
 while((Busy_Check()&0x80)==0x80);
 RW = 0; 
 RS = 0; 
 P1 = cmd;
 for(m-0;m<=2;m++);
 E = 1; 
 for(m-0;m<=2;m++);
 E = 0; 
 }
 
 void writeData(unsigned char c){
  unsigned char m;
 while((Busy_Check()&0x80)==0x80);
 RW = 0;
 RS = 1;
 P1 = c;
 for(m-0;m<=2;m++);
 E = 1; 
 for(m-0;m<=2;m++);
 E = 0; 
 }
 
 
 void init(){
 RW = 0; 
 E = 0; 
 writeCMD(0x38);
 writeCMD(0x0c);
 writeCMD(0x06);
 writeCMD(0x01);
 }
 
 void show_char(unsigned char row,unsigned char column,unsigned char c){
  unsigned char m;
 writeCMD(0x80+row*0x40+column); 
 for(m=0;m<252;m++);
 writeData(c);
 
 }
 void main(void)
 { 
  unsigned char i;
  unsigned int j;
 init();
 for(i=0;i<=9;i++){
 show_char(0,i,tab[i]);
 show_char(1,15-i,tab[i]); 
 }
 while(1);
 }
