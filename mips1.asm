# Write the program for Exercise A7  given in Appendix A.: "Using MARS,
# write and test a MIPS assembly language program that reads in 3 integers
# and prints out the sum of the largest two of the three. Use the SPIM
# system calls described on pages A43-A45."
# This exercise requires you to use system services from those listed in
# Figure A.9.1 for input and output. The program should be short and will
# enable you to test the simulator.
	.data
int1:	1
int2:	2
int3:	3
str:	asciiz "Enter an interger: "
	.text
#exception handler
mov	$k1, $at
sw	$a0, save0
sw	$a1, save1
#############

#li	$v0, 4
#la	$a0, str
#syscall
li	$v0, 5
syscall
li	$v0, 5
syscall
li	$v0, 5
bgt 	
syscall
li	$v0, 1
la 	$a0, int1
syscall

li	$v0, 1
la 	$a0, int2
syscall

li	$v0,10
syscall