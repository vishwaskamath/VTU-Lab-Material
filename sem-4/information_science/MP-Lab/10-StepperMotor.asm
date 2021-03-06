.MODEL SMALL
.DATA
    PORTC EQU 0E882H
    CR EQU 0E883H
    N EQU 05

.CODE
    MOV AX,@DATA
    MOV DS,AX
    MOV AL,80H
    MOV DX,CR
    OUT DX,AL
    MOV CX,N
    MOV AL,33H
    MOV DX,PORTC
BACKR:
    OUT DX,AL
    ROR AL,01H
    PUSH CX
    CALL DELAY
    POP CX
    LOOP BACKR
    MOV AH.4CH
    INT 21H

DELAY PROC
    MOV BX,0F000H
L1:
    MOV CX,00FFFH
L2:
    LOOP L2
    DEC BX
    JNZ LI
    RET
DELAY ENDP
END
