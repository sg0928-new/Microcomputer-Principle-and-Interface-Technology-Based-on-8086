; ============================================================
; piano.asm
; Experiment 05: electronic piano using 8253 timer
; 8253 counter 2 mode 3 square wave drives speaker
; Ports: 304H CT0 ... 307H control. Speaker gated via PB.
; Keys 1..8 select different notes.
; ============================================================

DATA SEGMENT
    ; timer count values for 8 notes (example table)
    NOTES DW 4560,4063,3619,3418,3043,2711,2415,2280
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    ; 8253 CT2 mode3, word access: 10110110B = B6H
    MOV DX, 307H
    MOV AL, 0B6H
    OUT DX, AL

MAIN:
    MOV AH, 01H
    INT 21H                 ; wait for key
    CMP AL, '1'
    JB  MAIN
    CMP AL, '8'
    JA  MAIN

    SUB AL, '1'
    XOR AH, AH
    MOV SI, AX
    ADD SI, AX              ; word index
    MOV AX, NOTES[SI]

    MOV DX, 306H
    OUT DX, AL
    MOV AL, AH
    OUT DX, AL              ; load CT2 count -> note plays

    CALL GATE_ON
    JMP MAIN

GATE_ON PROC
    MOV DX, 301H
    IN  AL, DX
    OR  AL, 03H
    OUT DX, AL              ; enable speaker gate
    RET
GATE_ON ENDP
CODE ENDS
END START
