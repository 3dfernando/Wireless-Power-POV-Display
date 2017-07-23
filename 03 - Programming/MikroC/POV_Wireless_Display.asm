
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
;POV_Wireless_Display.c,59 :: 		if (!(Last_Pixel_Column_Count==Desired_Pixel_Column_Count)) {
	MOVF       _Last_Pixel_Column_Count+0, 0
	XORLW      150
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;POV_Wireless_Display.c,61 :: 		diff = Desired_Pixel_Column_Count-Last_Pixel_Column_Count;
	MOVF       _Last_Pixel_Column_Count+0, 0
	SUBLW      150
	MOVWF      FLOC__main+4
	CLRF       FLOC__main+5
	BTFSS      STATUS+0, 0
	DECF       FLOC__main+5, 1
	MOVF       FLOC__main+4, 0
	MOVWF      _diff+0
	MOVF       FLOC__main+5, 0
	MOVWF      _diff+1
;POV_Wireless_Display.c,62 :: 		timeNow=255-Pixel_Column_Time;
	MOVF       _Pixel_Column_Time+0, 0
	SUBLW      255
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _timeNow+0
	MOVF       R0+1, 0
	MOVWF      _timeNow+1
;POV_Wireless_Display.c,63 :: 		newTimeDelta = (double) timeNow * ((double) diff/ (double) Desired_Pixel_Column_Count);
	CALL       _int2double+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       R0+2, 0
	MOVWF      FLOC__main+2
	MOVF       R0+3, 0
	MOVWF      FLOC__main+3
	MOVF       FLOC__main+4, 0
	MOVWF      R0+0
	MOVF       FLOC__main+5, 0
	MOVWF      R0+1
	CALL       _int2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      22
	MOVWF      R4+2
	MOVLW      134
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       FLOC__main+0, 0
	MOVWF      R4+0
	MOVF       FLOC__main+1, 0
	MOVWF      R4+1
	MOVF       FLOC__main+2, 0
	MOVWF      R4+2
	MOVF       FLOC__main+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _newTimeDelta+0
	MOVF       R0+1, 0
	MOVWF      _newTimeDelta+1
	MOVF       R0+2, 0
	MOVWF      _newTimeDelta+2
	MOVF       R0+3, 0
	MOVWF      _newTimeDelta+3
;POV_Wireless_Display.c,64 :: 		newTimeDelta = newTimeDelta * Kp; //That's gonna be the delta applied
	MOVF       _Kp+0, 0
	MOVWF      R4+0
	MOVF       _Kp+1, 0
	MOVWF      R4+1
	MOVF       _Kp+2, 0
	MOVWF      R4+2
	MOVF       _Kp+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _newTimeDelta+0
	MOVF       R0+1, 0
	MOVWF      _newTimeDelta+1
	MOVF       R0+2, 0
	MOVWF      _newTimeDelta+2
	MOVF       R0+3, 0
	MOVWF      _newTimeDelta+3
;POV_Wireless_Display.c,66 :: 		if (abs(newTimeDelta)>1) {
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      FARG_abs_a+0
	MOVF       R0+1, 0
	MOVWF      FARG_abs_a+1
	CALL       _abs+0
	MOVLW      128
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVF       R0+0, 0
	SUBLW      1
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;POV_Wireless_Display.c,67 :: 		Pixel_Column_Time += newTimeDelta;
	MOVF       _Pixel_Column_Time+0, 0
	MOVWF      R0+0
	CALL       _byte2double+0
	MOVF       _newTimeDelta+0, 0
	MOVWF      R4+0
	MOVF       _newTimeDelta+1, 0
	MOVWF      R4+1
	MOVF       _newTimeDelta+2, 0
	MOVWF      R4+2
	MOVF       _newTimeDelta+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	CALL       _double2byte+0
	MOVF       R0+0, 0
	MOVWF      _Pixel_Column_Time+0
;POV_Wireless_Display.c,68 :: 		if  (Pixel_Column_Time > 250) {
	MOVF       R0+0, 0
	SUBLW      250
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;POV_Wireless_Display.c,69 :: 		Pixel_Column_Time=250 ;
	MOVLW      250
	MOVWF      _Pixel_Column_Time+0
;POV_Wireless_Display.c,70 :: 		}
L_main4:
;POV_Wireless_Display.c,71 :: 		}
L_main3:
;POV_Wireless_Display.c,72 :: 		}
L_main2:
;POV_Wireless_Display.c,73 :: 		delay_ms(300);
	MOVLW      8
	MOVWF      R11+0
	MOVLW      157
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;POV_Wireless_Display.c,74 :: 		}
	GOTO       L_main0
;POV_Wireless_Display.c,75 :: 		}
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

;POV_Wireless_Display.c,77 :: 		void interrupt(){
;POV_Wireless_Display.c,78 :: 		if (Prev_IR_State==0 && PORTE.RE0==1) {
	MOVF       _Prev_IR_State+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt8
	BTFSS      PORTE+0, 0
	GOTO       L_interrupt8
L__interrupt10:
;POV_Wireless_Display.c,80 :: 		Last_Pixel_Column_Count=Pixel_Column_Count; //Stores for control purposes
	MOVF       _Pixel_Column_Count+0, 0
	MOVWF      _Last_Pixel_Column_Count+0
;POV_Wireless_Display.c,81 :: 		Pixel_Column_Count=0; //Resets the column count
	CLRF       _Pixel_Column_Count+0
;POV_Wireless_Display.c,82 :: 		}
L_interrupt8:
;POV_Wireless_Display.c,84 :: 		if (ImgToShow==0) {
	MOVF       _ImgToShow+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt9
;POV_Wireless_Display.c,85 :: 		PORTA=WORLDA[Pixel_Column_Count];
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
;POV_Wireless_Display.c,86 :: 		PORTB=WORLDB[Pixel_Column_Count];
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
;POV_Wireless_Display.c,87 :: 		PORTC=WORLDC[Pixel_Column_Count];
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
;POV_Wireless_Display.c,88 :: 		PORTD=WORLDD[Pixel_Column_Count];
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
;POV_Wireless_Display.c,94 :: 		} */
L_interrupt9:
;POV_Wireless_Display.c,96 :: 		Prev_IR_State=PORTE.RE0; //Updates the state of the IR detector
	MOVLW      0
	BTFSC      PORTE+0, 0
	MOVLW      1
	MOVWF      _Prev_IR_State+0
;POV_Wireless_Display.c,97 :: 		INTCON.T0IF=0; //Timer didn't overflow
	BCF        INTCON+0, 2
;POV_Wireless_Display.c,98 :: 		TMR0=Pixel_Column_Time;   //Sets the timer
	MOVF       _Pixel_Column_Time+0, 0
	MOVWF      TMR0+0
;POV_Wireless_Display.c,99 :: 		Pixel_Column_Count++; //Updates the pixel column count
	INCF       _Pixel_Column_Count+0, 1
;POV_Wireless_Display.c,100 :: 		}
L_end_interrupt:
L__interrupt14:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
