	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
		DCD 0X10001000
		DCD Reset_Handler
	AREA transfer, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	LDR R0,=SRC
	MOV R1,R0
	ADD R1,#(SIZE-1)*4
	MOV R2,#10
LOOP
	STR R2,[R0],#4
	SUBS R2,R2,#1
	BNE LOOP
	SUB R0,R0,#4
	ADD R1,R1,#OL*4
	ADD R2,R2,#10
TFS
	LDR R3,[R0],#-4
	STR R3,[R1],#-4
	SUBS R2,R2,#1
	BNE TFS
STOP
		B STOP
SIZE EQU 10
OL EQU 5
	AREA mydata,DATA,READWRITE
SRC DCD 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	END