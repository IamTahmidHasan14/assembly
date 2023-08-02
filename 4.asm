.MODEL SMALL
.STACK 100H
.DATA
NL EQU 0DH,0AH
MSG DB "Enter two numbers respectively: $"
MSG1 DB NL,"First number is greater!$"
MSG2 DB NL,"Second number is greater!$"
MSG3 DB NL,"Both are equal!$"
NUM1 DB ?
NUM2 DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV NUM1,AL
    
    INT 21H
    MOV NUM2,AL
    
    MOV BL,NUM1
    
    CMP BL,NUM2 ; NUM1>NUM2?   
    JG GREATER  ; JG=JUMP IF GREATER
    JL LESS     ; JL=JUMP IF LESS
    JE EQUAL    ; JE=JUMP IF EQUAL
    
GREATER:
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    JMP EXIT    ;JMP = UNCONDITIONAL JUMP
    
LESS:
    MOV AH,9
    LEA DX,MSG2
    INT 21H    
    JMP EXIT
    
EQUAL:
    MOV AH,9
    LEA DX,MSG3
    INT 21H

EXIT:        
    MOV AH,4CH
    INT 21H        
MAIN ENDP
    END MAIN