        .globl Lab03b

Lab03b:
        ADRP X0, UIN
        ADD X0, X0, :lo12:UIN // X0 = UIN                                                                                                                                                                   
        MOV X1, #10 // X1 = 10                                                                                                                                                                              
        LDUR X2, [X0, #0] // load X2 with UIN                                                                                                                                                               

loop:

        CBZ X1, end // if X1 = 0, brench to end                                                                                                                                                             
        SUB X2, X2, #1
        SUB X1, X1, #1
        B loop

end:
        STUR X2, [X0, #0]
        BR X30

 .section       .data
        UIN:     .word  32 // which will be the sum of all the digits of UIN 327003368 = 32     