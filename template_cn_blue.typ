// ============================================================================
//  cv_resume · Typst Modern SaaS Edition — 一页双列版
//  在我们共同设计下诞生的全新版本
//  设计语言：左窄右宽双列平行排布 · 每个大模块用 soft blue 背景凸显
//           rounded module panels · information sidebar · modern SaaS style
// ============================================================================

// ---------- 色彩系统（modern SaaS blue）----------
#let accent       = rgb("2563EB")
#let accent-dark  = rgb("1D4ED8")
#let page-bg      = rgb("FFFFFF")   // 白底，让模块背景凸显
#let panel-bg     = rgb("EFF6FF")   // 模块 soft blue 背景
#let panel-border = rgb("BFDBFE")
#let chip-bg      = rgb("DBEAFE")   // 药丸更深一点的蓝
#let muted        = rgb("64748B")
#let ink          = rgb("0F172A")
#let ink-soft     = rgb("334155")

// ---------- 页面与文字 ----------
#set page(
  paper: "a4",
  margin: (left: 1.3cm, right: 1.3cm, top: 1.1cm, bottom: 1.1cm),
  fill: page-bg,
)

#set text(
  font: ("Songti SC", "STSong"),
  size: 8.8pt,
  lang: "zh",
  region: "cn",
  fill: ink,
)

#set par(leading: 0.66em, spacing: 0.62em, justify: true)

// ============================================================================
//  可复用组件
// ============================================================================

// 大模块 —— soft blue 圆角面板，用背景凸显
#let module(title, body) = block(
  width: 100%,
  fill: panel-bg,
  stroke: (thickness: 0.5pt, paint: panel-border),
  radius: 9pt,
  inset: (x: 11pt, y: 9pt),
  spacing: 5pt,
)[
  #block(spacing: 4pt)[
    #text(font: "Heiti SC", weight: "bold", size: 10.5pt, fill: accent-dark, tracking: 0.3pt)[#title]
    #v(-3pt)
    #line(length: 22pt, stroke: (thickness: 2pt, paint: accent))
  ]
  #body
]

// 联系信息行：标签( muted ) + 值
#let contact-item(label, value) = block(width: 100%, spacing: 3pt)[
  #text(size: 8pt, fill: muted, weight: "bold")[#label]
  #h(5pt)
  #text(size: 8pt, fill: ink-soft)[#value]
]

// 时间线条目：日期药丸 + 标题行 + 正文（紧凑）
#let entry(
  date: "",
  title: "",
  org: "",
  detail: "",
  body: none,
) = block(width: 100%, spacing: 3pt)[
  #box(
    fill: chip-bg,
    radius: 4pt,
    inset: (x: 6pt, y: 2pt),
  )[#text(size: 7.6pt, fill: accent-dark, weight: "bold")[#date]]
  #h(5pt)
  #text(weight: "bold", size: 9.6pt, fill: ink)[#title]
  #if org != "" [
    #h(3pt)
    #text(size: 8.6pt, fill: muted)[· #org]
  ]
  #if detail != "" [
    #h(3pt)
    #text(size: 8.6pt, fill: accent)[#detail]
  ]
  #if body != none [
    #v(1pt)
    #text(size: 8.6pt, fill: ink-soft)[#body]
  ]
]

// 项目条目（紧凑，name + link + 一句话）
#let project(name, desc, href: "") = block(width: 100%, spacing: 2pt)[
  #text(weight: "bold", size: 8.9pt, fill: accent-dark)[#name]
  #if href != "" [
    #h(4pt)
    #text(size: 7.8pt, fill: accent)[#link("https://" + href)[#href]]
  ]
  #text(size: 8.4pt, fill: ink-soft)[ #desc]
]

// 技能条目（侧栏紧凑）
#let skill-item(category, desc) = block(width: 100%, spacing: 2pt)[
  #text(font: "Heiti SC", weight: "bold", size: 8.6pt, fill: accent-dark)[#category]
  #v(-2pt)
  #text(size: 8.2pt, fill: ink-soft)[#desc]
]

