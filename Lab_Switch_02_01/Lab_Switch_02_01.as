opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F1939
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
indf1	equ	1
pc	equ	2
pcl	equ	2
status	equ	3
fsr0l	equ	4
fsr0h	equ	5
fsr1l	equ	6
fsr1h	equ	7
bsr	equ	8
wreg	equ	9
intcon	equ	11
c	equ	1
z	equ	0
pclath	equ	10
# 2 "C:\Users\BANK\Downloads\documents-export-2013-07-23\Lab_Switch_02_01\Lab_Switch_02_01.c"
	psect config,class=CONFIG,delta=2 ;#
# 2 "C:\Users\BANK\Downloads\documents-export-2013-07-23\Lab_Switch_02_01\Lab_Switch_02_01.c"
	dw 0xFFFC & 0xFFE7 & 0xFFDF & 0xFFFF & 0xFFFF & 0xFFFF & 0xF9FF & 0xFFFF & 0xFFFF & 0xFFFF & 0xFFFF & 0xFFFF & 0xFFFF & 0xFBFF & 0xDFFF ;#
	FNROOT	_main
	global	_LED_CHR
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
	global    __stringtab
__stringtab:
	retlw	0
psect	strings
	file	"C:\Users\BANK\Downloads\documents-export-2013-07-23\Lab_Switch_02_01\Lab_Switch_02_01.c"
	line	32
_LED_CHR:
	retlw	03Fh
	retlw	06h
	retlw	05Bh
	retlw	04Fh
	retlw	066h
	retlw	06Dh
	retlw	07Dh
	retlw	07h
	retlw	07Fh
	retlw	06Fh
	retlw	077h
	retlw	07Ch
	retlw	039h
	retlw	05Eh
	retlw	079h
	retlw	071h
	retlw	080h
	global	_LED_CHR
	global	_data
	global	_buff1
	global	_buff2
	global	_buff3
	global	_buff4
	global	_data2
	global	_i
	global	_j
	global	_menu
	global	_temp
	global	_PORTBbits
_PORTBbits	set	13
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_OSCCONbits
_OSCCONbits	set	153
	global	_TRISB
_TRISB	set	141
	global	_TRISC
_TRISC	set	142
	global	_TRISD
_TRISD	set	143
	global	_LATBbits
_LATBbits	set	269
	global	_EEADR
_EEADR	set	401
	global	_ANSELBbits
_ANSELBbits	set	397
	global	_EECON1
_EECON1	set	405
	global	_EECON2
_EECON2	set	406
	global	_EEDATA
_EEDATA	set	403
	global	_RD
_RD	set	3240
	global	_WR
_WR	set	3241
	global	_WREN
_WREN	set	3242
	file	"Lab_Switch_02_01.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_buff1:
       ds      2

_data2:
       ds      2

_i:
       ds      2

_j:
       ds      2

_menu:
       ds      2

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_data:
       ds      3

_buff2:
       ds      2

_buff3:
       ds      2

_buff4:
       ds      2

