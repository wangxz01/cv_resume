# cv_resume

中文简历 LaTeX 模板。基于 [ModernCV](https://github.com/moderncv/moderncv)，进行了中文字体支持与排版优化，使用 **XeLaTeX** 编译。

![Preview](./template_cn_blue.png)

## 本分支说明

基于上游 ModernCV 中文简历模板做了以下修改，**仅供 macOS 使用**。Windows / Linux 用户请使用 [上游原版模板](https://github.com/geekplux/cv_resume)。

1. **字体配置 macOS 化**：删除了用于 Windows 平台的字体配置代码（`ifplatform`、`\ifwindows` 分支以及对 `SimSun / SimHei / Microsoft YaHei / Adobe Song Std` 等字体的引用），统一改用 macOS 系统自带中文字体（`STSong / Songti SC / Heiti SC / Kaiti SC / STFangsong / PingFang SC` 等），开箱即用，无需额外下载字体。
2. **Makefile 双编译**：默认连续运行两次 `xelatex`，一次性消除 hyperref / 交叉引用引起的 rerun 警告。
3. **修复 Overfull \\hbox 警告**：开源项目段落中 `netjsongraph.js` 略宽于左栏，在 `.js` 前插入软连字符 `\-` 允许断词，视觉无影响。

## 特性

- 字体族和字号宏已在 `.tex` 文件中按中文习惯命名（`\song / \fs / \yh / \hei / \kai` 等），便于按需切换
- 页面外边距可通过 `\usepackage[scale=0.9]{geometry}` 中的 `scale` 参数调整
- 标题与正文的间距可通过 `\vspace` 调整
- 默认主题为 `blue`，可在 `\moderncvtheme[blue]{classic}` 处切换为 `orange / red / green / grey / roman`

## 文件结构

```
cv_resume/
├── template_cn_blue.tex   # 模板主文件，编辑此文件即可
├── template_cn_blue.pdf   # 编译产物示例
├── template_cn_blue.png   # 预览图
├── avatar.png             # 简历头像，替换为自己的图片
├── Makefile               # 编译入口
├── LICENSE                # MIT 协议
└── README.md
```

## 环境要求

- macOS（仅在 macOS 上测试通过）
- 一份完整的 TeX 发行版，推荐安装 [MacTeX](http://www.tug.org/mactex/)，它会一次性带上 `xelatex`、`moderncv`、`xeCJK`、`etoolbox` 等所需宏包
- 系统自带的以下中文字体（macOS 默认全部预装，无需额外下载）：
  - `STSong`、`Songti SC`
  - `Heiti SC`、`STHeiti`
  - `Kaiti SC`、`Kai`
  - `STFangsong`
  - `PingFang SC`

## Usage

### 1. 安装 MacTeX

通过 Homebrew：

```bash
brew install --cask mactex
```

或前往 [MacTeX 官网](http://www.tug.org/mactex/) 下载 `.pkg` 安装包，双击安装。

> MacTeX 体积较大（约 5 GB+），如需要更轻量的方案可以装 [BasicTeX](http://www.tug.org/mactex/morepackages.html) 并用 `tlmgr install moderncv xecjk etoolbox` 单独安装本模板用到的宏包。

### 2. 编译

在项目根目录运行：

```bash
make
```

`Makefile` 内部会连续调用两次 `xelatex`：

```bash
xelatex template_cn_blue.tex
xelatex template_cn_blue.tex
```

第二次编译用于消除 hyperref 与交叉引用引起的 rerun 警告。编译成功后，会在当前目录生成 `template_cn_blue.pdf`。

### 3. 清理中间产物

```bash
make clean
```

会删除 `.aux / .log / .out / .pdf` 等编译产生的临时文件。

### 4. 自定义内容

直接编辑 `template_cn_blue.tex`：

- **个人信息**（姓名、电话、邮箱、头像等）：文件顶部 `\firstname / \familyname / \mobile / \email / \photo` 等命令
- **章节内容**（工作经历、教育经历、项目、技能等）：`\begin{document}` 之后的 `\section{...}` 块
- **头像**：替换根目录下的 `avatar.png`，保持文件名不变即可（或修改 `\photo[64pt]{avatar.png}` 改文件名 / 调高度）

## Troubleshooting

### 报错 `Font ... not found`

确认本机是否装了对应字体。检查命令：

```bash
fc-list :lang=zh-cn | grep -iE "(STSong|Songti SC|Heiti SC|Kaiti SC|STFangsong|PingFang SC)"
```

如果某个字体在系统里找不到，可以在 `template_cn_blue.tex` 顶部把它替换为同类其他 macOS 字体。

### 报错 `! LaTeX Error: File 'moderncv.cls' not found`

说明 TeX 发行版没装 moderncv 宏包。MacTeX 默认带，BasicTeX 用户需手动安装：

```bash
sudo tlmgr install moderncv xecjk etoolbox ifplatform fontspec
```

### 出现 `Overfull \hbox` 警告

通常是某个英文长词（URL、项目名）放不下导致。可以在词中适当位置插入软连字符 `\-` 允许断词，例如 `netjsongraph\-.js`。

### 中文标点显示不正常

确认源文件保存为 **UTF-8** 编码，并且用 `xelatex` 而非 `pdflatex` 编译。

## 上游与致谢

- 原始模板：[geekplux/cv\_resume](https://github.com/geekplux/cv_resume)
- 底层模板：[ModernCV](https://github.com/moderncv/moderncv) by Xavier Danaux

## LICENSE

**cv_resume** © [geekplux](https://github.com/geekplux)，本分支继承上游的 [MIT](./LICENSE) 许可证。
