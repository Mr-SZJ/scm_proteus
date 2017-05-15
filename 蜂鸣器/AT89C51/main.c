
#include <reg52.h>

sbit buzz = P2^0;

void delay(){
	 int i=100;
	while(i--);
	}
void main(){
		while(1){
			buzz = ~buzz;
			delay();
			}
	
	}