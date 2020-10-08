	AREA CODE1, CODE, READONLY
ENTRY
	LDR R0, =INPUT
	LDRH R1, [R0]
	MOV R2, #0
	MOV R3, #0
	MOV R4, #16
REPEAT RORS R1, R1, #1; rotate by 1 bit and set flags
	ADDCS R3, R3, #1; if carry flag == 1 increase count
	ADDCC R2, R2, #1; if carry flag == 0 increase count
	SUB R4, R4, #1
	CMP R4, #0
	BNE REPEAT
	LDR R5, =ZCOUNT
	STR R2, [R5]
	LDR R5, =OCOUNT
	STR R3, [R5]
STOP B STOP
INPUT DCW 0X5678
	AREA DATA1, DATA, READWRITE
ZCOUNT DCD 0
OCOUNT DCD 0
	END