;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.3.0 #8604 (May 11 2013) (Linux)
; This file was generated Wed Jun 24 15:41:23 2015
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"adc.c"
	list	p=16f88
	radix dec
	include "p16f88.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_STATUSbits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_INTCONbits
	extern	_PIR1bits
	extern	_PIR2bits
	extern	_T1CONbits
	extern	_T2CONbits
	extern	_SSPCONbits
	extern	_CCP1CONbits
	extern	_RCSTAbits
	extern	_ADCON0bits
	extern	_OPTION_REGbits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_PIE1bits
	extern	_PIE2bits
	extern	_PCONbits
	extern	_OSCCONbits
	extern	_OSCTUNEbits
	extern	_SSPSTATbits
	extern	_TXSTAbits
	extern	_ANSELbits
	extern	_CMCONbits
	extern	_CVRCONbits
	extern	_ADCON1bits
	extern	_WDTCONbits
	extern	_EECON1bits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_PIR2
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_TMR2
	extern	_T2CON
	extern	_SSPBUF
	extern	_SSPCON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_CCP1CON
	extern	_RCSTA
	extern	_TXREG
	extern	_RCREG
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISB
	extern	_PIE1
	extern	_PIE2
	extern	_PCON
	extern	_OSCCON
	extern	_OSCTUNE
	extern	_PR2
	extern	_SSPADD
	extern	_SSPSTAT
	extern	_TXSTA
	extern	_SPBRG
	extern	_ANSEL
	extern	_CMCON
	extern	_CVRCON
	extern	_ADRESL
	extern	_ADCON1
	extern	_WDTCON
	extern	_EEDATA
	extern	_EEADR
	extern	_EEDATH
	extern	_EEADRH
	extern	_EECON1
	extern	_EECON2

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_adc_start
	global	_adc_init
	global	_delay

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_adc_0	udata
r0x1000	res	1
r0x1001	res	1
r0x1002	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_adc	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _adc_start	;Function start
; 2 exit points
;has an exit
;functions called:
;   _delay
;   _delay
;1 compiler assigned register :
;   r0x1002
;; Starting pCode block
_adc_start	;Function start
; 2 exit points
;	.line	22; "adc.c"	void adc_start(uint8_t adc_canal)
	BANKSEL	r0x1002
	MOVWF	r0x1002
;	.line	24; "adc.c"	if (adc_canal == ADC1) {
	MOVF	r0x1002,W
	BTFSS	STATUS,2
	GOTO	_00118_DS_
;	.line	25; "adc.c"	ADCON0 = 0b00000001;
	MOVLW	0x01
	BANKSEL	_ADCON0
	MOVWF	_ADCON0
	GOTO	_00119_DS_
_00118_DS_
;	.line	27; "adc.c"	ADCON0 = 0b00001001;
	MOVLW	0x09
	BANKSEL	_ADCON0
	MOVWF	_ADCON0
_00119_DS_
;	.line	29; "adc.c"	delay();
	CALL	_delay
;	.line	31; "adc.c"	BIT_SET(ADCON0, 2);
	BANKSEL	_ADCON0
	BSF	_ADCON0,2
	RETURN	
; exit point of _adc_start

;***
;  pBlock Stats: dbName = C
;***
;entry:  _adc_init	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
_adc_init	;Function start
; 2 exit points
;	.line	15; "adc.c"	ANSEL = 0b00000011;
	MOVLW	0x03
	BANKSEL	_ANSEL
	MOVWF	_ANSEL
;	.line	17; "adc.c"	ADCON1 = 0b11000000;
	MOVLW	0xc0
	MOVWF	_ADCON1
;	.line	19; "adc.c"	ADCON0 = 0b00000001;
	MOVLW	0x01
	BANKSEL	_ADCON0
	MOVWF	_ADCON0
	RETURN	
; exit point of _adc_init

;***
;  pBlock Stats: dbName = C
;***
;entry:  _delay	;Function start
; 2 exit points
;has an exit
;2 compiler assigned registers:
;   r0x1000
;   r0x1001
;; Starting pCode block
_delay	;Function start
; 2 exit points
;	.line	9; "adc.c"	for (i=0; i<10; i++);
	MOVLW	0x0a
	BANKSEL	r0x1000
	MOVWF	r0x1000
_00108_DS_
	BANKSEL	r0x1000
	MOVF	r0x1000,W
	MOVWF	r0x1001
	DECF	r0x1001,W
	MOVWF	r0x1000
	MOVF	r0x1000,W
	BTFSS	STATUS,2
	GOTO	_00108_DS_
	RETURN	
; exit point of _delay


;	code size estimation:
;	   29+    8 =    37 instructions (   90 byte)

	end
