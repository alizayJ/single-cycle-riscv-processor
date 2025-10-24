# single-cycle-riscv-processor

### The processor is designed for these instructions

```asm
      addi x9, x0, 9
      addi x5, x0, 5
      sw    x5, -4(x9)   
L1: lw x6, -4  (x9)
       sw x6, 8  (x9)
       or  x4, x5, x6
       beq x4, x4, L1
```
