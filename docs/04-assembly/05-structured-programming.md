# 结构化程序设计

汇编同样支持三种基本结构：顺序、分支（选择）、循环，以及子程序（过程）。

---

## 一、顺序结构

指令按书写顺序依次执行，是最基本的结构。

```asm
MOV AX, A
ADD AX, B
MOV C, AX          ; C = A + B
```

---

## 二、分支结构

用 CMP/TEST 配合条件跳转实现。

### 1. 单分支（if）

```asm
CMP AX, 0
JGE SKIP           ; AX≥0 跳过
NEG AX             ; 否则取负
SKIP:
```

### 2. 双分支（if-else）

```asm
CMP AX, BX
JGE  ELSE_BRANCH
MOV  CX, 1         ; 条件成立分支
JMP  END_IF
ELSE_BRANCH:
MOV  CX, 2         ; 否则分支
END_IF:
```

### 3. 多分支

用多个 CMP/Jcc 逐级判断，或用跳转表实现 switch。

---

## 三、循环结构

### 1. 先判断后执行（while）

```asm
MOV CX, 10
WHILE:
    JCXZ EXIT          ; CX=0 退出
    ; ... 循环体 ...
    DEC CX
    JMP WHILE
EXIT:
```

### 2. 先执行后判断（do-while）

```asm
MOV CX, 10
DO:
    ; ... 循环体 ...
    LOOP DO            ; CX−1，非 0 继续
```

### 3. 多重循环

内层用一个计数器、外层用另一个，注意保存外层 CX：

```asm
MOV BX, 5
OUTER:
    MOV CX, 10
INNER:
    ; ...
    LOOP INNER
    DEC BX
    JNZ OUTER
```

---

## 四、子程序（过程）设计

### 1. 定义与调用

```asm
DELAY PROC
    PUSH CX
    MOV CX, 0FFFFH
D1: LOOP D1
    POP CX
    RET
DELAY ENDP

CALL DELAY
```

### 2. 参数传递方式

| 方式 | 说明 |
| :--- | :--- |
| 寄存器传递 | 最快，参数放 AX/BX 等 |
| 内存变量传递 | 通过共享变量 |
| 堆栈传递 | 最通用，配合 BP 取参 |
| 地址表传递 | 传递参数地址 |

堆栈取参示例：

```asm
SUB PROC
    PUSH BP
    MOV BP, SP
    MOV AX, [BP+4]     ; 取第一个参数
    ; ...
    POP BP
    RET 2              ; 返回并清理参数
SUB ENDP
```

---

## 五、宏汇编

宏在汇编前进行文本替换，可带参数，避免重复书写：

```asm
PRINT MACRO CHAR
    MOV DL, CHAR
    MOV AH, 02H
    INT 21H
ENDM

PRINT 'A'
PRINT 'B'
```

宏与子程序区别：宏展开后有多份代码、无调用开销；子程序只有一份、用 CALL 跳转。

---

## 六、设计要点

1. 先画流程图理清逻辑，再写汇编
2. 合理使用寄存器，进入子程序先 PUSH 保护现场
3. 循环优先用 LOOP + CX
4. 注意条件跳转的短转移范围限制

---

## 七、小结

| 结构 | 关键指令 |
| :--- | :--- |
| 顺序 | 直接书写 |
| 分支 | CMP/TEST + Jcc |
| 循环 | LOOP + CX |
| 子程序 | PROC/ENDP + CALL/RET |
| 宏 | MACRO/ENDM |

**上一篇：** [DOS/BIOS 中断](./04-dos-bios-interrupts.md)　**返回：** [README](../../README.md)
