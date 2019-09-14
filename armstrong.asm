.data
    prompt: .asciiz "Enter a Number:"
    msg3:   .asciiz "\nArmstrong number"
    msg4:   .asciiz "\nnot an Armstrong number"
.text
main:
    li $v0,4         #taking the input
    la $a0,prompt
    syscall
    
    li $v0,5
    syscall
    
    move $t0,$v0
    move $t7,$t0
    move $t1, $t0    #t0 and t1 and $t7 has the input number 
    addi $t3,$t3,0   #t3 loop variable

while:                 #counting the no. of digits
    beqz $t1,endloop
    div $t1,$t1,10
    addi $t3,$t3,1
    j while
    
endloop: 
   
for:                  #finding the sum of the digits raised to their (no. of digits)
   beqz $t0,end       #t0 has the input number
   rem $t1,$t0,10
   
   addi $t5,$zero,1   #calculating x raised to y
   move $t4,$zero  
   inloop:             
      beq $t4,$t3,exit
      mul $t5,$t5,$t1
      addi $t4,$t4,1
      j inloop
   exit:
   
   add $t6,$t6,$t5
   div $t0,$t0,10
   j for             
end:            
   beq $t6,$t7,print
   
   li $v0,4
   la $a0,msg4
   syscall
   
   j finalend

print:
   li $v0,4
   la $a0,msg3
   syscall
   
finalend:
