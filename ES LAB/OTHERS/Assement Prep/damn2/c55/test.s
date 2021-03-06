	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000   
	DCD Reset_Handler
	AREA MYCODE, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=IN
	LDR R1,=OUT
	LDR R2,[R0]
	MOV R3,#0X0000000F
	MOV R4,#0XF0000000
	MOV R5,#4
	MOV R9,#28
UP  AND R6,R2,R3
    AND R7,R2,R4
	LSR R7,R9
	CMP R6,R7
	LSL R3,#4
	LSR R4,#4
	BNE LAST
	SUBS R5,#1
	SUB R9,R9,#8
	BNE UP
	MOV R8,#0XFF
	STR R8,[R1]
STOP
	B STOP
LAST MOV R8,#0XAA
	STR R8,[R1]

	
IN DCD 0XDCBACDCD
	AREA mydata,DATA,READWRITE
OUT DCD 0
	END