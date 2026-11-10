; ============================================================
; 02_add_flags.asm
; Purpose: observe flags (CF/ZF/SF/OF) after ADD
; Debug focus: single step T and read FLAGS with R
; ============================================================

DATA SEGMENT
    NUM1 DW 1234H
    NUM2 DW 0EDCCH      ; sum wraps and sets CF
    RES  DW ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    MOV AX, NUM1
    ADD AX, NUM2        ; affects CF, ZF, SF, OF, PF, AF
    MOV RES, AX

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
