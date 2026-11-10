# 控制转移指令

控制转移指令通过改变 CS:IP 来改变程序执行流程，分为无条件转移、条件转移、循环控制、子程序调用与中断指令。

---

## 一、无条件转移 JMP

```text
JMP 目标标号        ; 无条件跳转到目标地址
```

- 段内转移：只改 IP（短转移 SHORT、近转移 NEAR）
- 段间转移：同时改 CS 和 IP（FAR）

```asm
JMP NEXT
...
NEXT: MOV AX, 0
```

---

## 二、条件转移 Jcc

根据标志位状态决定是否跳转，**均为段内短转移（范围 −128~+127 字节）**，满足条件则跳转，否则顺序执行。

### 1. 根据单个标志

| 指令 | 跳转条件 | 含义 |
| :--- | :--- | :--- |
| JZ / JE | ZF=1 | 为零 / 相等 |
| JNZ / JNE | ZF=0 | 非零 / 不等 |
| JC / JNC | CF=1 / 0 | 有 / 无进位 |
| JO / JNO | OF=1 / 0 | 溢出 / 不溢出 |
| JS / JNS | SF=1 / 0 | 为负 / 为正 |
| JP / JNP | PF=1 / 0 | 偶 / 奇校验 |

### 2. 无符号数比较（配合 CMP）

| 指令 | 含义 |
| :--- | :--- |
| JB / JNAE | 低于（CF=1） |
| JBE / JNA | 低于等于 |
| JA / JNBE | 高于 |
| JAE / JNB | 高于等于 |

### 3. 有符号数比较

| 指令 | 含义 |
| :--- | :--- |
| JL / JNGE | 小于（SF≠OF） |
| JLE / JNG | 小于等于 |
| JG / JNLE | 大于 |
| JGE / JNL | 大于等于 |

示例：

```asm
CMP AX, BX
JGE AX_BIGGER      ; 有符号数 AX≥BX 跳转
```

---

## 三、循环控制指令

默认用 **CX 作为计数器**，属段内短转移。

| 指令 | 动作 |
| :--- | :--- |
| LOOP | CX−1，CX≠0 则循环 |
| LOOPZ / LOOPE | CX−1，CX≠0 且 ZF=1 时循环 |
| LOOPNZ / LOOPNE | CX−1，CX≠0 且 ZF=0 时循环 |
| JCXZ | CX=0 时跳转 |

```asm
MOV CX, 10
AGAIN:
    ; ... 循环体 ...
    LOOP AGAIN     ; CX 减到 0 结束
```

---

## 四、子程序调用与返回

### 1. CALL

```text
CALL 子程序名
```

- 段内调用：把下一条指令 IP 压栈，再转到子程序
- 段间调用：把 CS、IP 依次压栈

### 2. RET

```text
RET                ; 从栈顶弹出断点，返回调用处
RET n              ; 返回后再 SP+n（用于清除栈中参数）
```

```asm
CALL DELAY
...
DELAY:
    ; ...
    RET
```

---

## 五、中断指令

| 指令 | 功能 |
| :--- | :--- |
| INT n | 触发 n 号软中断：FLAGS、CS、IP 依次压栈，转中断处理程序 |
| IRET | 中断返回，弹出 IP、CS、FLAGS |
| INTO | OF=1 时触发 4 号溢出中断 |

---

## 六、小结

| 类别 | 指令 |
| :--- | :--- |
| 无条件转移 | JMP |
| 条件转移 | JZ/JNZ、JC、JO、JS、JA/JB、JG/JL 等 |
| 循环 | LOOP、LOOPZ、JCXZ（用 CX） |
| 子程序 | CALL / RET |
| 中断 | INT n / IRET |

**上一篇：** [串操作指令](./05-string.md)　**下一篇：** [I/O 指令](./07-io-instructions.md)
