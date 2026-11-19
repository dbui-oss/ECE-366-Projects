#Course : ECE366 : Computer Organization (Fall 2026)
#Assignment : Project 2 Final report (IsFibonacciOdd)

.data
.align 2
n: .word 9
result: .word 0
.text
.globl main

main:
	la $t0, n
	lw $a0, 0($t0)
	jal FibonacciOddCheck	
	la $t1, result
	sw $v0, 0($t1)
	li $v0, 10
	syscall
	
	
FibonacciOddCheck:
	move $t8, $ra
	jal fibonacci
	move $a0, $v0
	jal IsOdd
	move $ra, $t8
	jr $ra
	
fibonacci:
	li $t2, 1
	ble $a0, $t2, base_case
	li $t3, 0
	li $t4, 1
	addi $t5, $a0, -1
	li $t6, 0
	
fib_loop:
	bge $t6, $t5, done
	move $t7, $t4
	add $t4, $t3, $t4
	move $t3, $t7
	addi $t6, $t6, 1
	j fib_loop
	
	
base_case:
	move $v0, $a0
	jr $ra
	
done: 
	move $v0, $t4
	jr $ra
	
IsOdd:
	move $t9, $ra
	li $a1, 2
	jal div_check
	move $ra, $t9
	beq $v0, $zero, even
	li $v0, 1
	jr $ra
	
even: 
	li $v0, 0
	jr $ra
	
div_check:
	move $t0, $a0
	li $t1, 0
	
div_loop:
	blt $t0, $a1, end_div
	sub $t0, $t0, $a1
	addi $t1, $t1, 1
	j div_loop
	
end_div:
	move $v0, $t0
	jr $ra