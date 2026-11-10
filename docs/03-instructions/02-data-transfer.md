# 数据传送指令

数据传送指令用于在寄存器、内存、I/O 端口之间传送数据，**除标志位传送类指令外，一般不影响标志位**。

---

## 一、通用传送 MOV

```text
MOV 目的, 源      ; 目的 ← 源
```

合法传送路径：

```text
寄存器 ← 立即数
寄存器 ← 寄存器
寄存器 ← 内存
内存   ← 寄存器
内存   ← 立即数
段寄存器 ← 寄存器/内存
```

示例：

```asm
MOV AX, BX
MOV DS, AX
MOV [BX], 12H
```

**非法情况（常见错误）：**

- 立即数不能直接送段寄存器：`MOV DS, 1000H` ❌
- 两个段寄存器之间不能直接传送：`MOV ES, DS` ❌
- 两个内存单元之间不能直接 MOV：`MOV [1000H], [2000H]` ❌
- CS 不能作为目的操作数

---

## 二、堆栈传送 PUSH / POP

```asm
PUSH SRC           ; 压栈：SP−2，字 → SS:SP
POP  DST           ; 出栈：SS:SP 的字 → DST，SP+2
```

- 操作数必须是 16 位（字）
- 可用于寄存器、内存、段寄存器
- PUSH CS 合法，但 POP CS 非法

---

## 三、交换指令 XCHG

```text
XCHG OPR1, OPR2    ; 两个操作数内容互换
```

```asm
XCHG AX, BX        ; AX 与 BX 互换
XCHG AL, [SI]
```

- 不允许立即数、段寄存器参与
- 两个内存单元之间不能直接交换

---

## 四、地址传送指令

### 1. LEA（取偏移地址）

```text
LEA REG, MEM       ; REG ← 内存操作数的偏移地址（EA）
```

```asm
LEA BX, TABLE      ; BX ← TABLE 的偏移地址
LEA SI, [BX+10H]   ; SI ← BX+10H（地址运算，不是取内容）
```

对比：

```asm
MOV AX, OFFSET TABLE   ; 等价于 LEA AX, TABLE（编译期常量）
```

### 2. LDS / LES（取地址指针）

```text
LDS REG, MEM       ; 从内存取 4 字节：低字→REG，高字→DS
LES REG, MEM       ; 同上，高字→ES
```

用于一次加载"段:偏移"完整 32 位地址指针。

---

## 五、查表指令 XLAT

```text
XLAT               ; AL ← DS:[BX+AL]
```

- BX 指向表首，AL 存放表内序号
- 执行后 AL 得到对应表项，常用于代码转换（如十六进制转七段码）

```asm
LEA BX, SEG_TABLE
MOV AL, 03H
XLAT               ; 取第 3 项
```

---

## 六、标志位传送指令

| 指令 | 功能 |
| :--- | :--- |
| LAHF | FLAGS 低 8 位 → AH |
| SAHF | AH → FLAGS 低 8 位（影响 SF/ZF/AF/PF/CF） |
| PUSHF | 标志寄存器压栈 |
| POPF | 栈顶弹出到标志寄存器（可修改标志位） |

---

## 七、小结

| 指令 | 作用 | 影响标志 |
| :--- | :--- | :---: |
| MOV | 通用数据传送 | 否 |
| PUSH/POP | 堆栈字传送 | 否 |
| XCHG | 两操作数交换 | 否 |
| LEA/LDS/LES | 地址传送 | 否 |
| XLAT | 查表换码 | 否 |
| PUSHF/POPF 等 | 标志传送 | 是（POPF/SAHF） |

**上一篇：** [寻址方式](./01-addressing-modes.md)　**下一篇：** [算术运算指令](./03-arithmetic.md)
