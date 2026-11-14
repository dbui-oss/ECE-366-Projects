#Course : ECE 366 - Computer Organization (Fall 2026) 
#Assignment : Project 2 - Progress Report 2 : (IsOdd)

.text 
.globl main 

main:
	li $a0, 8 
	jal IsOdd
	move $t4, $v0
	li $v0, 10
	syscall 
	
IsOdd:
	move $t3, $ra 
	li $a1, 2
	jal div_check
	move $ra, $t3
	beq $v0, $zero, even
	li $v0, 1
	jr $ra
	
even: 
	li $v0, 0
	jr $ra
	
	
div_check:
	move $t0, $a0
	li $t1, 0
	
loop:
	blt $t0, $a1, end
	sub $t0, $t0, $a1
	addi $t1, $t1, 1
	j loop
	
end:
	move $v0, $t0
	jr $ra