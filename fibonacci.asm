.data 
    prompt: .asciiz "Enter n="
    ln: .asciiz ", "
.text

main:
   li $v0,4   # 4 is to print
   la $a0,prompt
   syscall
   
   li $v0,5
   syscall
   
   move $t0,$v0
   li $t1,-1
   li $t2,1
   
   loop:
   beqz $t0 ,endloop
   add $t3,$t2,$t1
   
   li $v0,1
   move $a0,$t3
   syscall
   
   li $v0,4
   la $a0,ln
   syscall
   
   move $t1,$t2
   move $t2,$t3
   li $t3,0
   addi $t0,$t0,-1
   j loop
   endloop:
   
   
   