// ============================================================================
//  正文 —— 双列平行排布
// ============================================================================
#grid(
  columns: (5.8cm, 12cm),
  column-gutter: 12pt,
  align: top,
)[
  // ==================== 左侧栏 ====================
  // 个人信息
  #module[个人信息][
    #align(center)[
      #box(
        fill: chip-bg,
        radius: 50%,
        clip: true,
        width: 1.7cm,
        height: 1.7cm,
      )[#image("avatar.png", width: 1.7cm, height: 1.7cm, fit: "cover")]
    ]
    #v(4pt)
    #align(center)[
      #text(font: "Heiti SC", weight: "bold", size: 19pt, fill: ink)[张三]
    ]
    #v(1pt)
    #align(center)[
      #text(size: 9pt, fill: muted)[SanZhang]
    ]
    #v(3pt)
    #align(center)[
      #box(fill: chip-bg, radius: 4pt, inset: (x: 6pt, y: 2pt))[
        #text(size: 7.8pt, fill: accent-dark)[1990/11/11]
      ]
    ]
  ]

  #v(6pt)

  // 联系方式
  #module[联系方式][
    #contact-item("手机", "18888888888")
    #contact-item("邮箱", "me@resume.com")
    #contact-item("GitHub", "github.com/geekplux")
    #contact-item("微信", "xxxx")
    #contact-item("博客", "geekplux.com")
    #contact-item("QQ", "123456")
  ]

  #v(6pt)

  // 技能
  #module[技能][
    #skill-item("前端", [熟练掌握前端技术栈，熟悉各类工具与原理。])
    #v(4pt)
    #skill-item("后端", [熟练掌握后端技术，熟悉架构与原理。])
    #v(4pt)
    #skill-item("数据", [掌握数据处理与数据库，熟悉数据建模。])
    #v(4pt)
    #skill-item("其他", [熟练使用 Git / Vim / Emacs / Makefile。])
  ]
][
  // ==================== 右侧主栏 ====================
  // 工作经历
  #module[工作经历][
    #entry(
      date: "2017.01 - 2017.12",
      title: "不长不短的公司名称",
      org: "可爱的项目",
      detail: "keaidexiangmu.com",
      body: [负责 xxx 的开发和维护，运用 yyy 技术解决 zzz 的重大问题，积极参与开源社区贡献。],
    )
    #v(4pt)
    #entry(
      date: "2016.01 - 2016.12",
      title: "好长的公司名称",
      org: "有趣的项目",
      detail: "youqudexiangmu.com",
      body: [按照领导要求编程，做出了让领导满意的作品，为公司做出贡献。],
    )
    #v(4pt)
    #entry(
      date: "2015.01 - 2015.12",
      title: "不知道叫什么的公司名称",
      org: "不可告人的项目",
      detail: "bukegaoren.com",
      body: [独立编写项目简介，出色完成凑字数工作，获最佳凑字数员工奖。],
    )
  ]

  #v(6pt)

  // 教育经历
  #module[教育经历][
    #entry(
      date: "2011.09 - 2015.06",
      title: "本科",
      org: "尼姑庵大学",
      detail: "计算机科学与技术",
    )
    #v(2pt)
    #block(
      width: 100%,
      fill: rgb("FFFFFF"),
      radius: 6pt,
      inset: (x: 9pt, y: 6pt),
      spacing: 2pt,
    )[
      #text(size: 8pt, fill: accent-dark, weight: "bold")[所获奖项]
      #v(1pt)
      #text(size: 8.2pt, fill: ink-soft)[
        • 最快编程大师一等奖　• 最强编程大师金奖 \
        • 第 x 届「编程杯」gayhub 赛区一等奖 \
        • 国家奖学金 / 三好学生 / 学生会主席 / *获得女朋友一个*
      ]
    ]
    #v(4pt)
    #entry(
      date: "2015.09 - 2018.06",
      title: "硕士",
      org: "和尚庙大学",
      detail: "软件工程 · 实验室 XXX 导师 XXX",
      body: [主要研究人工智能、图形学、编译原理等方向。],
    )
  ]

  #v(6pt)

  // 项目
  #module[项目][
    #text(font: "Heiti SC", weight: "bold", size: 8.6pt, fill: ink-soft)[科研]
    #v(2pt)
    #project("FFF-TNT", [建立深度学习模型预测 TNT 威力值。])
    #v(2pt)
    #project("NASA", [研究如何把字数凑得更加优雅自然。])
    #v(4pt)
    #text(font: "Heiti SC", weight: "bold", size: 8.6pt, fill: ink-soft)[开源]
    #v(2pt)
    #project("markvis", [markdown 中生成可视化图表，GitHub 1000 stars。], href: "markvis.js.org")
    #v(2pt)
    #project("netjsongraph.js", [力导向图可视化无线路由图谱数据。], href: "github.com/netjson/netjsongraph.js")
    #v(2pt)
    #project("typing", [Hexo 静态博客主题。], href: "github.com/geekplux/hexo-theme-typing")
    #v(2pt)
    #project("UnityVis", [Unity 中的基本可视化图表。], href: "github.com/geekplux/Basic-Visualization-in-Unity")
  ]

  #v(6pt)

  // Publications
  #module[Publications][
    #text(size: 8pt, fill: accent-dark, weight: "bold")[已录用]
    #h(5pt)
    #text(size: 8.5pt, fill: ink-soft)[张三，李四，王麻子. 基于 LaTeX 的简历凑字数研究\[C\], CVChina 2017.]
  ]
]
