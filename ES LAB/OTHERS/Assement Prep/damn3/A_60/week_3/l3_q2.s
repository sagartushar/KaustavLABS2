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
	LDR R0,=VAL1
	LDR R1,=VAL2
	LDR R2,[R0]
	LDR R3,[R1]
	LDR R4,=QUOTIENT
	LDR R5,=REMAINDER
	LDR R6,[R4]
	LDR R7,[R5]
UP	CMP R2,R3
	BCC ST
	SUB R2,R2,R3
	ADD R6,#1
	B UP
ST	STR R6,[R4]
	STR R2,[R5]
STOP
	B STOP
VAL1 DCD 18
VAL2 DCD 3
	AREA mydata,DATA,READWRITE
QUOTIENT DCD 0
REMAINDER DCD 0
	END