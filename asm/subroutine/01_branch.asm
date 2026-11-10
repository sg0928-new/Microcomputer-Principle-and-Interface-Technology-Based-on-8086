; ============================================================
; 01_branch.asm
; Purpose: signed if-else branch, output 'P' or 'N'
; ============================================================

DATA SEGMENT
    NUM DW -5
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    MOV AX, NUM
    CMP AX, 0
    JL  NEGATIVE
    MOV DL, 'P'         ; non-negative
    JMP SHOW
NEGATIVE:
    MOV DL, 'N'
SHOW:
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
