.section .text
.globl lab02d

lab02d:
       ADRP X5, myvalue // loads first 21 bits onto X5                                                                                                                                                      
        ADD X5,X5, :lo12:myvalue // loads last 12 bits onto X5                                                                                                                                              
        ADD X0, X0, #1000 // add 1000 to X0 where X0 is the value obtained from main                                                                                                                        
        STUR X0, [X5, #0] // store the value of X0 into the address of X5                                                                                                                                   
        MOV X0, X5
        BR X30

.section .data

myvalue:
.byte 16