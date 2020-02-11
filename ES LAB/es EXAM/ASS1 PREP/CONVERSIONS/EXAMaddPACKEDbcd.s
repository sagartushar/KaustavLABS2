	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X40001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=NUM1
	LDR R1,[R0]
	LDR R0,=NUM2
	LDR R2,[R0]
	MOV R3,#0
	MOV R4,#8
	MOV R8,#0X0F
	LDR R9,=SUM
LOOP	AND R5,R1,R8
		AND R6,R2,R8
		LSR R1,R1,#4
		LSR R2,R2,#4
		ADD R7,R6,R5
		ADD R7,R7,R3
		CMP R7,#0XA
		SUBCS R7,R7,#0XA
		MOVCS R3,#1
		MOVCC R3,#0
		STRB R7,[R9],#1
		SUBS R4,R4,#1
		BNE LOOP
	LDR R0,=SUM
	MOV R1,#0
	MOV R2,#8
	LDR R3,=PACK
LOOP1	LDRB R4,[R0],#1
		LSL R1,R1,#4
		ORR R1,R1,R4
		SUBS R2,R2,#1
		BNE LOOP1
	STR R1,[R3]
STOP
	B STOP
NUM1 DCD 0X00004092
NUM2 DCD 0X00000006
	AREA mydata,DATA,READWRITE
SUM DCD 0
PACK DCD 0
	END