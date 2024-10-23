.global _start
_start:
	
// r0 = baseaddress
// r1 = size
// r2 = i / head

mov r0, #0x40000
mov r1, #5
bl Carray
bl Heapsorter

Carray:
  push {r2, r3}
  mov r2, #0
  
  mov r3, #4
  str r3, [r0, r2, lsl #2]
  add r2, r2, #1
  
  mov r3, #6
  str r3, [r0, r2, lsl #2]
  add r2, r2, #1
  
  
  mov r3, #3
  str r3, [r0, r2, lsl #2]
  add r2, r2, #1
  
  
  mov r3, #2
  str r3, [r0, r2, lsl #2]
  add r2, r2, #1
  
  
  mov r3, #9
  str r3, [r0, r2, lsl #2]
  add r2, r2, #1
  
  pop {r2, r3}
  mov pc, lr
  
Heapsorter:
  push {r0, r1, lr}
  for1:
	bl Minarray
	add r0, r0, #4
    sub r1, r1, #1
	cmp r1, #0
	bgt for1
  pop {r0, r1, lr}
  mov pc, lr
  
Minarray:
  push {r2, lr} // for iterator
  mov r2, r1
  sub r2, r2, #1
  for2:
	bl Heap3
    subs r2, r2, #1
	bpl for2
  pop {r2, lr}
  mov pc, lr
  
Heap3:
  // initialize
  push {r3, r4, r5}
  mov r3, r2 // set minimum pos
  
  // validate space
  mov r4, r2, lsl #1
  add r4, r4, #1
  cmp r4, r1
  bge return
  
  // left
  push {r6, r7}
  ldr r6, [r0, r3, lsl #2]
  ldr r7, [r0, r4, lsl #2]
  cmp r7, r6
  movlt r3, r4 // update minimum pos if a[left]<a[min]
  pop {r6, r7}
  
  // validate space
  mov r5, r2, lsl #1
  add r5, r5, #2
  cmp r5, r1
  bge return
  
  // right
  push {r6, r7}
  ldr r6, [r0, r3, lsl #2]
  ldr r7, [r0, r5, lsl #2]
  cmp r7, r6
  movlt r3, r5 // update minimum pos if a[right]<a[min]
  pop {r6, r7}
  
  // swap
  cmp r2, r3
  beq return
  ldr r4, [r0, r2, lsl #2]
  ldr r5, [r0, r3, lsl #2]
  str r4, [r0, r3, lsl #2]
  str r5, [r0, r2, lsl #2]
  
  return:
  pop {r3, r4, r5}
  mov pc, lr