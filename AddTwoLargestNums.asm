.data
prompt1: .asciiz "\nEnter the first number: "
prompt2: .asciiz "Enter the second number: "
prompt3: .asciiz "Enter the third number: "
ans1: .asciiz "\nThe largest number is: "
ans2: .asciiz "\nSecond largest number is: "
sum: .asciiz "\nSum of largest two numbers is: "

.text
.globl main 
main:			# prints out the largest two of three numbers
			# input and adds them
li	$v0, 4 
la	$a0, prompt1 
syscall
li	$v0, 5		# read keyboard into $v0 
syscall
move	$t1,$v0		# first number in $t1

li	$v0, 4 
la	$a0, prompt2 
syscall
li	$v0, 5		# read keyboard into $v0
syscall 
move	$t2,$v0		# second number in $t2 

li	$v0, 4 
la	$a0, prompt3 
syscall 
li	$v0, 5		# read keyboard into $v0
syscall 
move	$t3,$v0		# third number in $t3

# three copies of $t2 to use with branch statements
move 	$t4, $t2
move	$t5, $t2
move	$t6, $t2

#------Greatest Number------
CMPG1:
bge	$t4, $t1, CMPG2 
move	$t4, $t1	# Of numbers in $t2 and $t1, greater in $t4
CMPG2:
bge	$t4, $t3, CMPL1
move	$t4, $t3	# Of all three nummbers, greatest in $t4

#------Lowest Number------(NON-ESSENTAIL)
CMPL1:
ble	$t5, $t1, CMPL2
move	$t5, $t1	# Of numbers in $t2 and $t1, lower in $t5
CMPL2:
ble	$t5, $t3, CMPM1
move	$t5, $t3	# Of all three nummbers, lowest in $t5

#------Middle Number------
CMPM1:
bge	$t6, $t1, CMPM2	# cmp t2 to t1
move	$t6, $t1 	# Of numbers in $t2 and $t1, greater in $t6

CMPM2:
ble	$t6, $t3, PNT1	# cmp t1/t2 to t3, 2nd greatest in $t6
move	$t6, $t3	# $t6 is greatest, copy t3 to t6

CMPM3:
bge	$t6, $t1, PNT1	# cmp t3/t2 to $t1, 2nd greatest in $t6
move	$t5, $t1	# t1 is greater, copy t1 to t5

CMPM4:
bge	$t3, $t2, M3	# 2nd largest in $t6
move	$t3, $t2	# 

M1:
move	$t6, $t5	# Copy middle number back to t6
j	PNT1

M3:
move	$t6, $t3	# Copy middle number back to t6


PNT1:
li	$v0, 4 # print answer 
la	$a0, ans1
syscall
li	$v0, 1 # print integer function call 1 
move	$a0, $t4 # integer to print 
syscall

PNT2:
li	$v0, 4 # print answer 
la	$a0, ans2
syscall
li	$v0, 1 # print integer function call 1 
move	$a0, $t6 # integer to print 
syscall

SUM1:
li	$v0, 4 # print sum
la	$a0, sum
syscall 
add	$t0, $t4, $t6
li $v0, 1 # print integer function call 1 
move $a0, $t0 # integer to print
syscall

end: jr $ra
