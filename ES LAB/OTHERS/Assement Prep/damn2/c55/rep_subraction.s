	AREA RESET , DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10000000
	DCD Reset_Handler
	AREA MYCODE, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=N1
	LDR R1,=N2
	LDR R2,[R0]
	LDR R4,[R1]
	MOV R3,#0
	LDR R5,=QUO
UP  CMP R2,R4
	BCC ST
	SUB R2,R2,R4
	ADD R3,R3,#1
	B UP
ST STR R5,[R3]
STOP
	B STOP
N1 DCD 15
N2 DCD 5
	AREA MYDATA, DATA, READWRITE
QUO DCD 0
	END