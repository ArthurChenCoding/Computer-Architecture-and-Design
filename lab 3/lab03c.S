        .section .text
        .globl lab03c

lab03c:
        ADRP X4, my_array
        ADD X4, X4, :lo12:my_array // X4 = my_array, which is the base address                                                                                                                              
        MOV X1, XZR // X1 = 0 and used as i                                                                                                                                                                 
        MOV X2, #3 // X2 = 3, the first digit of my UIN                                                                                                                                                     
        MOV X10, X4 // X10 = X4, making a copy                                                                                                                                                              

loop:
        SUB X11, X1, #10
        CBZ X11, end // using two lines above to check if X1 reaches 10                                                                                                                                     

        LSL X9, X1, #3 // shift left 3 digits since every word is 8 bytes                                                                                                                                   
        ADD X10, X4, X9 // add X9 to base address,                                                                                                                                                          
        STUR X2, [X10, #0] // store j to my_array[i]                                                                                                                                                        
        ADD X2, X2, #1 // j++                                                                                                                                                                               
        ADD X1, X1, #1 // i++                                                                                                                                                                               
        B loop // loop again                                                                                                                                                                                

end:
        BR X30

        .section        .data
        my_array: .space 40
