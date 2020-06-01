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
	LDR R0, =NUM
	LDR R1, [R0] ; R1 CONTAINS THE NUMBER
	MOV R2, #0 ;R2 CONTAINS SUM
	MOV R3, R1 ;R3 CONTAINS NUM
	MOV R4, #0X0A
	LDR R9, =DST
UP	
	CMP R3, R4
	BCC EXIT
	MOV R5, #0 ;CONTAINS QUOTIENT
UP1
	CMP R3, R4
	BCC EX1
	SUB R3, R3, R4
	ADD R5, #1
	B UP1
EX1	
	MOV R6, #0
	MUL R6, R3, R3 ; R6 = R3^2
	MUL R6, R6, R3 ; R6 = R3 ^3
	MOV R3, R5 ; R3 = QUOTIENT
	ADD R2, R2, R6
	B UP
	
EXIT
	MOV R6, #0
	MUL R6, R3, R3
	MUL R6, R6, R3
	ADD R2, R2, R6
	CMP R2, R1
	BEQ OP1
	MOV R8, #0XAA
	STR R8, [R9]
	B STOP
OP1	MOV R8, #0XFF
	STR R8, [R9]
STOP 	B STOP
NUM DCD 153
	AREA mydata, DATA, READWRITE
DST DCD 0
	END