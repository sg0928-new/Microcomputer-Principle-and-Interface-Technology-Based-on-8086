; ============================================================
; ext_interrupt.asm
; Experiment 06: external interrupt via 8259A
; Each external pulse triggers IRQ; ISR toggles LED state.
; 8259 ports: 20H/21H. LED on 8255 PA (300H, control 303H).
; ============================================================

DATA SEGMENT
    OLD_IP  DW ?
    OLD_CS  DW ?
    LED_STA DB 00H
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    ; save old vector of IRQ type 0AH
    MOV AL, 0AH
    MOV AH, 35H
    INT 21H
    MOV OLD_IP, BX
    MOV OLD_CS, ES

    ; set new vector
    PUSH DS
    MOV AX, SEG MY_ISR
    MOV DS, AX
    LEA DX, MY_ISR
    MOV AL, 0AH
    MOV AH, 25H
    INT 21H
    POP DS

    ; init 8255 PA output
    MOV DX, 303H
    MOV AL, 80H
    OUT DX, AL

    ; unmask IRQ2
    IN  AL, 21H
    AND AL, 0FBH
    OUT 21H, AL

    STI                     ; enable interrupts
WAIT_LOOP:
    HLT
    JMP WAIT_LOOP

MY_ISR PROC FAR
    PUSH AX
    PUSH DX
    MOV AL, LED_STA
    NOT AL
    MOV LED_STA, AL
    MOV DX, 300H
    OUT DX, AL             ; toggle LED
    MOV AL, 20H
    OUT 20H, AL            ; send EOI to 8259
    POP DX
    POP AX
    IRET
MY_ISR ENDP
CODE ENDS
END START
