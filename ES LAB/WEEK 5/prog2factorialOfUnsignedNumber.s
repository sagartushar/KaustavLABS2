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
	LDR R0,=NUM
	LDR R1,=RESULT
	LDR R1,[R0]
	BL FACT
	STR R2,[R1]
HERE B HERE
FACT
	CMP R2,#0
	MOVEQ R2,#1
	BEQ L1
	PUSH {R2,LR}
	SUB R2,#1
	BL FACT	
L1
	POP {R3,LR}
	MUL R2,R3
	BX LR
STOP
	B STOP
	ALIGN
NUM DCD 3
	AREA mydata,DATA,READWRITE
RESULT DCD 0
	END