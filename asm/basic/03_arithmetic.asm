; ============================================================
; 03_arithmetic.asm
; Purpose: SUB / CMP / MUL / DIV and signed extension
; Debug focus: AX, DX after MUL and DIV
; ============================================================

DATA SEGMENT
    A   DW 0064H        ; 100
    B   DW 0005H        ; 5
    Q   DW ?
    R   DW ?
    P   DW ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    ; unsigned division 100 / 5
    MOV AX, A
    XOR DX, DX
    DIV B               ; AX = quotient, DX = remainder
    MOV Q, AX
    MOV R, DX

    ; unsigned multiplication 100 * 5
    MOV AX, A
    MUL B               ; result in DX:AX
    MOV P, AX

    ; compare
    MOV AX, A
    CMP AX, B           ; flags only, no result stored

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
