# EXE 与 COM 程序结构

8086 汇编可生成两种可执行文件：EXE 与 COM，结构差异明显。

---

## 一、EXE 程序（分段结构）

特点：

- 允许分别定义代码段、数据段、堆栈段，程序可大于 64KB
- 文件带**文件头（Header）**，含重定位信息、校验和等
- 标准 MASM 作业最常用

### 标准模板

```asm
STACK SEGMENT STACK
    DW 100 DUP(?)
STACK ENDS

DATA SEGMENT
    MSG DB 'Hello! $'
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA, SS:STACK
START:
    MOV AX, DATA
    MOV DS, AX            ; 初始化 DS

    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
```

---

## 二、COM 程序（紧凑结构）

特点：

- 纯机器码，无文件头，体积小
- 代码、数据、堆栈共用**同一个段**，最大 64KB
- 必须 `ORG 100H`：前 256 字节为程序段前缀 PSP
- 不单独定义段，加载时 CS=DS=SS=ES 指向同一段

### 标准模板

```asm
ORG 100H
START:
    LEA DX, MSG
    MOV AH, 09H
    INT 21H
    MOV AH, 4CH
    INT 21H
MSG DB 'COM file! $'
```

> COM 程序从偏移 100H 开始执行，SP 初始指向段顶附近。

---

## 三、程序段前缀 PSP

DOS 加载程序时，在程序所在段前 256 字节建立 PSP（Program Segment Prefix），包含：

- 退出地址、命令行参数、环境信息等
- COM 程序因此用 ORG 100H 跳过 PSP
- PSP 首字节常为中断指令 INT 20H（老版本退出方式）

---

## 四、两种结构对比

| 对比项 | EXE | COM |
| :--- | :--- | :--- |
| 段结构 | 可多段 | 单段 |
| 文件头 | 有 | 无 |
| 最大长度 | 可超 64KB | 64KB |
| 起始设置 | ORG 无要求，需初始化 DS | 必须 ORG 100H |
| 体积 | 较大 | 小 |
| 适用 | 复杂程序、课程作业 | 短小工具、入门 |

---

## 五、程序退出方式

| 方式 | 说明 |
| :--- | :--- |
| `MOV AH,4CH / INT 21H` | 推荐，标准退出，AL 可带返回码 |
| INT 20H | 老式退出，COM 中可用 |

---

## 六、小结

- EXE：分段、带头、功能强，标准作业首选
- COM：单段、ORG 100H、紧凑短小
- 两种都通过 INT 21H 的 4CH 规范退出

**上一篇：** [伪指令](./02-directives.md)　**下一篇：** [DOS/BIOS 中断](./04-dos-bios-interrupts.md)
