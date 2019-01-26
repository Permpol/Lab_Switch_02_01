#include <htc.h>
__CONFIG(FOSC_INTOSC & 
WDTE_OFF & 
PWRTE_ON & 
MCLRE_ON & 
CP_OFF & 
CPD_OFF & 
BOREN_OFF & 
CLKOUTEN_OFF & 
IESO_ON & 
FCMEN_ON &

WRT_OFF & 
//VCAPEN_OFF & 
PLLEN_ON & 
STVREN_ON & 
BORV_HI & 
LVP_OFF);
#define _XTAL_FREQ 32000000
#define DSP_7SEG LATD
#define SCAN_DIS1 LATCbits.LATC0
#define SCAN_DIS2 LATCbits.LATC1
#define SCAN_DIS3 LATCbits.LATC2
#define SCAN_DIS4 LATCbits.LATC3
#define SW1		   PORTBbits.RB0
#define SW2		   PORTBbits.RB1
#define SW3		   PORTBbits.RB2
#define LED1	   LATBbits.LATB5
#define LED2	   LATBbits.LATB6
#define ON 1;
#define OFF 0;
char const LED_CHR[17]={0x3F,0x06,0x5B,0x4F,0x66,
						0x6D,0x7D,0x07,0x7F,0x6F,
						0x77,0x7C,0x39,0x5E,0x79,
						0x71,0x80};
unsigned int i,j;

float data;
unsigned int data2,menu;
unsigned int buff1,buff2,buff3,buff4,temp;


void main(void)
{
	OSCCONbits.SPLLEN = 1;
	OSCCONbits.IRCF = 14;
	OSCCONbits.SCS = 0;
	ANSELBbits.ANSB0=0;
	ANSELBbits.ANSB1=0;
	ANSELBbits.ANSB2=0;
	TRISD=0x00;
	TRISC=0x00;
	TRISB=0x07;
	LED1=OFF;
	LED2=OFF;
	menu=0;
	

		while(1)
{
///
if(!SW1)
{
__delay_ms(120);
  if(!SW1)
  {
  while(SW2!=0)
     {
LED1=ON;
LED2=OFF;
__delay_ms(500);
LED1=OFF;
LED2=ON;
__delay_ms(500);
     }
LED1=OFF;
LED2=OFF;
   }
}
}
}