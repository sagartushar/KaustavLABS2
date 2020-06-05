	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10000000
	DCD Reset_Handler  
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=NU
	LDR R1,=DE
	LDR R2,[R0]
	LDR R3,[R1]
	MOV R4,#0
	LDR R5,=QU
	LDR R6,=RE
LOOP
	CMP R2,R3
	BCC ST
	SUB R2,R2,R3
	ADD R4,#1
	B LOOP
ST  STR R4,[R5]
	STR R2,[R6]
STOP
	B STOP
NU DCD 0x00000009
DE DCD 0x00000003
	AREA mydata,DATA,READWRITE
QU DCD 0
RE DCD 0
	END