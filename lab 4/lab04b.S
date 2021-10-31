       .globl lab04b

lab04b:
        SUB SP, SP, #32 // move SP down for allocation                                               
        STUR X1, [SP, #16] // use stack to perserve X1 and X30                                       
        STUR X30, [SP, #0]
        CBNZ X0, ELSE // if X0 is 0                                                                  
        ORR X0, XZR, #1 // assign X0 with one                                                        
        B FINAL // then return                                                                       

ELSE:// if have not yet reach to deepest stack,                                                      
        ADD X1, X0, XZR // assign X1 with X0                                                         
        SUB X0, X0, #1 // then decrement X0 by 1 for the next iteration                              
        BL lab04b // go to deeper stack                                                              
        BL my_mul // perform mul                                                                     


FINAL:
        // move values on stack to saved registers before poping                                     
        LDUR X30, [SP, #0]
        LDUR X1, [SP, #16]
        ADD SP, SP, #32 // restore SP                                                                
        BR X30 // then return