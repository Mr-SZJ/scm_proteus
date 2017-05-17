
#include <reg51.h>
	                
#define uchar unsigned char	 //宏的定义变量类型 uchar 代替 unsigned char
#define uint  unsigned int	 //宏的定义变量类型 uint  代替 unsigned int

uchar  dis_buf;            //显示缓存
uchar  temp;
uchar  key;                //键顺序码
void delay(uchar x);      //x*0.14MS

// 此表为 LED 的字模          	   0	  1		2	 3	   4	 5		6	 7		8	 9	  a		  b	   c	d	  e		 f
unsigned char code LED7Code[] = {~0x3F,~0x06,~0x5B,~0x4F,~0x66,~0x6D,~0x7D,~0x07,~0x7F,~0x6F,~0x77,~0x7C,~0x39,~0x5E,~0x79,~0x71};

/*************************************************************
*                                                           *
* 延时子程序                                                *
*                                                           *
*************************************************************/

void  delay(uchar x)
{ uchar j;
    while((x--)!=0)  //CPU执行x*12次
    { for(j=0;j<125;j++)
         {;}
    }
}

/*************************************************************
*                                                            *
* 键扫描子程序  (3*4 的矩阵) P1.4 P1.5 P1.6 P1.7为列         *
*							  P1.1 P1.2 P1.3为行             *
*                            								 *
*************************************************************/

 void  keyscan(void)
 { 	temp = 0;
    P1=0xF0;                 //高四位输入   列为高电平  行为低电平
    delay(1);				 //延时
	temp=P1;                 //读P1口 
    temp=temp&0xF0;			 //屏蔽低四位
    temp=~((temp>>4)|0xF0);	  
    if(temp==1)	  // p1.4 被拉低
        key=1;  //第1个按键键值
    else if(temp==2)   // p1.5 被拉低
        key=2;	  //第2个按键键值
    else if(temp==4)   // p1.6 被拉低
        key=3;	 //第3个按键键值
    else if(temp==8)   // p1.7 被拉低
         key=4;	  //第4个按键键值
	else
	   key = 16;
        
    P1=0x0F;             //低四位输入  行为高电平 列为低电平
    delay(1);			 //延时
	temp=P1;             //读P1口       
    temp=temp&0x0F;
    temp=~(temp|0xF0);
	if(temp==1)				   //第一行  p1.0  被拉低
		key=key+0;
    else if(temp==2)		   //第二行  p1.1  被拉低
        key=key+4; 
    else if(temp==4)   //第三行  p1.2  被拉低
        key=key+8;
    else if(temp==8)   //第四行 p1.3  被拉低
        key=key+12;
	else
	  key = 16;
 
    	
     dis_buf = key;	    //键值入显示缓存
     //dis_buf = dis_buf & 0x0f;
 
 }

/*************************************************************
*                                                           *
*判断键是否按下                                             *
*                                                           *
*************************************************************/

 void  keydown(void)
 {  
  	P1=0xF0;       //将高4位全部置1 低四位全部置0
	if(P1!=0xF0)  //判断按键是否按下 如果按钮按下 会拉低P1其中的一个端口
	{
	  keyscan();  //调用按键扫描程序
    }
 }
 
/*************************************************************
*                                                            *
* 主程序                                                     *
*                                                            *
*************************************************************/ 
main()
 {
    P0=0xFF;                    //置P0口
    P1=0xFF;                    //置P1口  
    delay(10);                  //延时
    
    while(1)
    { 
       keydown();	 //调用按键判断检测程序
	   P0 = LED7Code[(dis_buf)%16]&0x7f;     //LED7 0x7f为小数点 共阴和共阳此处也是不一样;  %16表示输出16进制
    
    }
  }   



