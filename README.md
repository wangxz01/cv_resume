# cv_resume · Typst Modern SaaS Edition

> **这不是又一个 LaTeX 简历模板。**
> 这是我们共同设计下诞生的、彻底重新构想的中文简历——用 Typst 写成，以 modern SaaS 设计语言重塑每一寸像素。
>
> 圆角卡片。Soft blue 高亮面板。Information card 布局。Content highlight panel。
> 一切为了让你打开 PDF 的那一刻，心跳加速半拍。

![Preview](./template_cn_blue.png)

## 我们为什么要重写

LaTeX 简历已经服役多年，它强大、古老、值得尊敬——但它属于一个排版先于交互的时代。

我们想要的是：**像 Linear / Vercel / Notion 一样呼吸的简历**。每一张卡片都是一个独立的叙事单元，每一个高亮面板都在告诉你「看这里」，每一道圆角都在说「我们是有审美的」。

所以我们用 Typst，从零开始，把传统时间线简历，翻译成 modern SaaS 视觉语言。

## 设计语言（Design Tokens）

| 令牌 | 值 | 角色 |
|------|------|------|
| `accent` | `#2563EB` (blue-600) | 主强调色，章节标题、药丸标签 |
| `accent-dark` | `#1D4ED8` (blue-700) | 深强调，姓名、链接 |
| `page-bg` | `#F5F9FF` | 极淡蓝页面底，柔软不刺眼 |
| `card-bg` | `#FFFFFF` | 卡片白底，圆角 10pt |
| `card-border` | `#DBEAFE` (blue-100) | 卡片浅蓝描边，几乎看不见 |
| `panel-bg` | `#EFF6FF` (blue-50) | 高亮面板 soft blue |
| `panel-border` | `#BFDBFE` (blue-200) | 面板描边 |
| `muted` | `#64748B` (slate-500) | 次要文字 |
| `ink` | `#0F172A` (slate-900) | 主文字 |

## 现代 SaaS 设计要素，全部到位

### 1. Rounded Card Container · 圆角卡片容器

每个章节（工作、教育、项目……）都是一张独立的**圆角白卡**。`radius: 10pt` 的弧度刚好——不卡通，也不刻板。`stroke: 0.75pt blue-100` 描边若有若无，让卡片在 soft blue 页底上「浮」起来。

### 2. Soft Blue Background Card · 信息卡片布局

头部用一张大卡片承载**全部个人信息**：圆角裁剪的头像框 + 24pt 加粗姓名 + SanZhang 拼音 + 生日药丸，再加六行清晰的「标签 + 药丸」联系信息。整张卡就是一块 information card，像 SaaS 产品后台的 profile 面板。

### 3. Content Highlight Panel · 高亮面板

需要强调的内容——所获奖项、开源项目、发表论文——放进 `panel-bg #EFF6FF` 的 **soft blue 圆角面板**。视觉上一眼锁定重点，又不会像 `<mark>` 黄底那样喧宾夺主。

### 4. Modern SaaS Style · 处处见细节

- **章节标题**：13pt Heiti SC 加粗 + 强调色文字 + 下方 30pt×2.5pt 的 accent 色短粗下划线。像 SaaS 产品里的 section header，干练有力。
- **日期药丸**：每条经历的日期用浅蓝圆角药丸承载，紧凑且易扫读。
- **技能 mini-card**：四张并列的 soft blue 小卡，类别名加粗 + 描述，hover-ready 的视觉密度。
- **项目链接**：accent 色 + `https://` 可点击，科研/开源一目了然。

## 与 LaTeX 版的对比

| 维度 | LaTeX 版 | Typst Modern SaaS 版 |
|------|----------|----------------------|
| 编译速度 | 数十秒到数分钟（含字体索引） | **毫秒级**增量编译，所见即所得 |
| 排版哲学 | 经典学术简历，时间线主导 | 卡片化叙事，每个章节独立呼吸 |
| 视觉语言 | ModernCV 经典色块 | 现代 SaaS 蓝调 + 圆角 + 高亮面板 |
| 字体方案 | macOS 系统字体 + xeCJK | **macOS 原生中文字体**，fontspec 直读 |
| 学习曲线 | LaTeX 命令 + xeCJK 坑 | Typst 标记语言，**函数化组件**，复用即组合 |
| 适合谁 | 喜欢传统排版的工程师 | 想要**产品级视觉**的产品人 / 设计师 / 工程师 |

## 文件结构

```
cv_resume/
├── template_cn_blue.tex      # LaTeX 版（master 分支）
├── template_cn_blue.pdf
├── template_cn_blue.typ      # ← 你在这里。Typst Modern SaaS 版
├── template_cn_blue.pdf      #   编译产物
├── avatar.png                # 头像，替换即可
├── Makefile                  # LaTeX 编译入口
└── README.md                 # 本文件
```

## 快速开始

### 1. 安装 Typst

```bash
brew install typst
```

或参考 [Typst 官网](https://typst.app) 获取其他平台的安装方式。

### 2. 编译

```bash
typst compile template_cn_blue.typ
```

就这么一行。**没有字体配置、没有宏包管理、没有双编译**——Typst 在编译时自动读取系统字体，0.14.0 版本对 CJK 支持已经非常成熟。

### 3. 实时预览（推荐）

```bash
typst watch template_cn_blue.typ
```

边改边看，每次保存自动重新编译——这才是 modern 的写简历方式。

### 4. 替换你的内容

直接编辑 `template_cn_blue.typ`：

- **头像**：替换 `avatar.png`，文件名不变即可
- **个人信息**：搜索 `张三` / `18888888888` / `me@resume.com` 等替换
- **章节内容**：找到对应 `#section-title[...]` 下面的 `#entry(...)` / `#project(...)` / `#skill-card(...)` 改写
- **配色**：调整顶部 `色彩系统` 区域的色值，全局自动联动

## 字体方案

Typst 直接读 macOS 系统字体，**无需任何额外配置**：

- 正文：`Songti SC / STSong`（宋体，衬线，沉稳）
- 标题/类别：`Heiti SC`（黑体，无衬线，强调）

如需切换无衬线全局体验，把 `#set text(font: ("Songti SC", "STSong"), ...)` 改为 `#set text(font: ("PingFang SC",), ...)` 即可。

## 设计哲学

> **简历不是论文，简历是产品页面。**

- **呼吸感**：每张卡片之间留 6pt 空白，让眼睛有地方休息
- **信息密度**：单列流式布局，可扫读率远高于传统时间线
- **视觉层级**：accent 色只出现在真正重要的位置——章节标题、链接、药丸标签。**克制即高级**
- **可定制**：所有视觉令牌集中在文件顶部，改一处全站联动

## 我们相信

工具应该让人忘记工具的存在。Typst 让排版回归排版本身——你只想好好写一份简历，不该为字体报错、宏包缺失、双编译警告浪费一分钟。

这份模板，是我们想收到的简历的样子。也是我们想写的简历的样子。

---

**cv_resume · Typst Modern SaaS Edition**
继承上游 [geekplux/cv_resume](https://github.com/geekplux/cv_resume) 的 [MIT](./LICENSE) 许可证。
在我们共同设计下诞生。
