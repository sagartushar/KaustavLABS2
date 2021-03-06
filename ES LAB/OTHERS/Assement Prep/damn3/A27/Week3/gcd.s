	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	AREA gcd,CODE,READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	MOV R0,#10
	MOV R1,#15
	MUL R3,R1,R0
LOOP
	CMP R0,R1
	BEQ EN
	BLO NEXT
	SUBS R0,R0,R1
	BNE LOOP
NEXT
	SUBS R1,R1,R0
	BNE LOOP
EN	MOV R2,R0
	LDR R0,=GCD
	LDR R1,=LCM
	STR R2,[R0]
	MOV R4,#0
LOOPI
	CMP R3,R2
	BCS SKIP
	MOV R5,R3
	B ENI
SKIP
	SUB R3,R3,R2
	ADD R4,R4,#1
	B LOOPI
ENI
	STR R4,[R1]
STOP
	B STOP
	AREA mydata,DATA,READWRITE
GCD	DCD 0
LCM	DCD 0
	END