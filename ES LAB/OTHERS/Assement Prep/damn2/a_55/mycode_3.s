	AREA RESET,DATA,READONLY
	EXPORT __Vectors2
__Vectors2
	DCD 0x10001000
	DCD Reset_Handler2
	AREA mycode3,CODE,READONLY
	
	ENTRY
	EXPORT Reset_Handler2
	
		
Reset_Handler2
	LDR R0,=SRC
	LDR R2,=DST
	LDR R1,[R0]
	STR R1,[R2]
SRC DCD 0x3348
	AREA mydata,DATA,READWRITE
DST DCD 0
	END