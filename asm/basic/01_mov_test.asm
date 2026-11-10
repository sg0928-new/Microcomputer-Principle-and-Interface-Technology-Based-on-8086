; ============================================================
; 01_mov_test.asm
; Purpose: basic MOV / register transfer test
; Debug focus: watch AX, BX, DS and memory with R / T / D
; Build: masm 01_mov_test.asm;  link 01_mov_test.obj;
; ============================================================

DATA SEGMENT
    SRC  DW 1234H
    DST  DW ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX          ; initialize data segment

    MOV AX, SRC         ; load word from memory
    MOV BX, AX          ; register to register
    MOV DST, BX         ; store word to memory

    MOV AH, 4CH
    INT 21H             ; return to DOS
CODE ENDS
END START
