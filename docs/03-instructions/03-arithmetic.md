# 算术运算指令

算术运算指令包括加、减、乘、除及 BCD 调整，**会根据运算结果影响标志位**。

---

## 一、加法指令

### 1. ADD / ADC

```text
ADD DST, SRC       ; DST ← DST + SRC
ADC DST, SRC       ; DST ← DST + SRC + CF（带进位加法）
```

ADC 主要用于**多字节/多字加法**，把低位产生的进位加到高位。

```asm
ADD AX, BX
ADC DX, 0          ; 高位字加进位
```

### 2. INC（加 1）

```text
INC OPR            ; OPR ← OPR + 1
```

- 常用于循环中修改地址或计数器
- **不影响 CF**，但影响其他标志位

---

## 二、减法指令

### 1. SUB / SBB

```text
SUB DST, SRC       ; DST ← DST − SRC
SBB DST, SRC       ; DST ← DST − SRC − CF（带借位减法）
```

### 2. DEC（减 1）

```text
DEC OPR            ; OPR ← OPR − 1，不影响 CF
```

### 3. NEG（求补/取负）

```text
NEG OPR            ; OPR ← 0 − OPR（求相反数）
```

- 对负数求补得正数，反之亦然
- 除非操作数为 0，否则通常使 CF=1

### 4. CMP（比较）

```text
CMP OPR1, OPR2     ; 执行 OPR1 − OPR2，但不保存结果，只影响标志位
```

后接条件跳转指令判断大小关系：

```asm
CMP AX, BX
JE  EQUAL          ; 相等（ZF=1）跳转
JG  GREATER        ; 有符号数大于跳转
```

---

## 三、乘法指令

### 1. MUL（无符号乘法）

```text
MUL SRC
```

- 字节乘法：`AX ← AL × SRC8`
- 字乘法：`DX:AX ← AX × SRC16`（高 16 位在 DX，低 16 位在 AX）

### 2. IMUL（有符号乘法）

格式与 MUL 相同，按有符号数规则运算。

```asm
MOV AL, 05H
MUL BL             ; AX ← AL × BL
MOV AX, 1000H
MOV BX, 02H
MUL BX             ; DX:AX ← AX × BX
```

---

## 四、除法指令

### 1. DIV（无符号除法）

```text
DIV SRC
```

- 字节除法：`AL ← AX ÷ SRC8` 的商，`AH ← 余数`
- 字除法：`AX ← DX:AX ÷ SRC16` 的商，`DX ← 余数`

### 2. IDIV（有符号除法）

规则同 DIV，按有符号数运算。

```asm
MOV AX, 0064H      ; 被除数 100
MOV BL, 05H
DIV BL             ; AL=20（商），AH=0（余数）
```

> 除法溢出（商超出 AL/AX 范围）会触发 0 号中断（除法错中断）。

---

## 五、符号扩展指令

有符号除法前，需把被除数扩展到正确宽度：

| 指令 | 功能 |
| :--- | :--- |
| CBW | 将 AL 有符号扩展到 AX（用 AL 符号位填充 AH） |
| CWD | 将 AX 有符号扩展到 DX:AX |

```asm
MOV AL, -5
CBW                ; AX = FFFBH
```

---

## 六、BCD 调整指令

用于十进制（BCD 码）运算后调整结果：

| 指令 | 用途 |
| :--- | :--- |
| AAA / DAA | 加法后调整（非压缩 / 压缩 BCD） |
| AAS / DAS | 减法后调整 |
| AAM | 乘法后调整 |
| AAD | 除法前调整 |

---

## 七、条件跳转判断速查（配合 CMP）

| 含义 | 有符号数 | 无符号数 |
| :--- | :---: | :---: |
| 等于 | JE/JZ | JE/JZ |
| 大于 | JG/JNLE | JA/JNBE |
| 大于等于 | JGE/JNL | JAE/JNB |
| 小于 | JL/JNGE | JB/JNAE |
| 小于等于 | JLE/JNG | JBE/JNA |

---

## 八、小结

- 加减法：ADD/ADC、SUB/SBB、INC/DEC、NEG、CMP
- 乘法：MUL/IMUL，结果宽度加倍（AX 或 DX:AX）
- 除法：DIV/IDIV，商与余数分放两个寄存器
- CBW/CWD 用于有符号数扩展；算术指令均影响标志位

**上一篇：** [数据传送指令](./02-data-transfer.md)　**下一篇：** [逻辑与移位指令](./04-logical-shift.md)
