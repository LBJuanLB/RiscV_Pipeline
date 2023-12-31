# SPIM:  a MIPS simulator

To try the code generated by the compiler without the need of hardware we can use [SPIM](http://spimsimulator.sourceforge.net/). To install the simulator run:

```shell
sudo apt-get install spim
```

Consider the following Kaleidoscope program saved in `arith.kl`:
```python
7 + 5
```

The compiler will produce the following assembler code in the file `arith.mips`:

```asm
    .text
    .globl main

main:
    li $a0 7
    sw $a0 0($sp)
    addiu $sp $sp-4
    li $a0 5
    lw $t1 4($sp)
    add $a0 $a0 $t1
    addiu $sp $sp 4
```

To execute the code in the simulator execute:
```shell
$ spim
(spim) load "arith.mips"
(spim) run
(spim) print $a0
    Reg 4 = 0x0000000c (12)
(spim) exit
$
```

The program performs the addition fo 7 and 5 and leaves the result in the accumulator register also called $a0. Instead of printing just one register you can print all of them using the `print_all_regs` command.

## Useful links
- http://pages.cs.wisc.edu/~larus/spim.pdf