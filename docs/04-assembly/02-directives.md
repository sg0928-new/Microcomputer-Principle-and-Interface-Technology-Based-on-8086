# 汇编伪指令

伪指令（指示性语句）由汇编器在**汇编期间**处理，不产生机器码，用于定义段、变量、常量、程序结构等。

---

## 一、段定义伪指令

```text
段名 SEGMENT [定位类型] [组合类型] ['类别']
     ...
段名 ENDS
```

ASSUME 指定段寄存器与段的对应关系：

```asm
DATA SEGMENT
    X DB 10
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX
    ...
CODE ENDS
END START
```

> ASSUME 只是建立关联，DS 等段寄存器仍需用 MOV 实际赋值。

---

## 二、程序结束伪指令

```text
END [标号]        ; 标记源程序结束，标号指定程序入口
```

---

## 三、数据定义伪指令

| 伪指令 | 含义 | 每个元素占 |
| :---: | :--- | :---: |
| DB | 定义字节（Byte） | 1 字节 |
| DW | 定义字（Word） | 2 字节 |
| DD | 定义双字（Double Word） | 4 字节 |
| DQ | 定义 4 字（8 字节） | 8 字节 |
| DT | 定义 10 字节 | 10 字节 |

```asm
NUM1 DB 25             ; 一个字节
STR1 DB 'HELLO'        ; 字符串
ARR  DB 1,2,3,4
BUF  DB 100 DUP(0)     ; 重复 100 个 0
W1   DW 1234H
P1   DD 12345678H
```

### DUP 重复操作符

```text
DB n DUP(初值)         ; 重复 n 次
DW 5 DUP(?)            ; 5 个字，? 表示不赋初值
```

---

## 四、符号定义伪指令

### 1. EQU（等值，不可重复定义）

```text
COUNT EQU 100
NAME  EQU 'A'
```

### 2. =（等号，可重复定义）

```text
X = 5
X = 10               ; 合法
```

### 3. LABEL

```text
名称 LABEL 类型      ; 为同一存储位置定义新属性（BYTE/WORD/NEAR/FAR）
```

---

## 五、定位与偏移伪指令

| 伪指令 | 功能 |
| :--- | :--- |
| ORG 表达式 | 设置后续数据/指令的起始偏移地址 |
| `$` | 当前地址计数器的值 |

```asm
ORG 100H            ; COM 程序起点
LEN EQU $ - STR     ; 计算 STR 长度
```

---

## 六、过程与宏定义

### 1. 过程（子程序）

```text
名称 PROC [NEAR/FAR]
     ...
     RET
名称 ENDP
```

### 2. 宏

```text
宏名 MACRO [形参]
    ...
    ENDM
```

---

## 七、完整数据段示例

```asm
DATA SEGMENT
    MSG   DB 'Input: $'
    BUF   DB 20 DUP(?)
    CNT   EQU 20
    TBL   DW 100, 200, 300
    LEN   DW $ - TBL
DATA ENDS
```

---

## 八、小结

| 类别 | 伪指令 |
| :--- | :--- |
| 段结构 | SEGMENT/ENDS、ASSUME、END |
| 数据定义 | DB、DW、DD、DUP、? |
| 符号 | EQU、=、LABEL |
| 定位 | ORG、$ |
| 过程/宏 | PROC/ENDP、MACRO/ENDM |

**上一篇：** [工具链](./01-toolchain.md)　**下一篇：** [程序结构](./03-program-structure.md)
