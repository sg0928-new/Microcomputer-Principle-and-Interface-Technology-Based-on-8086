; ============================================================
; 04_logical.asm
; Purpose: AND / OR / XOR / TEST bit operations
; Debug focus: AL value and ZF after TEST
; ============================================================

DATA SEGMENT
    VAL DB 0A5H
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    MOV AL, VAL
    AND AL, 0FH         ; keep low nibble -> 05H

    MOV AL, VAL
    OR  AL, 80H         ; set highest bit

    MOV AL, VAL
    XOR AL, 0FFH        ; invert all bits

    MOV AL, VAL
    TEST AL, 01H        ; test bit 0; ZF reflects result
    JZ  BIT_ZERO        ; jump if bit is 0
    JMP DONE
BIT_ZERO:
    NOP
DONE:
    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
