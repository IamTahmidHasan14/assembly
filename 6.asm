.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
    MOV CX,10
    
    MOV AH,2
    MOV DL,'*'
    
PRINT:
    INT 21H
    DEC CX
    JNZ PRINT        ;JNZ  = JUMP IF NOT ZERO
    
    MOV AH,4CH
    INT 21H    
MAIN ENDP
    END MAIN