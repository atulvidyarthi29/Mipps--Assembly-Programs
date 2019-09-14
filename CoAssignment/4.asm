.data
mssg1: .asciiz "Enter 2 numbers\n"
mssg2: .asciiz "GCD: "

.text
	la $a0,mssg1
	li $v0,4
	syscall

	li $v0,5
	syscall
	
	move $t0,$v0
	li $v0,5
	syscall
	
	move $t1,$v0
	
loop:
	beq $t0,$zero, endloop              
	rem $t7,$t1,$t0                     
	move $t1,$t0
	move $t0,$t7
	j loop 
	
endloop:
	la $a0,mssg2
	li $v0,4
	syscall
	
	move $a0,$t1
	li $v0,1                
	syscall
		
	
