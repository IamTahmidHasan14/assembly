.MODEL SMALL
.STACK 100H
.DATA
NL EQU 0DH,0AH
MSG DB "Enter the first two digit number: $"
MSG1 DB NL,"Enter the second two digit number: $"
MSG2 DB NL,"The added value is: $"
DIGIT1 DB ?
DIGIT2 DB ?
NUM1 DB ?
NUM2 DB ?
RESULT DB ?
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;FIRST NUMBER
    MOV AH,9
    LEA DX,MSG
    INT 21H
 
    MOV AH,1
    INT 21H
    MOV DIGIT1,AL
    SUB DIGIT1,30H
    INT 21H
    MOV DIGIT2,AL
    SUB DIGIT2,30H
    
    MOV AL,10   
    MUL DIGIT1  ;AL = 10*DIGIT1 
    MOV BL,AL
    ADD BL,DIGIT2 ; BL HAS THE FIRST NUMBER
    
    MOV NUM1,BL
    
    ;SECOND NUMBER
    MOV AH,9
    LEA DX,MSG1
    INT 21H
 
    MOV AH,1
    INT 21H
    MOV DIGIT1,AL
    SUB DIGIT1,30H
    INT 21H
    MOV DIGIT2,AL
    SUB DIGIT2,30H
    
    MOV AL,10   
    MUL DIGIT1  ;10*DIGIT1 
    MOV BL,AL
    ADD BL,DIGIT2 ; BL HAS THE FIRST NUMBER
    
    MOV NUM2,BL
    
    ;NOW ADD THEM UP
    MOV BL,NUM1
    ADD BL,NUM2
    MOV RESULT,BL
    
    MOV AL,RESULT
    CBW 
    MOV BL,10
    DIV BL      ; RESULT/10 = AL(DIGIT1), AH(DIGIT2)
    MOV DIGIT1,AL
    ADD DIGIT1,30H
    MOV DIGIT2,AH
    ADD DIGIT2,30H
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    MOV AH,2
    MOV DL,DIGIT1
    INT 21H
    MOV DL,DIGIT2
    INT 21H
    
    MOV AH,4CH
    INT 21H        
MAIN ENDP
    END MAIN