_temp:
       ds      2

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR0 containing the base address, and
;	WREG with the size to clear
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf0		;clear RAM location pointed to by FSR
	addfsr	0,1
	decfsz wreg		;Have we reached the end of clearing yet?
	goto clrloop	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	global __pbssCOMMON
	movlw	low(__pbssCOMMON)
	movwf	fsr0l
	movlw	high(__pbssCOMMON)
	movwf	fsr0h
	movlw	0Ah
	fcall	clear_ram
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	global __pbssBANK0
	movlw	low(__pbssBANK0)
	movwf	fsr0l
	movlw	high(__pbssBANK0)
	movwf	fsr0h
	movlw	0Bh
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
movlb 0
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	3
;;Data sizes: Strings 0, constant 17, data 0, bss 21, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      3      13
;; BANK0           80      0      11
;; BANK1           80      0       0
;; BANK2           80      0       0
;; BANK3           80      0       0
;; BANK4           80      0       0
;; BANK5           80      0       0
;; BANK6           80      0       0
;; BANK7           80      0       0
;; BANK8           80      0       0
;; BANK9           80      0       0
;; BANK10          80      0       0
;; BANK11          80      0       0
;; BANK12          48      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK4
;;
;;   None.
;;
;; Critical Paths under _main in BANK5
;;
;;   None.
;;
;; Critical Paths under _main in BANK6
;;
;;   None.
;;
;; Critical Paths under _main in BANK7
;;
;;   None.
;;
;; Critical Paths under _main in BANK8
;;
;;   None.
;;
;; Critical Paths under _main in BANK9
;;
;;   None.
;;
;; Critical Paths under _main in BANK10
;;
;;   None.
;;
;; Critical Paths under _main in BANK11
;;
;;   None.
;;
;; Critical Paths under _main in BANK12
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 3     3      0       0
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BIGRAM             3F0      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITCOMMON            E      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;COMMON               E      3       D       2       92.9%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR2              0      0       0       3        0.0%
;;SFR2                 0      0       0       3        0.0%
;;STACK                0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       B       5       13.8%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BITSFR5              0      0       0       6        0.0%
;;SFR5                 0      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITSFR6              0      0       0       7        0.0%
;;SFR6                 0      0       0       7        0.0%
;;BITBANK2            50      0       0       8        0.0%
;;BITSFR7              0      0       0       8        0.0%
;;SFR7                 0      0       0       8        0.0%
;;BANK2               50      0       0       9        0.0%
;;BITSFR8              0      0       0       9        0.0%
;;SFR8                 0      0       0       9        0.0%
;;BITBANK3            50      0       0      10        0.0%
;;BITSFR9              0      0       0      10        0.0%
;;SFR9                 0      0       0      10        0.0%
;;BANK3               50      0       0      11        0.0%
;;BITSFR10             0      0       0      11        0.0%
;;SFR10                0      0       0      11        0.0%
;;BITBANK4            50      0       0      12        0.0%
;;BITSFR11             0      0       0      12        0.0%
;;SFR11                0      0       0      12        0.0%
;;BANK4               50      0       0      13        0.0%
;;BITSFR12             0      0       0      13        0.0%
;;SFR12                0      0       0      13        0.0%
;;BITBANK5            50      0       0      14        0.0%
;;BITSFR13             0      0       0      14        0.0%
;;SFR13                0      0       0      14        0.0%
;;BANK5               50      0       0      15        0.0%
;;BITSFR14             0      0       0      15        0.0%
;;SFR14                0      0       0      15        0.0%
;;BITBANK6            50      0       0      16        0.0%
;;BITSFR15             0      0       0      16        0.0%
;;SFR15                0      0       0      16        0.0%
;;BANK6               50      0       0      17        0.0%
;;BITSFR16             0      0       0      17        0.0%
;;SFR16                0      0       0      17        0.0%
;;BITBANK7            50      0       0      18        0.0%
;;BITSFR17             0      0       0      18        0.0%
;;SFR17                0      0       0      18        0.0%
;;BANK7               50      0       0      19        0.0%
;;BITSFR18             0      0       0      19        0.0%
;;SFR18                0      0       0      19        0.0%
;;BITSFR19             0      0       0      20        0.0%
;;SFR19                0      0       0      20        0.0%
;;ABS                  0      0      18      20        0.0%
;;BITBANK8            50      0       0      21        0.0%
;;BITSFR20             0      0       0      21        0.0%
;;SFR20                0      0       0      21        0.0%
;;BANK8               50      0       0      22        0.0%
;;BITSFR21             0      0       0      22        0.0%
;;SFR21                0      0       0      22        0.0%
;;BITBANK9            50      0       0      23        0.0%
;;BITSFR22             0      0       0      23        0.0%
;;SFR22                0      0       0      23        0.0%
;;BANK9               50      0       0      24        0.0%
;;BITSFR23             0      0       0      24        0.0%
;;SFR23                0      0       0      24        0.0%
;;BITBANK10           50      0       0      25        0.0%
;;BITSFR24             0      0       0      25        0.0%
;;SFR24                0      0       0      25        0.0%
;;BANK10              50      0       0      26        0.0%
;;BITSFR25             0      0       0      26        0.0%
;;SFR25                0      0       0      26        0.0%
;;BITBANK11           50      0       0      27        0.0%
;;BITSFR26             0      0       0      27        0.0%
;;SFR26                0      0       0      27        0.0%
;;BANK11              50      0       0      28        0.0%
;;BITSFR27             0      0       0      28        0.0%
;;SFR27                0      0       0      28        0.0%
;;BITBANK12           30      0       0      29        0.0%
;;BITSFR28             0      0       0      29        0.0%
;;SFR28                0      0       0      29        0.0%
;;BANK12              30      0       0      30        0.0%
;;BITSFR29             0      0       0      30        0.0%
;;SFR29                0      0       0      30        0.0%
;;BITSFR30             0      0       0      31        0.0%
;;SFR30                0      0       0      31        0.0%
;;DATA                 0      0      18      31        0.0%
;;BITSFR31             0      0       0      32        0.0%
;;SFR31                0      0       0      32        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 44 in file "C:\Users\BANK\Downloads\documents-export-2013-07-23\Lab_Switch_02_01\Lab_Switch_02_01.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          3       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\BANK\Downloads\documents-export-2013-07-23\Lab_Switch_02_01\Lab_Switch_02_01.c"
	line	44
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 16
; Regs used in _main: [wreg+status,2+status,0]
	line	45
	
