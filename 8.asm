.MODEL SMALL
.STACK 100H
.DATA
VAR1 DB ?
VAR2 DB ?
RESULT DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    MOV VAR1,AL
    SUB VAR1,30H    ;CONVERTING ASCII CHARACTER TO NUMERIC VALUE
    
    INT 21H
    MOV VAR2,AL
    SUB VAR2,30H    ;CONVERTING ASCII CHARACTER TO NUMERIC VALUE
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    ;ADDING THEM UP
    MOV BL,VAR1     ; BL = VAR1
    ADD BL,VAR2     ; BL = BL + VAR1
    MOV RESULT,BL  
    ADD RESULT,30H  ;CONVERTING NUMERIC VALUE TO ASCII
    
    MOV AH,2
    MOV DL,RESULT
    INT 21H
        
    MOV AH,4CH
    INT 21H    
MAIN ENDP
    END MAIN