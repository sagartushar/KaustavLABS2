    AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
    MOV R0,#0x0807
	LDR R1,=RES
	MOV R2,#0x0000000F
	MOV R3,#0
	MOV R4,#2
UP
    AND R5,R0,R2
	LSL R2,#4
	LSR R0,#4
	ADD R3,R5
	SUBS R4,#1
	BNE UP
	STR R3,[R1]
STOP
    B STOP
	AREA mc,DATA,READWRITE
RES DCD 0
	END