l5152:	
;Lab_Switch_02_01.c: 45: OSCCONbits.SPLLEN = 1;
	movlb 1	; select bank1
	bsf	(153)^080h,7	;volatile
	line	46
	
l5154:	
;Lab_Switch_02_01.c: 46: OSCCONbits.IRCF = 14;
	movf	(153)^080h,w	;volatile
	andlw	not (((1<<4)-1)<<3)
	iorlw	(0Eh & ((1<<4)-1))<<3
	movwf	(153)^080h	;volatile
	line	47
;Lab_Switch_02_01.c: 47: OSCCONbits.SCS = 0;
	movlw	((0 & ((1<<2)-1))<<0)|not (((1<<2)-1)<<0)
	andwf	(153)^080h,f	;volatile
	line	48
	
l5156:	
;Lab_Switch_02_01.c: 48: ANSELBbits.ANSB0=0;
	movlb 3	; select bank3
	bcf	(397)^0180h,0	;volatile
	line	49
	
l5158:	
;Lab_Switch_02_01.c: 49: ANSELBbits.ANSB1=0;
	bcf	(397)^0180h,1	;volatile
	line	50
	
l5160:	
;Lab_Switch_02_01.c: 50: ANSELBbits.ANSB2=0;
	bcf	(397)^0180h,2	;volatile
	line	51
	
l5162:	
;Lab_Switch_02_01.c: 51: TRISD=0x00;
	movlb 1	; select bank1
	clrf	(143)^080h	;volatile
	line	52
	
l5164:	
;Lab_Switch_02_01.c: 52: TRISC=0x00;
	clrf	(142)^080h	;volatile
	line	53
	
l5166:	
;Lab_Switch_02_01.c: 53: TRISB=0x07;
	movlw	(07h)
	movwf	(141)^080h	;volatile
	line	54
	
l5168:	
;Lab_Switch_02_01.c: 54: LATBbits.LATB5=0;;
	movlb 2	; select bank2
	bcf	(269)^0100h,5	;volatile
	line	55
	
l5170:	
;Lab_Switch_02_01.c: 55: LATBbits.LATB6=0;;
	bcf	(269)^0100h,6	;volatile
	line	56
	
l5172:	
;Lab_Switch_02_01.c: 56: menu=0;
	clrf	(_menu)
	clrf	(_menu+1)
	goto	l5174
	line	59
;Lab_Switch_02_01.c: 59: while(1)
	
l2045:	
	line	62
	
