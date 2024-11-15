.global _start
_start:
	
mov r0, #0x40000 // r0 = a[0]
mov r1, #6 // r1 = n
bl Carray
bl Quicksort

Carray:
  push {r2, r3}
  mov r2, #0
  
  mov r3, #34
  str r3, [r0, r2, lsl #2]
  add r2, r2, #1
  
  mov r3, #7
  str r3, [r0, r2, lsl #2]
  add r2, r2, #1
  
  
  mov r3, #23
  str r3, [r0, r2, lsl #2]
  add r2, r2, #1
  
  
  mov r3, #32
  str r3, [r0, r2, lsl #2]
  add r2, r2, #1
  
  
  mov r3, #5
  str r3, [r0, r2, lsl #2]
  add r2, r2, #1
  
  mov r3, #62
  str r3, [r0, r2, lsl #2]
  add r2, r2, #1
  
  pop {r2, r3}
  mov pc, lr
  

Quicksort:
  push {r0, r1, r4, r5, r6, r7, r8, r9, lr}
  cmp r1, #1
  ble return
  
  mov r4, r1, lsr #1 // r4 = p = n/2
  ldr r5, [r0, r4, lsl #2] // r5 = A[p]
  
  mov r6, #0 // r6 = l = 0 (2-pointers)
  sub r8, r1, #1 // r8 = r = n - 1 (2-pointers)
  
  
  while:
    for1:
	  cmp r6, r8
	  beq out
	  
  	  ldr r7, [r0, r6, lsl #2] // r7 = A[l]
	  cmp r7, r5
	  bge for2
	  add r6, r6, #1
	  b for1
	
	for2:
	  cmp r6, r8
	  beq out
	  
  	  ldr r9, [r0, r8, lsl #2] // r9 = A[r]
	  cmp r9, r5
	  ble out
	  sub r8, r8, #1
	  b for2
	out:
	
    cmp r6, r8
    strne r7, [r0, r8, lsl #2]
    strne r9, [r0, r6, lsl #2]
	
	blt while
  
  mov r8, r1
  mov r1, r6
  bl Quicksort
  
  add r0, r6, lsl #2
  sub r1, r8, r6
  bl Quicksort
  
  return:
  pop {r0, r1, r4, r5, r6, r7, r8, r9, lr}
  mov pc, lr
  