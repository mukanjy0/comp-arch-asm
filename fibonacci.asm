.global _start

FIBONACCI:
STR R1, [SP,#-4]!
STR R2, [SP,#-4]!
STR R3, [SP,#-4]!
STR R4, [SP,#-4]! // aux

MOV R1, #1 // minus 1
MOV R2, #0 // minus 2
MOV R3, #2 // counter
WHILE:
	CMP R3, R0
	BGE RETURN
	ADD R3, R3, #1
	MOV R4, R2
	MOV R2, R1
	ADD R1, R2, R4
	B WHILE

RETURN:
ADD R12, R1, R2
LDR R4, [SP], #4
LDR R3, [SP], #4
LDR R2, [SP], #4
LDR R1, [SP], #4
MOV PC, LR

_start:
MOV R0, #7 // r0 = n
MOV R12, #0 // answer (return value)
BL FIBONACCI