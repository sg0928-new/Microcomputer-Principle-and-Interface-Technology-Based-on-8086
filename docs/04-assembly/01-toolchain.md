# 开发环境与工具链

## 一、标准工具链组成

| 工具 | 作用 |
| :--- | :--- |
| 编辑器 | 书写 .asm 源码（VSCode、记事本等） |
| MASM / TASM | 汇编器：源码 .asm → 目标文件 .obj |
| LINK | 链接器：.obj → 可执行文件 .exe |
| DEBUG | 调试器：单步、查看寄存器与内存 |
| DOSBox | 模拟 16 位 MS-DOS 环境，运行上述老工具 |

---

## 二、完整工作流程

```text
编辑源码          汇编              链接             运行/调试
test.asm  ──►  masm test.asm  ──► link test.obj ──► test.exe / debug
                  生成 test.obj     生成 test.exe
```

### DOSBox 中的命令

```asm
; 1. 挂载宿主机目录为 DOS 下的 C 盘
mount C C:\asm
C:

; 2. 汇编（分号表示省略中间提问）
masm test.asm;

; 3. 链接
link test.obj;

; 4. 运行
test.exe

; 5. 调试
debug test.exe
```

---

## 三、DEBUG 常用命令

| 命令 | 功能 | 示例 |
| :--- | :--- | :--- |
| R | 查看/修改寄存器 | `R`、`R AX` |
| T | 单步执行 | `T`、`T=CS:IP 3` |
| P | 执行一步（可越过中断/子程序） | `P` |
| D | 查看内存 | `D DS:0`、`D 1000:0` |
| E | 修改内存 | `E DS:0 12 34` |
| U | 反汇编 | `U CS:0` |
| G | 执行到断点 | `G=0 10` |
| A | 汇编指令写入内存 | `A CS:0` |
| Q | 退出 | `Q` |

---

## 四、VSCode 现代化方案

安装插件 **MASM/TASM（xsro）**：

1. 打开 .asm 文件
2. 右键选择 `Run ASM Code` 或 `Debug ASM Code`
3. 插件自动调用 DOSBox + MASM，无需手动 mount
4. 另装 **8086 ASM Toolkit** 获得语法高亮

---

## 五、常见问题

| 问题 | 原因 / 解决 |
| :--- | :--- |
| Illegal command | 未挂载或路径错误，检查 mount 与当前盘符 |
| 汇编报错 | 语法错误，按 MASM 提示的行号检查 |
| 中文注释乱码 | 老 MASM 按 GBK 解析；建议源码注释用英文 |
| 找不到文件 | 文件名/扩展名错误，用 `dir` 查看 |

---

## 六、小结

- 标准流程：`masm → link → debug`，运行在 DOSBox 中
- DEBUG 是理解指令执行过程的核心工具
- VSCode + MASM/TASM 插件可大幅简化操作

**下一篇：** [伪指令](./02-directives.md)
