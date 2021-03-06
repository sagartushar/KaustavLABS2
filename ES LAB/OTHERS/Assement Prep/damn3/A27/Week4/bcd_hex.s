	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	AREA bcd_add,CODE,READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	LDR R0,=SRC
	LDR R1,[R0]
	LDR R0,=DST
	MOV R3,#1
	MOV R5,#0
	MOV R4,#10
	MOV R2,#0xF
LOOP
	AND R6,R1,R2
	MLA R5,R6,R3,R5
	MUL R3,R3,R4
	LSR R1,#4
	CMP R1,#0
	BNE LOOP
	STR R5,[R0]
STOP
	B STOP
SRC	DCD 0x33
	AREA mydata,DATA,READWRITE
DST DCD 0
	END