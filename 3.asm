.MODEL SMALL
.STACK 100H
.DATA
NL EQU 0AH,0DH
MSG DB NL,"Enter any character: $"
MSG1 DB NL,"This is a upper case letter$"
MSG2 DB NL,"Converted case: $"
MSG3 DB NL,"This is a lower case letter$"
MSG4 DB NL,"This is a digit$"
MSG5 DB NL,"Invalid character!$"
CHAR DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

INPUT:    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CHAR,AL
    
    CMP CHAR,'a'
    JGE SMALL
    
    CMP CHAR,'A'
    JGE CAP     ; JGE = JUMP GREATER THAN OR EQUAL TO (>=)
    
    CMP CHAR,'0'
    JGE NUM
    
    JMP INVALID
    
CAP:
    CMP CHAR,'Z'
    JLE CAPFINAL ; ; JLE = JUMP LESS THAN OR EQUAL TO (<=)
    JMP INVALID
    
CAPFINAL:
    MOV AH,9
    LEA DX,MSG1
    INT 21H 
    
    ADD CHAR,20H
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H 
    
    MOV AH,2
    MOV DL,CHAR
    INT 21H 
    JMP EXIT
    
SMALL:
    CMP CHAR,'z'
    JLE SMALLFINAL
    JMP INVALID
    
SMALLFINAL:
    MOV AH,9
    LEA DX,MSG3
    INT 21H 
    
    SUB CHAR,20H
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H 
    
    MOV AH,2
    MOV DL,CHAR
    INT 21H
    JMP EXIT
             
NUM:
    CMP CHAR,'9'
    JLE NUMFINAL    
    JMP INVALID
    
NUMFINAL:
    MOV AH,9
    LEA DX,MSG4
    INT 21H 
    JMP EXIT
    
INVALID:
    MOV AH,9
    LEA DX,MSG5
    INT 21H
    JMP INPUT
        
EXIT:        
    MOV AH,4CH    
    INT 21H
MAIN ENDP
    END MAIN