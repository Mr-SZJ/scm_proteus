#inclued <reg52.h>
#define uchar unsigned char
	uchar duan[]={~0x3F,~0x06,~0x5B,~0x4F,~0x66,~0x6D,~0x7D,~0x07,~0x7F,~0x6F,~0x77,~0x7C,~0x39,~0x5E,~0x79,~0x71};
uchar key_l,key_h;
	void delay()
	{
	  int i=10000;
		while(i--);
	}
	void keyscan()
	{ 
		 uchar key;
	       P1=0xf0;
		  key_l=P1;
		  key_l=key_l&0xf0;
		if(key_l!=0xf0)
		{
		  delay();
			if(key_l!=0xf0)
			{
			  key_l=P1;
				key_l=key_l|0x0f;//11101111
				P1=key_l;
				key_h=P1;
				key_h=key_h&0xf0;//00001110
				key_l=key_l&0xf0;//11100000
				key=key_l+key_h;//11101110
				switch(key)
				{
					case 0xee:P0=duan[1];break;
					case 0xde:P0=duan[6];break;
					case 0xbe:P0=duan[10];break;
					case 0x7e:P0=duan[14];break;				
				}
				
			}
		
		}
		while(key_l!=0xf0);
	
	}
	void main()
	{
	  while(1)
		{
		 void keyscan();
			delay();
		}
	
	}