Array: .word 4,3,2,1
.global _start
_start:
	MOV R0,#4
	LDR R1, =Array
	BL BSORT
	B _end
BSORT:
	SUB R0,R0,#1 //R0 = i
	MOV R3,#0 // R3 = j
FOR:
	MOV R3,#0 // R3 = j = 0
	SUB R7,R0,#1 // R7 = i-1
	MOV R8,#0
	FOR2:
	  CMP R3,R7 // j > i-1
	  BGT DONE // acaba bucle
	  LDR R4,[R1,R3,LSL #2] //r4 = r1[j]
	  ADD R6,R3,#1 // r6 = j +1
	  LDR R5,[R1,R6,LSL #2] // r5 = r1[r6=j+1]
	  CMP R4,R5 // r1[j] > r1[j+1]
	  STRGT R4,[R1,R6,LSL #2]  
	  STRGT R5,[R1,R3,LSL #2]
	  ADDGT R8,R8,#1
	  ADD R3,R3,#1
	  B FOR2
	DONE:
	CMP R8,#0
	MOVEQ PC,LR
	SUBS R0,R0,#1
	BPL FOR
MOV PC,LR