 	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=RESULT
	MOV R1,#1
	MOV R2,#10
UP STR R1,[R0],#4
	ADD R1,#1
	SUBS R2,#1
	BNE UP
	
	LDR R0,=RESULT
	LDR R1,#36
	SUB R1,R1,#(OL-1)*4
	ADD R1,R0,#36
	ADD R0,#36

UP2
	LDR R3,[R0]
	STR R3,[R2]
	SUB R0,#4
	SUB R2,#4
	SUBS R5,#1
	BNE UP2

OL EQU 2
RESULT DCD 0
	
STOP
	B STOP
	END