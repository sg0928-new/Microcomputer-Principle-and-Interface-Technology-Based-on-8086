; ============================================================
; dynamic_display.asm
; Experiment 03: dynamic scanning of 4 common-cathode 7-seg
; Hardware: PA -> segment codes, PB -> digit select (4 bits)
; Ports: 300H PA, 301H PB, 303H control. Control word 80H.
; ============================================================

DATA SEGMENT
    ; common-cathode segment codes for 0..9
    SEGTAB DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H,7FH,6FH
    DISP   DB 1,2,3,4          ; four digits to display
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    MOV DX, 303H
    MOV AL, 80H
    OUT DX, AL

SCAN:
    MOV BX, 0
    MOV AH, 01H                ; digit select pattern
NEXT_DIGIT:
    MOV AL, DISP[BX]
    MOV SI, AX
    MOV AL, SEGTAB[SI]         ; segment code
    MOV DX, 300H
    OUT DX, AL                 ; output segments

    MOV AL, AH
    MOV DX, 301H
    OUT DX, AL                 ; select one digit

    CALL DELAY

    INC BX
    SHL AH, 1
    CMP BX, 4
    JNZ NEXT_DIGIT
    JMP SCAN

DELAY PROC
    PUSH CX
    MOV CX, 1000H
D1: LOOP D1
    POP CX
    RET
DELAY ENDP
CODE ENDS
END START
