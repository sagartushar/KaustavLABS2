	AREA RESET,DATA,READONLY
	EXPORT __Vectors1
__Vectors1
	DCD 0x10001000
	DCD Reset_Handler1
	AREA mycode2,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler1
Reset_Handler1
		MOV R0,#10
		MOV R1,#30
		MOV R2,R1
		MOV R1,R0
		MOV R0,R2
	END