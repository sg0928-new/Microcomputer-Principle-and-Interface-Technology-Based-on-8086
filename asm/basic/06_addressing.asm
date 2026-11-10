; ============================================================
; 06_addressing.asm
; Purpose: practise all memory addressing modes
; Debug focus: effective address and data with D command
; ============================================================

DATA SEGMENT
    TBL  DW 10H, 20H, 30H, 40H
    ARR  DB 4 DUP(0)
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    ; direct addressing
    MOV AX, TBL

    ; register indirect
    LEA BX, TBL
    MOV AX, [BX]

    ; based addressing with displacement
    MOV AX, 2[BX]       ; second word

    ; indexed addressing
    LEA SI, TBL
    MOV AX, [SI+4]      ; third word

    ; based-indexed addressing
    LEA BX, TBL
    XOR SI, SI
    MOV AX, [BX+SI]

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
