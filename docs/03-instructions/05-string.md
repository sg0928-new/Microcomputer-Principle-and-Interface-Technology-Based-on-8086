# 串操作指令

"串"指内存中连续存放的一组字节或字。串操作指令用一条指令完成对整串数据的重复处理，配合重复前缀可实现高效的数据块移动、比较、搜索等。

---

## 一、串操作的共同约定

| 要素 | 约定 |
| :--- | :--- |
| 源操作数 | `DS:SI` 指向源串 |
| 目的操作数 | `ES:DI` 指向目的串 |
| 方向标志 DF | DF=0 地址递增（CLD 设置）；DF=1 地址递减（STD 设置） |
| 重复次数 | 存放在 CX 中 |
| 每次操作后 | SI、DI 自动 ±1（字节串）或 ±2（字串） |

---

## 二、五条基本串操作指令

### 1. MOVS（串传送）

```text
MOVSB     ; 字节：ES:DI ← DS:SI，SI/DI ±1
MOVSW     ; 字：ES:DI ← DS:SI，SI/DI ±2
```

把源串一个元素复制到目的串，配合 REP 实现数据块搬移。

### 2. CMPS（串比较）

```text
CMPSB / CMPSW   ; DS:SI 与 ES:DI 元素相减，影响标志，不存结果
```

配合 REPE/REPNE 比较两串是否相同。

### 3. SCAS（串搜索）

```text
SCASB   ; AL 与 ES:DI 字节比较
SCASW   ; AX 与 ES:DI 字比较
```

在目的串中查找与 AL/AX 相等的元素。

### 4. LODS（取串）

```text
LODSB   ; AL ← DS:SI
LODSW   ; AX ← DS:SI
```

从源串取元素到累加器，一般不加重复前缀。

### 5. STOS（存串）

```text
STOSB   ; ES:DI ← AL
STOSW   ; ES:DI ← AX
```

把累加器值存入目的串，配合 REP 可快速填充一段内存（如清零）。

---

## 三、重复前缀

| 前缀 | 重复条件 | 用途 |
| :--- | :--- | :--- |
| REP | CX ≠ 0 时重复，每次 CX−1 | 配合 MOVS、STOS |
| REPE / REPZ | CX≠0 且 ZF=1 时重复 | 配合 CMPS、SCAS（相等继续） |
| REPNE / REPNZ | CX≠0 且 ZF=0 时重复 | 配合 CMPS、SCAS（不等继续） |

---

## 四、完整示例

### 1. 数据块搬移（100 字节）

```asm
LEA SI, SRC          ; 源串
LEA DI, DST          ; 目的串
MOV CX, 100          ; 元素个数
CLD                  ; 方向递增
REP MOVSB            ; 自动重复复制
```

### 2. 内存块清零（50 个字）

```asm
LEA DI, BUF
MOV CX, 50
XOR AX, AX           ; 填充值 0
CLD
REP STOSW
```

### 3. 在串中查找字符

```asm
LEA DI, STR
MOV AL, 'A'
MOV CX, 80
CLD
REPNE SCASB          ; 不等则继续找
JE  FOUND            ; 找到（ZF=1）
```

---

## 五、注意事项

1. 使用前务必正确设置 DS、ES、SI、DI、CX
2. 先 CLD 或 STD 明确方向，否则结果不可预期
3. 注意字节/字操作对应 ±1/±2
4. 重叠区域搬移时，要根据源/目的位置关系选择递增或递减方向

---

## 六、小结

- 五条串指令：MOVS、CMPS、SCAS、LODS、STOS（各有 B/W 形式）
- 源用 DS:SI、目的用 ES:DI，方向由 DF 控制，计数用 CX
- REP 系列前缀实现自动重复，是高效处理数据块的利器

**上一篇：** [逻辑与移位指令](./04-logical-shift.md)　**下一篇：** [控制转移指令](./06-control-transfer.md)
