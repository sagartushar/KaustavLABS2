	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	ALIGN
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=NUM
	LDR R6,=RESULT
	LDR R1,[R0]
	MOV R2,#0
	MOV R4,#1
	MOV R5,#10
	
LOOP
	AND R3,R1,#0x0F
	MLA R2,R3,R4,R2
	LSRS R1,#4
	MUL R4,R4,R5
	BNE LOOP
	STR R2,[R6]
STOP
	B STOP
	ALIGN
NUM DCD 0x00065535
	AREA mydata,DATA,READWRITE
RESULT DCD 0
	END