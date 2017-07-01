
_main:

;POV_Wireless_Display.c,36 :: 		void main() {
;POV_Wireless_Display.c,37 :: 		TRISA=0b00000000; //Outputs 0-5 (first 6 bits) are used only.
	CLRF       TRISA+0
;POV_Wireless_Display.c,38 :: 		TRISB=0b00000000;
	CLRF       TRISB+0
;POV_Wireless_Display.c,39 :: 		TRISC=0b00000000;
	CLRF       TRISC+0
;POV_Wireless_Display.c,40 :: 		TRISD=0b00000000;
	CLRF       TRISD+0
;POV_Wireless_Display.c,41 :: 		TRISE=0b00000011; //PortE is input
	MOVLW      3
	MOVWF      TRISE+0
;POV_Wireless_Display.c,43 :: 		ADCON0=0b00000000;// No analog
	CLRF       ADCON0+0
;POV_Wireless_Display.c,44 :: 		ADCON1=0b00001110;// No analog
	MOVLW      14
	MOVWF      ADCON1+0
;POV_Wireless_Display.c,45 :: 		OPTION_REG=0b00000010; //Sets the timer prescaler
	MOVLW      2
	MOVWF      OPTION_REG+0
;POV_Wireless_Display.c,46 :: 		INTCON=0b10100000;
	MOVLW      160
	MOVWF      INTCON+0
;POV_Wireless_Display.c,48 :: 		PORTA=0b00000000;
	CLRF       PORTA+0
;POV_Wireless_Display.c,49 :: 		PORTB=0b00000000;
	CLRF       PORTB+0
;POV_Wireless_Display.c,50 :: 		PORTC=0b00000000;
	CLRF       PORTC+0
;POV_Wireless_Display.c,51 :: 		PORTD=0b00000000;
	CLRF       PORTD+0
;POV_Wireless_Display.c,56 :: 		while (1) {
L_main0:
;POV_Wireless_Display.c,77 :: 		}
	GOTO       L_main0
;POV_Wireless_Display.c,78 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;POV_Wireless_Display.c,80 :: 		void interrupt(){
;POV_Wireless_Display.c,81 :: 		if (Prev_IR_State==0 && PORTE.RE0==1) {
	MOVF       _Prev_IR_State+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt4
	BTFSS      PORTE+0, 0
	GOTO       L_interrupt4
L__interrupt6:
;POV_Wireless_Display.c,83 :: 		Last_Pixel_Column_Count=Pixel_Column_Count; //Stores for control purposes
	MOVF       _Pixel_Column_Count+0, 0
	MOVWF      _Last_Pixel_Column_Count+0
;POV_Wireless_Display.c,84 :: 		Pixel_Column_Count=0; //Resets the column count
	CLRF       _Pixel_Column_Count+0
;POV_Wireless_Display.c,85 :: 		}
L_interrupt4:
;POV_Wireless_Display.c,87 :: 		if (ImgToShow==0) {
	MOVF       _ImgToShow+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt5
;POV_Wireless_Display.c,88 :: 		PORTA=WORLDA[Pixel_Column_Count];
	MOVF       _Pixel_Column_Count+0, 0
	ADDLW      _WORLDA+0
	MOVWF      R0+0
	MOVLW      hi_addr(_WORLDA+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTA+0
;POV_Wireless_Display.c,89 :: 		PORTB=WORLDB[Pixel_Column_Count];
	MOVF       _Pixel_Column_Count+0, 0
	ADDLW      _WORLDB+0
	MOVWF      R0+0
	MOVLW      hi_addr(_WORLDB+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTB+0
;POV_Wireless_Display.c,90 :: 		PORTC=WORLDC[Pixel_Column_Count];
	MOVF       _Pixel_Column_Count+0, 0
	ADDLW      _WORLDC+0
	MOVWF      R0+0
	MOVLW      hi_addr(_WORLDC+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
;POV_Wireless_Display.c,91 :: 		PORTD=WORLDD[Pixel_Column_Count];
	MOVF       _Pixel_Column_Count+0, 0
	ADDLW      _WORLDD+0
	MOVWF      R0+0
	MOVLW      hi_addr(_WORLDD+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTD+0
;POV_Wireless_Display.c,97 :: 		} */
L_interrupt5:
;POV_Wireless_Display.c,99 :: 		Prev_IR_State=PORTE.RE0; //Updates the state of the IR detector
	MOVLW      0
	BTFSC      PORTE+0, 0
	MOVLW      1
	MOVWF      _Prev_IR_State+0
;POV_Wireless_Display.c,100 :: 		INTCON.T0IF=0; //Timer didn't overflow
	BCF        INTCON+0, 2
;POV_Wireless_Display.c,101 :: 		TMR0=Pixel_Column_Time;   //Sets the timer
	MOVF       _Pixel_Column_Time+0, 0
	MOVWF      TMR0+0
;POV_Wireless_Display.c,102 :: 		Pixel_Column_Count++; //Updates the pixel column count
	INCF       _Pixel_Column_Count+0, 1
;POV_Wireless_Display.c,103 :: 		}
L_end_interrupt:
L__interrupt9:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
