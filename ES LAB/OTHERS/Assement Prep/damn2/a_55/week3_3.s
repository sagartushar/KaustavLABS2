	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10000000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=NUM
	LDR R4,=RESULT
	LDR R1,[R0]
	MLA R2,R1,R1,R1
	LSR R2,#1
	STR R2,[R4]
STOP
	B STOP
NUM DCD 10
	AREA mydata,DATA,READWRITE
RESULT DCD 0
	END