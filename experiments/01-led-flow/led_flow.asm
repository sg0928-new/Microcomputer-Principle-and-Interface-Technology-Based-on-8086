; ============================================================
; led_flow.asm
; Experiment 01: LED flowing light via 8255A Port A
; Hardware: 8255A PA0..PA7 -> 8 LEDs (active high)
; Ports:    300H PA, 301H PB, 302H PC, 303H Control
; 8255 control word: 80H (all ports mode 0 output)
; ============================================================

CODE SEGMENT
ASSUME CS:CODE
START:
    ; initialize 8255A
    MOV DX, 303H
    MOV AL, 80H
    OUT DX, AL

    MOV AL, 01H             ; light first LED
LOOP1:
    MOV DX, 300H
    OUT DX, AL              ; output to Port A
    CALL DELAY
    ROL AL, 1               ; rotate left, next LED
    JMP LOOP1

; software delay
DELAY PROC
    PUSH CX
    MOV CX, 0FFFFH
D1: LOOP D1
    POP CX
    RET
DELAY ENDP
CODE ENDS
END START