l5174:	
;Lab_Switch_02_01.c: 60: {
;Lab_Switch_02_01.c: 62: if(!PORTBbits.RB0)
	movlb 0	; select bank0
	btfsc	(13),0	;volatile
	goto	u2151
	goto	u2150
u2151:
	goto	l5174
u2150:
	line	64
	
l5176:	
;Lab_Switch_02_01.c: 63: {
;Lab_Switch_02_01.c: 64: _delay((unsigned long)((120)*(32000000/4000.0)));
	opt asmopt_off
movlw  5
movwf	((??_main+0)+0+2),f
movlw	223
movwf	((??_main+0)+0+1),f
	movlw	190
movwf	((??_main+0)+0),f
u2187:
	decfsz	((??_main+0)+0),f
	goto	u2187
	decfsz	((??_main+0)+0+1),f
	goto	u2187
	decfsz	((??_main+0)+0+2),f
	goto	u2187
	nop2
opt asmopt_on

	line	65
	
l5178:	
;Lab_Switch_02_01.c: 65: if(!PORTBbits.RB0)
	movlb 0	; select bank0
	btfsc	(13),0	;volatile
	goto	u2161
	goto	u2160
u2161:
	goto	l5174
u2160:
	goto	l5188
	line	67
	
l5180:	
;Lab_Switch_02_01.c: 66: {
;Lab_Switch_02_01.c: 67: while(PORTBbits.RB1!=0)
	goto	l5188
	
l2049:	
	line	69
;Lab_Switch_02_01.c: 68: {
;Lab_Switch_02_01.c: 69: LATBbits.LATB5=1;;
	movlb 2	; select bank2
	bsf	(269)^0100h,5	;volatile
	line	70
;Lab_Switch_02_01.c: 70: LATBbits.LATB6=0;;
	bcf	(269)^0100h,6	;volatile
	line	71
	
l5182:	
;Lab_Switch_02_01.c: 71: _delay((unsigned long)((500)*(32000000/4000.0)));
	opt asmopt_off
movlw  21
movwf	((??_main+0)+0+2),f
movlw	75
movwf	((??_main+0)+0+1),f
	movlw	209
movwf	((??_main+0)+0),f
u2197:
	decfsz	((??_main+0)+0),f
	goto	u2197
	decfsz	((??_main+0)+0+1),f
	goto	u2197
	decfsz	((??_main+0)+0+2),f
	goto	u2197
	clrwdt
opt asmopt_on

	line	72
	
l5184:	
;Lab_Switch_02_01.c: 72: LATBbits.LATB5=0;;
	movlb 2	; select bank2
	bcf	(269)^0100h,5	;volatile
	line	73
	
l5186:	
;Lab_Switch_02_01.c: 73: LATBbits.LATB6=1;;
	bsf	(269)^0100h,6	;volatile
	line	74
;Lab_Switch_02_01.c: 74: _delay((unsigned long)((500)*(32000000/4000.0)));
	opt asmopt_off
movlw  21
movwf	((??_main+0)+0+2),f
movlw	75
movwf	((??_main+0)+0+1),f
	movlw	209
movwf	((??_main+0)+0),f
u2207:
	decfsz	((??_main+0)+0),f
	goto	u2207
	decfsz	((??_main+0)+0+1),f
	goto	u2207
	decfsz	((??_main+0)+0+2),f
	goto	u2207
	clrwdt
opt asmopt_on

	goto	l5188
	line	75
	
l2048:	
	line	67
	
l5188:	
	movlb 0	; select bank0
	btfsc	(13),1	;volatile
	goto	u2171
	goto	u2170
u2171:
	goto	l2049
u2170:
	
l2050:	
	line	76
;Lab_Switch_02_01.c: 75: }
;Lab_Switch_02_01.c: 76: LATBbits.LATB5=0;;
	movlb 2	; select bank2
	bcf	(269)^0100h,5	;volatile
	line	77
;Lab_Switch_02_01.c: 77: LATBbits.LATB6=0;;
	bcf	(269)^0100h,6	;volatile
	goto	l5174
	line	78
	
l2047:	
	goto	l5174
	line	79
	
l2046:	
	goto	l5174
	line	80
	
l2051:	
	line	59
	goto	l5174
	
l2052:	
	line	81
	
l2053:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
psect	maintext
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
