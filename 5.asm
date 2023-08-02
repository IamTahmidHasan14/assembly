.MODEL SMALL
.STACK 100H
.DATA
NL EQU 0DH,0AH
MSG DB "Enter your CT number: $"
CT DB ? 
MSG1 DB NL,"You have passed!" 
MSG2 DB NL,"You have failed!"

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    

EXIT:        
    MOV AH,4CH
    INT 21H        
MAIN ENDP
    END MAIN