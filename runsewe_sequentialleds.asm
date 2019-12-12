; Sample Code for blinking sequential LEDs
    
	    
#include "p16f877.inc"

; CONFIG
; __config 0xFFFB
 __CONFIG _FOSC_EXTRC & _WDTE_OFF & _PWRTE_OFF & _CP_OFF & _BOREN_ON & _LVP_ON & _CPD_OFF & _WRT_ON
 
	LIST P = 16F877	    ; target PIC
 
 
STATUS	    EQU		    0x03	    ; Declare STATUS SFR - Bank0 
PORTB	    EQU		    0x06	    ; Declare PORTB SFR  - Bank0 
TRISB	    EQU		    0x86	    ; Seclare TRISB SFR  - Bank1 
	    
P0	    EQU		    0x05	    ; Declare Constant P0=STATUS<5>  
P1	    EQU		    0x06	    ; Declare Constant P1=STATUS<6> 
	    
	    
	    CBLOCK	    0x20	    ; GPR
			    Kount100us
			    Kount25ms
			    Kount1s
	    ENDC 

	    	    
	    ORG		    0x0000 
	    GOTO	    START
	    
	    NOP
	    NOP
	    NOP
	    NOP
	    
START
	    bcf		    STATUS, P1	    ; Select Bank0 or 1
	    bsf		    STATUS, P0	    ; Select Bank1 -- STATUS<5>
	    movlw	    0x00	    ; move 0 to w register 
	    movwf	    TRISB	    ; TRISB<7:0>='0'. PORTB<7:0> outputs
	    bcf		    STATUS, P0	    ; Select Bank0 -- STATUS<5> 
	    movlw	    0x00	    ; move 0 to w register 
	    movwf	    PORTB	    ; PORT<7:0>='0'. for all LEDs to be off

	  
LOOP	   
	    ; Turn PORTB<0> on for one second then off for one second
	    bsf		    PORTB, 0x00
	    call	    Delay1s	    
	    bcf		    PORTB, 0x00	    
	    call	    Delay1s
	    
	     ; Turn PORTB<1> on for one second then off for one second
	    bsf		    PORTB, 0x01
	    call	    Delay1s	    
	    bcf		    PORTB, 0x01	
	    call	    Delay1s
	    
	     ; Turn PORTB<2> on for one second then off for one second
	    bsf		    PORTB, 0x02
	    call	    Delay1s	    
	    bcf		    PORTB, 0x02	    
	    call	    Delay1s
	    
	     ; Turn PORTB<3> on for one second then off for one second
	    bsf		    PORTB, 0x03
	    call	    Delay1s	    
	    bcf		    PORTB, 0x03	    
	    call	    Delay1s
	    
	     ; Turn PORTB<4> on for one second then off for one second
	    bsf		    PORTB, 0x04
	    call	    Delay1s	    
	    bcf		    PORTB, 0x04	    
	    call	    Delay1s
	    
	     ; Turn PORTB<5> on for one second then off for one second
	    bsf		    PORTB, 0x05
	    call	    Delay1s	    
	    bcf		    PORTB, 0x05   
	    call	    Delay1s
	    
	     ; Turn PORTB<6> on for one second then off for one second
	    bsf		    PORTB, 0x06
	    call	    Delay1s	    
	    bcf		    PORTB, 0x06	    
	    call	    Delay1s
	    
	     ; Turn PORTB<7> on for one second then off for one second
	    bsf		    PORTB, 0x07
	    call	    Delay1s	    
	    bcf		    PORTB, 0x07    
	    call	    Delay1s
	    
	    goto	    LOOP
	    
	    
Delay1s	
	    movlw	    0x28	    ; Load d'40 into literal 
	    movwf	    Kount1s
R1s	    
	    call	    Delay25ms	    ; call 25ms delay 40 times 
	    decfsz	    Kount1s
	    goto	    R1s
					    ; skip 
	    return 
	    
	    
Delay25ms
	    movlw	    0xFA	   ; Load d'250 in Literal 
	    movwf	    Kount25ms
R25ms	    
	    call	    Delay100us	   ; Call 100us delay 250 times 
	    decfsz	    Kount25ms
	    goto	    R25ms 
					    ; skip
	    return 
	   
Delay100us
	    movlw	    0xA5	    ; Load d'165 into literal
	    movwf	    Kount100us
R100us	   
	    decfsz	    Kount100us
	    goto	    R100us
					    ; skip
	    return 
	    END



