; ============================================================
; traffic_light.asm
; Experiment 02: traffic light control via 8255A
; Hardware: PA0..PA2 -> red/yellow/green of direction A
;           PA3..PA5 -> red/yellow/green of direction B
; Port: 300H PA, 303H control. Control word 80H.
; ============================================================

CODE SEGMENT
ASSUME CS:CODE
START:
    MOV DX, 303H
    MOV AL, 80H
    OUT DX, AL

MAIN:
    ; phase 1: A green, B red
    MOV AL, 00010001B          ; PA4 green A + PA0 red B
    MOV DX, 300H
    OUT DX, AL
    CALL LONG_DELAY

    ; phase 2: A yellow, B red
    MOV AL, 00001001B
    OUT DX, AL
    CALL SHORT_DELAY

    ; phase 3: A red, B green
    MOV AL, 00100010B
    OUT DX, AL
    CALL LONG_DELAY

    ; phase 4: A red, B yellow
    MOV AL, 00100100B
    OUT DX, AL
    CALL SHORT_DELAY

    JMP MAIN

LONG_DELAY PROC
    PUSH CX
    MOV CX, 0FFFFH
L1: LOOP L1
    POP CX
    RET
LONG_DELAY ENDP

SHORT_DELAY PROC
    PUSH CX
    MOV CX, 4000H
S1: LOOP S1
    POP CX
    RET
SHORT_DELAY ENDP
CODE ENDS
END START
