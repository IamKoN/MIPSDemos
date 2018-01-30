.text 

.globl main 
main: # this program prints out the largest two of three numbers input 

li $v0, 4 
la $a0, prompt1 
syscall 

li $v0, 5 # read keyboard into $v0 (number x is number to test) 
syscall 
move $t1,$v0 # first number in $t1

li $v0, 4 
la $a0, prompt2 
syscall 

li $v0, 5 # read keyboard into $v0 (number x is number to test) 
syscall 
move $t2,$v0 # second number in $t2 

li $v0, 4 
la $a0, prompt3 
syscall 

li $v0, 5 # read keyboard into $v0 (number x is number to test) 
syscall 
move $t3,$v0 # third number in $t3


move 	$t4, $t2
move	$t5, $t2
move	$t6, $t2

#------Greatest Number------
CMPG1:
bge	$t4, $t1, CMPG2 
move	$t4, $t1 # larger number in $t2

CMPG2:
bge	$t4, $t3, CMPL1
move	$t4, $t3  # largest number in $t4

#------Lowest Number------
CMPL1:
ble	$t5, $t1, CMPL2
move	$t5, $t1	#lowest in $t5

CMPL2:
ble	$t5, $t3, CMPM1
move	$t5, $t3

#------Middle Number------
CMPM1:
bge	$t6, $t1, CMPM2
move	$t6, $t1	

CMPM2:
ble	$t6, $t3, L1 #2nd largest in $t6
move	$t6, $t3

CMPM3:
bge	$t6, $t1, L1 #2nd largest in $t6
move	$t5, $t1

bge	$t3, $t2, M3 #2nd largest in $t6
move	$t3, $t2

M1:
move	$t6, $t5
j	L1

M3:
move	$t6, $t3


L1:
li	$v0, 4 # print answer 
la	$a0, ans1
syscall
li	$v0, 1 # print integer function call 1 
move	$a0, $t4 # integer to print 
syscall

L2:
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

.data
prompt1: .asciiz "\nEnter the first number: "
prompt2: .asciiz "Enter the second number: "
prompt3: .asciiz "Enter the third number: "
ans1: .asciiz "\nThe largest number is: "
ans2: .asciiz "\nSecond largest number is: "
sum: .asciiz "\nSum of largest two numbers is: "