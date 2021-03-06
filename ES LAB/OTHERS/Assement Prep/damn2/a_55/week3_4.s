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
	LDR R0,=A
	LDR R1,=B
	LDR R2,[R0]
	LDR R3,[R1]
	LDR R4,=GCD
LOOP	
	CMP R2,R3
	BLT SKIP1
	BHI SKIP2
	BEQ STOP
SKIP1
	SUB R3,R3,R2
	B LOOP
SKIP2
	SUB R2,R2,R3
	B LOOP
STOP
	STR R2,[R4]
	B STOP
A DCD 12
B DCD 18
	AREA mydata,DATA,READWRITE
GCD DCD 0
	END