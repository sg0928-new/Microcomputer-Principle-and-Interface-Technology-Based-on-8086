<div align="center">

# 8086 Microcomputer Principle & Interface Technology

### 8086 微机原理与接口技术 · 学习笔记

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![Assembler](https://img.shields.io/badge/Assembler-MASM%2FTASM-blue.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-DOSBox%20%7C%20Proteus-green.svg)](#)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](#)
[![Made with](https://img.shields.io/badge/Made%20with-%E2%9D%A4-red.svg)](#)

<p>
  <a href="#chinese">🇨🇳 中文</a> &nbsp;|&nbsp; <a href="#english">🇬🇧 English</a>
</p>

</div>

---

<a id="chinese"></a>

# 🇨🇳 中文版

## 📖 项目简介

本仓库是 **Intel 8086 微处理器** 的《微机原理与接口技术》系统性学习笔记，涵盖从 CPU 内部结构、寻址方式、指令系统、汇编程序设计，到中断系统与常用可编程接口芯片（8255A / 8253 / 8259A / 8237 等）的完整知识体系，并配套基于 **DOSBox + MASM** 的汇编源码与基于 **Proteus** 的硬件仿真工程。

适用于：

-  高校《微机原理与接口技术》课程学习与实验报告
-  考研 408 / 专业课复习
-  8086 汇编入门与接口课程设计
-  想理解 16 位 x86 架构底层原理的开发者

---

## 🗺️ 学习路线总览

```text
8086 微处理器基础
        │
        ▼
寄存器组与存储器分段 ──► 物理地址计算
        │
        ▼
寻址方式 ──► 指令系统 ──► 标志位
        │
        ▼
汇编语言程序设计（MASM / DEBUG / DOS 中断）
        │
        ▼
I/O 端口与中断机制 ──► 8259A 中断控制器
        │
        ▼
可编程接口芯片（8255A / 8253 / 8251 / 8237）
        │
        ▼
A/D 与 D/A 转换 ──► Proteus 硬件综合实验
```

---

## 📚 知识体系分类

> 状态图例：✅ 已完成　🚧 更新中　✅ 计划中

### 一、8086 微处理器基础

| 章节 | 核心知识点 | 状态 |
| :--- | :--- | :---: |
| 1.1 内部结构 | 执行单元 EU、总线接口单元 BIU、指令流水线 | ✅ |
| 1.2 寄存器组 | 通用寄存器 AX/BX/CX/DX、指针 SP/BP、变址 SI/DI、段寄存器 CS/DS/SS/ES、指令指针 IP、标志寄存器 FLAGS | ✅ |
| 1.3 标志位 | CF、ZF、SF、OF、PF、AF、IF、DF、TF | ✅ |
| 1.4 引脚与工作模式 | 40 引脚功能、最小模式 / 最大模式、MN/MX 配置 | ✅ |
| 1.5 总线时序 | 时钟周期、总线周期、读/写时序、复位与启动 | ✅ |
| 1.6 8086 与 8088 | 外部数据总线宽度（16 位 / 8 位）对比 | ✅ |

### 二、存储器系统

| 章节 | 核心知识点 | 状态 |
| :--- | :--- | :---: |
| 2.1 分段管理 | 段地址与偏移地址、段的重叠与共享 | ✅ |
| 2.2 物理地址 | 物理地址 = 段地址 × 16 + 偏移地址（20 位 / 1MB 空间） | ✅ |
| 2.3 堆栈机制 | PUSH/POP、SP 变化规则、栈顶操作 | ✅ |

### 三、寻址方式与指令系统

| 章节 | 核心知识点 | 状态 |
| :--- | :--- | :---: |
| 3.1 寻址方式 | 立即数、寄存器、直接、寄存器间接、基址、变址、相对基址变址寻址 | ✅ |
| 3.2 数据传送指令 | MOV、PUSH、POP、XCHG、LEA、XLAT | ✅ |
| 3.3 算术运算指令 | ADD、ADC、INC、SUB、SBB、DEC、CMP、MUL、IMUL、DIV、IDIV | ✅ |
| 3.4 逻辑与移位指令 | AND、OR、NOT、XOR、TEST、SHL/SHR、SAL/SAR、ROL/ROR | ✅ |
| 3.5 串操作指令 | MOVS、CMPS、SCAS、LODS、STOS、REP 前缀、方向标志 DF | ✅ |
| 3.6 控制转移指令 | JMP、Jcc 条件跳转、LOOP、CALL、RET、INT/IRET | ✅ |
| 3.7 I/O 指令 | IN、OUT、端口寻址（直接 / DX 间接） | ✅ |

### 四、汇编语言程序设计

| 章节 | 核心知识点 | 状态 |
| :--- | :--- | :---: |
| 4.1 开发环境 | MASM/TASM、LINK、DEBUG、DOSBox 挂载与工作流 | ✅ |
| 4.2 伪指令 | SEGMENT/ENDS、ASSUME、END、ORG、EQU、DB/DW/DD、DUP | ✅ |
| 4.3 程序结构 | EXE 程序与 COM 程序（ORG 100H）、段定义模板 | ✅ |
| 4.4 DOS / BIOS 中断 | INT 21H（01H/02H/09H/0AH/4CH）、INT 10H、INT 16H | ✅ |
| 4.5 结构化程序 | 分支结构、循环结构、子程序设计与参数传递、宏汇编 | ✅ |

### 五、中断系统

| 章节 | 核心知识点 | 状态 |
| :--- | :--- | :---: |
| 5.1 中断基础 | 中断分类、中断源、中断响应过程、中断嵌套 | ✅ |
| 5.2 中断向量表 | 1KB 向量表、256 个中断类型号、向量地址 0000:0000 起 | ✅ |
| 5.3 8259A 中断控制器 | 内部结构、ICW/OCW 命令字、优先级管理、级联方式 | ✅ |

### 六、可编程接口芯片

| 章节 | 核心知识点 | 状态 |
| :--- | :--- | :---: |
| 6.1 8255A 并行接口 | PA/PB/PC 三个端口、方式 0/1/2、控制字、C 口置位/复位 | ✅ |
| 6.2 8253/8254 定时器 | 三个独立计数器、工作方式 0~5、门控/时钟/输出、计数初值 | ✅ |
| 6.3 8251A 串行接口 | 同步/异步通信、波特率、收发缓冲与调制解调信号 | ✅ |
| 6.4 8237 DMA 控制器 | DMA 传送方式、通道、请求/响应信号、存储器直接访问 | ✅ |

### 七、A/D 与 D/A 转换

| 章节 | 核心知识点 | 状态 |
| :--- | :--- | :---: |
| 7.1 数模转换 | DAC0832 工作原理、单缓冲/双缓冲方式 | ✅ |
| 7.2 模数转换 | ADC0808/0809、逐次逼近、通道选择、EOC 信号 | ✅ |
| 7.3 采样系统 | 采样保持、量化误差、接口时序配合 | ✅ |

### 八、工具链与硬件仿真

| 工具 | 用途 | 状态 |
| :--- | :--- | :---: |
| DOSBox + MASM | 标准 16 位 DOS 汇编环境（masm → link → debug） | ✅ |
| DEBUG | 命令行单步调试、寄存器/内存查看（R/T/D/U 命令） | ✅ |
| emu8086 | 一体化图形化 8086 模拟器（注意私有语法差异） | ✅ |
| Proteus | 8086 最小系统与接口芯片硬件电路仿真 | ✅ |
| VSCode 插件 | MASM/TASM（xsro）一键编译调试、8086 ASM Toolkit 语法高亮 | ✅ |
| 在线模拟器 | YJDoc2 8086 Emulator，免安装快速验证 | ✅ |

---

## 🗂️ 仓库目录结构

```text
.
├── docs/                     # 知识点笔记（30 篇 Markdown）
│   ├── 01-basics/            # 微处理器基础（5 篇）
│   ├── 02-memory/            # 存储器系统（3 篇）
│   ├── 03-instructions/      # 寻址方式与指令系统（7 篇）
│   ├── 04-assembly/          # 汇编程序设计（5 篇）
│   ├── 05-interrupt/         # 中断系统与 8259A（3 篇）
│   ├── 06-interface-chips/   # 8255A / 8253 / 8251 / 8237（4 篇）
│   └── 07-ad-da/             # A/D 与 D/A 转换（3 篇）
├── asm/                      # 8086 汇编源码（14 个 .asm）
│   ├── basic/                # 基础指令练习（6 个）
│   ├── dos-interrupt/        # DOS/BIOS 中断示例（4 个）
│   └── subroutine/           # 分支循环子程序与宏（4 个）
├── experiments/              # 8 个综合实验（各含 .asm + 中文说明）
├── proteus/                  # Proteus 8086 最小系统搭建指南
├── assets/                   # 图片、时序图、截图
├── LICENSE
└── README.md
```

---

## 🚀 快速开始

### 1. 克隆仓库

```bash
git clone https://github.com/sg0928-new/Microcomputer-Principle-and-Interface-Technology-Based-on-8086.git
```

### 2. 汇编与链接（DOSBox 环境）

```asm
; 挂载工作目录
mount C C:\asm
C:

; 汇编 → 链接 → 调试
masm test.asm;
link test.obj;
debug test.exe
```

### 3. DEBUG 常用命令

| 命令 | 功能 |
| :--- | :--- |
| `R` | 查看 / 修改寄存器与标志位 |
| `T` | 单步跟踪执行（Trace） |
| `D` | 查看内存内容（Dump） |
| `U` | 反汇编机器码（Unassemble） |
| `G` | 连续执行到断点（Go） |
| `Q` | 退出 DEBUG |

---

## 🧪 综合实验项目清单

| 实验项目 | 涉及芯片 / 技术 | 状态 |
| :--- | :--- | :---: |
| LED 流水灯 | 8255A 方式 0 输出 | ✅ |
| 交通信号灯控制 | 8255A + 8253 定时 | ✅ |
| 数码管动态显示 | 8255A + 动态扫描 | ✅ |
| 键盘扫描与抢答器 | 矩阵键盘 + 8255A | ✅ |
| 电子琴 / 扬声器发声 | 8253 方波驱动 | ✅ |
| 外部中断实验 | 8259A 中断响应 | ✅ |
| 温度 / 电压采集 | ADC0808 + 数据显示 | ✅ |
| 波形发生器 | DAC0832 + 查表输出 | ✅ |

---

## 📖 推荐资源

- 📘 教材：《微机原理与接口技术》（8086 版本，高校通用教材）
- 📗 手册：Intel 8086/8088 Datasheet、各接口芯片数据手册
- 🌐 在线：[YJDoc2 8086 Emulator](https://yjdoc2.github.io/8086-emulator-web/)
- 🛠️ 仿真：Proteus Design Suite、DOSBox 官方文档

---

## 🤝 贡献指南

欢迎通过 Issue 提交错误、通过 Pull Request 补充笔记与实验代码：

1. Fork 本仓库
2. 新建特性分支：`git checkout -b feature/your-note`
3. 提交更改：`git commit -m "docs: add notes for 8255A"`
4. 推送分支：`git push origin feature/your-note`
5. 发起 Pull Request

> ⚠️ 请勿上传教材、课件、试卷等受版权保护的第三方资料。

---

## 📄 许可证

本项目基于 [MIT License](./LICENSE) 开源，代码与笔记可自由使用、修改与分发，需保留原始版权声明。

<div align="center">

<p>
  <a href="#chinese">🇨🇳 中文</a> &nbsp;|&nbsp; <a href="#english">🇬🇧 English</a>
</p>

</div>

---

<a id="english"></a>

# 🇬🇧 English

## 📖 Introduction

This repository is a systematic collection of study notes for the **Intel 8086 microprocessor**, covering the complete syllabus of *Microcomputer Principle and Interface Technology*: from CPU internal architecture, addressing modes, the instruction set and assembly programming, to the interrupt system and common programmable interface chips (8255A / 8253 / 8259A / 8237). It also includes assembly source code based on **DOSBox + MASM** and hardware simulation projects based on **Proteus**.

Suitable for:

- 🎓 University course study and lab reports on Microcomputer Principle
- 📝 Postgraduate entrance exam preparation
- 🔧 8086 assembly beginners and interface design projects (traffic lights, digital displays, buzzers, etc.)
- 💡 Developers who want to understand the fundamentals of the 16-bit x86 architecture

---

## 🗺️ Learning Roadmap

```text
8086 Processor Basics
        │
        ▼
Registers & Memory Segmentation ──► Physical Address Calculation
        │
        ▼
Addressing Modes ──► Instruction Set ──► Flag Register
        │
        ▼
Assembly Programming (MASM / DEBUG / DOS Interrupts)
        │
        ▼
I/O Ports & Interrupt Mechanism ──► 8259A PIC
        │
        ▼
Programmable Interface Chips (8255A / 8253 / 8251 / 8237)
        │
        ▼
A/D & D/A Conversion ──► Integrated Proteus Hardware Labs
```

---

## 📚 Knowledge Categories

> Legend: ✅ Completed　🚧 In Progress　✅ Planned

### 1. 8086 Processor Fundamentals

| Chapter | Key Topics | Status |
| :--- | :--- | :---: |
| 1.1 Internal Architecture | Execution Unit (EU), Bus Interface Unit (BIU), instruction pipeline | ✅ |
| 1.2 Register Set | General AX/BX/CX/DX, pointers SP/BP, index SI/DI, segment CS/DS/SS/ES, instruction pointer IP, FLAGS | ✅ |
| 1.3 Flags | CF, ZF, SF, OF, PF, AF, IF, DF, TF | ✅ |
| 1.4 Pins & Operating Modes | 40-pin functions, minimum / maximum mode, MN/MX configuration | ✅ |
| 1.5 Bus Timing | Clock cycle, bus cycle, read/write timing, reset and startup | ✅ |
| 1.6 8086 vs 8088 | External data bus width comparison (16-bit / 8-bit) | ✅ |

### 2. Memory System

| Chapter | Key Topics | Status |
| :--- | :--- | :---: |
| 2.1 Segmentation | Segment and offset addresses, segment overlap and sharing | ✅ |
| 2.2 Physical Address | Physical address = segment × 16 + offset (20-bit / 1MB space) | ✅ |
| 2.3 Stack Mechanism | PUSH/POP, SP update rules, top-of-stack operations | ✅ |

### 3. Addressing Modes & Instruction Set

| Chapter | Key Topics | Status |
| :--- | :--- | :---: |
| 3.1 Addressing Modes | Immediate, register, direct, register indirect, base, indexed, based-indexed | ✅ |
| 3.2 Data Transfer | MOV, PUSH, POP, XCHG, LEA, XLAT | ✅ |
| 3.3 Arithmetic | ADD, ADC, INC, SUB, SBB, DEC, CMP, MUL, IMUL, DIV, IDIV | ✅ |
| 3.4 Logical & Shift | AND, OR, NOT, XOR, TEST, SHL/SHR, SAL/SAR, ROL/ROR | ✅ |
| 3.5 String Operations | MOVS, CMPS, SCAS, LODS, STOS, REP prefix, direction flag DF | ✅ |
| 3.6 Control Transfer | JMP, Jcc conditional jumps, LOOP, CALL, RET, INT/IRET | ✅ |
| 3.7 I/O Instructions | IN, OUT, direct / DX indirect port addressing | ✅ |

### 4. Assembly Language Programming

| Chapter | Key Topics | Status |
| :--- | :--- | :---: |
| 4.1 Toolchain | MASM/TASM, LINK, DEBUG, DOSBox mounting and workflow | ✅ |
| 4.2 Directives | SEGMENT/ENDS, ASSUME, END, ORG, EQU, DB/DW/DD, DUP | ✅ |
| 4.3 Program Structure | EXE and COM programs (ORG 100H), segment templates | ✅ |
| 4.4 DOS / BIOS Interrupts | INT 21H (01H/02H/09H/0AH/4CH), INT 10H, INT 16H | ✅ |
| 4.5 Structured Programs | Branching, loops, subroutines and parameter passing, macros | ✅ |

### 5. Interrupt System

| Chapter | Key Topics | Status |
| :--- | :--- | :---: |
| 5.1 Interrupt Basics | Interrupt classification, sources, response process, nesting | ✅ |
| 5.2 Interrupt Vector Table | 1KB table, 256 interrupt types, vectors starting at 0000:0000 | ✅ |
| 5.3 8259A PIC | Internal structure, ICW/OCW command words, priority, cascading | ✅ |

### 6. Programmable Interface Chips

| Chapter | Key Topics | Status |
| :--- | :--- | :---: |
| 6.1 8255A PPI | Ports PA/PB/PC, modes 0/1/2, control words, port-C bit set/reset | ✅ |
| 6.2 8253/8254 Timer | Three independent counters, modes 0~5, gate/clock/output, initial count | ✅ |
| 6.3 8251A USART | Synchronous/asynchronous communication, baud rate, buffers, modem signals | ✅ |
| 6.4 8237 DMA Controller | DMA transfer modes, channels, request/acknowledge signals | ✅ |

### 7. A/D & D/A Conversion

| Chapter | Key Topics | Status |
| :--- | :--- | :---: |
| 7.1 D/A Conversion | DAC0832 principles, single / double buffering | ✅ |
| 7.2 A/D Conversion | ADC0808/0809, successive approximation, channel selection, EOC signal | ✅ |
| 7.3 Sampling System | Sample-and-hold, quantization error, timing coordination | ✅ |

### 8. Toolchain & Hardware Simulation

| Tool | Purpose | Status |
| :--- | :--- | :---: |
| DOSBox + MASM | Standard 16-bit DOS assembly environment (masm → link → debug) | ✅ |
| DEBUG | Command-line single-step debugging, register/memory inspection (R/T/D/U) | ✅ |
| emu8086 | All-in-one graphical 8086 emulator (note its proprietary syntax) | ✅ |
| Proteus | 8086 minimum system and interface chip circuit simulation | ✅ |
| VSCode Extensions | MASM/TASM (xsro) one-click build & debug, 8086 ASM Toolkit highlighting | ✅ |
| Online Emulator | YJDoc2 8086 Emulator, installation-free quick verification | ✅ |

---

## 🗂️ Repository Structure

```text
.
├── docs/                     # Knowledge notes (30 Markdown files)
│   ├── 01-basics/            # Processor fundamentals (5)
│   ├── 02-memory/            # Memory system (3)
│   ├── 03-instructions/      # Addressing modes & instruction set (7)
│   ├── 04-assembly/          # Assembly programming (5)
│   ├── 05-interrupt/         # Interrupt system & 8259A (3)
│   ├── 06-interface-chips/   # 8255A / 8253 / 8251 / 8237 (4)
│   └── 07-ad-da/             # A/D & D/A conversion (3)
├── asm/                      # 8086 assembly sources (14 .asm files)
│   ├── basic/                # Basic instruction exercises (6)
│   ├── dos-interrupt/        # DOS/BIOS interrupt examples (4)
│   └── subroutine/           # Branches, loops, subroutines & macros (4)
├── experiments/              # 8 integrated labs (each with .asm + notes)
├── proteus/                  # Proteus 8086 minimum system build guide
├── assets/                   # Images, timing diagrams, screenshots
├── LICENSE
└── README.md
```

---

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/sg0928-new/Microcomputer-Principle-and-Interface-Technology-Based-on-8086.git
```

### 2. Assemble & Link (DOSBox)

```asm
; Mount the working directory
mount C C:\asm
C:

; Assemble → Link → Debug
masm test.asm;
link test.obj;
debug test.exe
```

### 3. Common DEBUG Commands

| Command | Function |
| :--- | :--- |
| `R` | View / modify registers and flags |
| `T` | Single-step trace execution |
| `D` | Dump memory contents |
| `U` | Unassemble machine code |
| `G` | Go (run until a breakpoint) |
| `Q` | Quit DEBUG |

---

## 🧪 Integrated Lab Projects

| Project | Chips / Techniques | Status |
| :--- | :--- | :---: |
| LED Flowing Lights | 8255A mode 0 output | ✅ |
| Traffic Light Control | 8255A + 8253 timing | ✅ |
| Dynamic 7-Segment Display | 8255A + dynamic scanning | ✅ |
| Keypad Scanner / Quiz Buzzer | Matrix keypad + 8255A | ✅ |
| Electronic Piano / Speaker | 8253 square-wave generation | ✅ |
| External Interrupt Lab | 8259A interrupt handling | ✅ |
| Voltage / Temperature Acquisition | ADC0808 + data display | ✅ |
| Waveform Generator | DAC0832 + lookup table | ✅ |

---

## 📖 Recommended Resources

- 📘 Textbook: *Microcomputer Principle and Interface Technology* (8086 edition)
- 📗 Datasheets: Intel 8086/8088 and interface chip datasheets
- 🌐 Online: [YJDoc2 8086 Emulator](https://yjdoc2.github.io/8086-emulator-web/)
- 🛠️ Simulation: Proteus Design Suite, DOSBox official documentation

---

## 🤝 Contributing

Issues and pull requests are welcome:

1. Fork this repository
2. Create a feature branch: `git checkout -b feature/your-note`
3. Commit your changes: `git commit -m "docs: add notes for 8255A"`
4. Push the branch: `git push origin feature/your-note`
5. Open a Pull Request

> ⚠️ Please do not upload copyrighted third-party textbooks, slides or exam papers.

---

## 📄 License

This project is licensed under the [MIT License](./LICENSE). You may freely use, modify and distribute the code and notes, provided the original copyright notice is retained.

<div align="center">

<p>
  <a href="#chinese">🇨🇳 中文</a> &nbsp;|&nbsp; <a href="#english">🇬🇧 English</a>
</p>

</div>
