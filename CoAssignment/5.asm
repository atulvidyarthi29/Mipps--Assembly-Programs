.data
mssg1: .asciiz "Enter the Size of array : "
mssg2: .asciiz "Enter  the numbers: \n"
mssg3: .asciiz "Prime numbers :\n"
mssg4: .asciiz "\n"

.text	
	li $v0,4
	la $a0,mssg1
	syscall

	li $v0,5
	syscall 
	
	move $s0,$v0
	mul $s0,$s0,4
	li $v0, 4
	la $a0,mssg2
	syscall
	
	move $a0,$s0
	li $v0,9                     
	syscall
	
	move $s1,$v0
	add $t7,$zero,$s1
	move $t6,$zero	
mark1:
	bge $t6,$s0,mark2
	li $v0, 5
	syscall
	
	sw $v0, ($t7)            
	addi $t7,$t7,4
	addi $t6,$t6,4
	j mark1
mark2:
	la $a0,mssg3
	li $v0,4
	syscall
	
	move $t7,$s1
	move $t6,$zero
mark3:
	bge $t6,$s0,mark5
	lw $t0,($t7)    
	j mark4
mark7:
	addi $t7,$t7,4
	addi $t6,$t6,4
	j mark3
mark4:
	move $t1,$t0
	sub $t1, $t1,1
mark8:                       
	beq $t1,1,mark9
	beq $t1,$zero,mark6
	rem $t2,$t0,$t1	
	beqz $t2 , mark6
	sub $t1,$t1,1
	j mark8                              
mark9:
	move $a0,$t0
	li $v0,1
	syscall
	
	la $a0,mssg4
	li $v0,4
	syscall
	
	j mark7	           
mark6:
	j mark7
mark5:
