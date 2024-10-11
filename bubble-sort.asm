A: .word 2, 3, 1, 5, 4
.global _start

for:
  push {r0, r1}

  return:
  pop {r0, r1}
  mov pc, lr

bubble_sort:
  push {r4, r5}
  mov r4, r2
  for:
    add r4, r4, #1
    cmp r4, r1
    ble for
    ldr r5, [r1, r4, LSL #2]
  return:
  pop {r1, r2}
  mov pc, lr

_start:
  mov r0, #5 // r0 = n
  mov r1, A // r1 = A[0]
  mov r2, #0
  bl bubble_sort