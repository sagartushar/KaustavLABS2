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
	LDR R0,=SRC
	ADD R1,R0,#36
	MOV R4,#5
LOOP	LDR R3,[R0]
		LDR R2,[R1]
		STR R3,[R1]
		STR R2,[R0]
		ADD R0,R0,#4
		SUB R1,R1,#4
		SUBS R4,#1
		BNE LOOP
STOP
	B STOP
	AREA mydata,DATA,READWRITE
SRC DCD 0
DST DCD 0
	END