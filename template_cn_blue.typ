// ============================================================================
//  cv_resume · Typst Modern SaaS Edition
//  在我们共同设计下诞生的全新版本
//  设计语言：rounded card container · soft blue background · information card
//           layout · content highlight panel · modern SaaS style
// ============================================================================

// ---------- 色彩系统（modern SaaS blue）----------
#let accent       = rgb("2563EB")
#let accent-dark  = rgb("1D4ED8")
#let page-bg      = rgb("F5F9FF")
#let card-bg      = rgb("FFFFFF")
#let card-border  = rgb("DBEAFE")
#let panel-bg     = rgb("EFF6FF")
#let panel-border = rgb("BFDBFE")
#let muted        = rgb("64748B")
#let ink          = rgb("0F172A")
#let ink-soft     = rgb("334155")

// ---------- 页面与文字 ----------
#set page(
  paper: "a4",
  margin: (left: 1.4cm, right: 1.4cm, top: 1.2cm, bottom: 1.2cm),
  fill: page-bg,
)

#set text(
  font: ("Songti SC", "STSong"),
  size: 10pt,
  lang: "zh",
  region: "cn",
  fill: ink,
)

#set par(leading: 0.72em, spacing: 0.7em)

// ============================================================================
//  可复用组件
// ============================================================================

// 圆角卡片容器 —— modern SaaS card
#let card(body) = block(
  width: 100%,
  fill: card-bg,
  stroke: (thickness: 0.75pt, paint: card-border),
  radius: 10pt,
  inset: (x: 16pt, y: 13pt),
  breakable: true,
  body,
)

// soft blue 高亮面板 —— content highlight panel
#let highlight(body) = block(
  width: 100%,
  fill: panel-bg,
  stroke: (thickness: 0.5pt, paint: panel-border),
  radius: 7pt,
  inset: (x: 12pt, y: 9pt),
  spacing: 0.6em,
  body,
)

// 章节标题 —— 粗体强调色 + 短粗下划线
#let section-title(title) = block(width: 100%, spacing: 6pt)[
  #text(font: "Heiti SC", weight: "bold", size: 13pt, fill: accent-dark, tracking: 0.3pt)[#title]
  #v(-5pt)
  #line(length: 32pt, stroke: (thickness: 2.5pt, paint: accent))
]

// 小药丸（标签 + 值）
#let pill(label, value) = box(
  fill: panel-bg,
  radius: 5pt,
  inset: (x: 8pt, y: 3pt),
)[
  #text(size: 8.5pt, fill: accent-dark, weight: "bold")[#label]
  #h(3pt)
  #text(size: 8.5pt, fill: ink-soft)[#value]
]

// 单条联系信息行（label + value 药丸）
#let contact-row(label, value) = block(width: 100%, spacing: 0pt)[
  #text(size: 9pt, fill: muted, weight: "bold")[#label]
  #h(6pt)
  #pill("", value)
]

// 时间线条目：日期药丸 + 内容（单列堆叠，保证宽度）
#let entry(
  date: "",
  title: "",
  org: "",
  detail: "",
  body: none,
) = block(width: 100%, spacing: 6pt)[
  #box(
    fill: panel-bg,
    radius: 5pt,
    inset: (x: 9pt, y: 3pt),
  )[
    #text(size: 9pt, fill: accent-dark, weight: "bold")[#date]
  ]
  #v(4pt)
  #text(weight: "bold", size: 11pt, fill: ink)[#title]
  #if org != "" [
    #h(5pt)
    #text(size: 9.5pt, fill: muted)[· #org]
  ]
  #if detail != "" [
    #h(5pt)
    #text(size: 9.5pt, fill: accent)[#detail]
  ]
  #if body != none [
    #v(3pt)
    #text(size: 9.7pt, fill: ink-soft)[#body]
  ]
]

// 项目条目
#let project(name, desc, href: "") = block(width: 100%, spacing: 3pt)[
  #text(weight: "bold", size: 10.5pt, fill: accent-dark)[#name]
  #if href != "" [
    #h(6pt)
    #text(size: 9pt, fill: accent)[#link("https://" + href)[#href]]
  ]
  #v(1pt)
  #text(size: 9.5pt, fill: ink-soft)[#desc]
]

// 技能 mini-card
#let skill-card(category, desc) = block(
  width: 100%,
  fill: panel-bg,
  stroke: (thickness: 0.5pt, paint: panel-border),
  radius: 7pt,
  inset: (x: 12pt, y: 8pt),
  spacing: 3pt,
)[
  #text(font: "Heiti SC", weight: "bold", size: 10pt, fill: accent-dark)[#category]
  #text(size: 9pt, fill: ink-soft)[#desc]
]

// ============================================================================
//  正文
// ============================================================================

// -------- 头部：information card layout（单列稳定版）--------
//   头像 + 姓名区并排靠上；联系信息以「标签 + 药丸」分行罗列，可读且稳。
#card[
  // 头像 + 姓名 一行
  #block(width: 100%, spacing: 0pt)[
    #box(
      fill: panel-bg,
      radius: 12pt,
      clip: true,
      width: 1.7cm,
      height: 1.7cm,
    )[#image("avatar.png", width: 1.7cm, height: 1.7cm, fit: "cover")]

    #h(14pt)
    #box(
      fill: panel-bg,
      radius: 14pt,
      inset: (x: 0pt, y: 14pt),
      width: 1fr,
    )[
      #text(font: "Heiti SC", weight: "bold", size: 24pt, fill: ink)[张三]
      #h(8pt)
      #text(size: 11pt, fill: muted)[SanZhang]
      #h(8pt)
      #pill("生日", "1990/11/11")
    ]
  ]

  #v(8pt)

  // 联系信息：清晰的「标签 + 药丸」行
  #contact-row("手机", "18888888888")
  #v(3pt)
  #contact-row("邮箱", "me@resume.com")
  #v(3pt)
  #contact-row("GitHub", "github.com/geekplux")
  #v(3pt)
  #contact-row("微信", "xxxx")
  #v(3pt)
  #contact-row("博客", "geekplux.com")
  #v(3pt)
  #contact-row("QQ", "123456")
]

#v(6pt)

// -------- 工作经历 --------
#card[
  #section-title[工作经历]
  #entry(
    date: "2017.01 - 2017.12",
    title: "不长不短的公司名称",
    org: "可爱的项目",
    detail: "keaidexiangmu.com",
    body: [工作中，我负责了 xxx 的开发和维护，运用 yyy 技术解决了 zzz 的重大问题。积极参与开源社区贡献。],
  )
  #entry(
    date: "2016.01 - 2016.12",
    title: "好长的公司名称",
    org: "有趣的项目",
    detail: "youqudexiangmu.com",
    body: [工作中，我按照领导的要求编程，做出了让领导满意的作品，为公司做出了贡献。],
  )
  #entry(
    date: "2015.01 - 2015.12",
    title: "不知道叫什么的公司名称",
    org: "不可告人的项目",
    detail: "bukegaoren.com",
    body: [独立编写了项目简介，出色地完成了凑字数的工作，并获得了最佳凑字数员工奖。],
  )
]

#v(6pt)

// -------- 教育经历 --------
#card[
  #section-title[教育经历]
  #entry(
    date: "2011.09 - 2015.06",
    title: "本科",
    org: "尼姑庵大学",
    detail: "计算机科学与技术",
  )
  // 奖项内嵌为高亮面板
  #highlight[
    #text(size: 9pt, fill: accent-dark, weight: "bold")[所获奖项]
    #v(2pt)
    #text(size: 9.3pt, fill: ink-soft)[
      • 最快编程大师一等奖 \
      • 最强编程大师金奖 \
      • 第 x 届「编程杯」gayhub 赛区一等奖 \
      • 国家奖学金 / 三好学生 / 学生会主席 / *获得女朋友一个*
    ]
  ]
  #entry(
    date: "2015.09 - 2018.06",
    title: "硕士",
    org: "和尚庙大学",
    detail: "软件工程 · 实验室 XXX 导师 XXX",
    body: [主要研究了人工智能、图形学、编译原理、机械键盘的拆装、快递包装的暴力拆解、颈椎与视觉保养、抹平小腹、治疗腰椎间盘突出。],
  )
]

#v(6pt)

// -------- 项目 --------
#card[
  #section-title[项目]

  #text(font: "Heiti SC", weight: "bold", size: 10pt, fill: ink-soft)[科研项目]
  #v(4pt)
  #project("FFF-TNT", [建立深度学习模型，通过训练单身狗愤怒指数，预测 TNT 威力值，达到最后 FFF 全部的效果。])
  #project("NASA", [预测项目，研究如何把字数凑得更加优雅自然。])

  #v(6pt)
  #text(font: "Heiti SC", weight: "bold", size: 10pt, fill: ink-soft)[开源项目]
  #v(4pt)
  #highlight[
    #project(
      "markvis",
      [在 markdown 中直接生成可视化图表的插件，GitHub 1000 stars。],
      href: "markvis.js.org",
    )
    #v(4pt)
    #project(
      "netjsongraph.js",
      [用力导向图可视化无线路由图谱数据。],
      href: "github.com/netjson/netjsongraph.js",
    )
    #v(4pt)
    #project(
      "typing",
      [Hexo 静态博客主题。],
      href: "github.com/geekplux/hexo-theme-typing",
    )
    #v(4pt)
    #project(
      "UnityVis",
      [Unity 中的基本可视化图表。],
      href: "github.com/geekplux/Basic-Visualization-in-Unity",
    )
  ]
]

#v(6pt)

// -------- 技能 --------
#card[
  #section-title[技能]
  #skill-card("前端", [熟练掌握前端该会的东西，熟悉各类工具与原理。])
  #v(5pt)
  #skill-card("后端", [熟练掌握后端该会的东西，熟悉后端架构与原理。])
  #v(5pt)
  #skill-card("数据", [掌握数据处理与数据库，熟悉数据建模。])
  #v(5pt)
  #skill-card("其他", [熟练使用 Git / Vim / Emacs / Makefile。])
]

#v(6pt)

// -------- Publications --------
#card[
  #section-title[Publications]
  #highlight[
    #text(size: 9pt, fill: accent-dark, weight: "bold")[已录用]
    #h(6pt)
    #text(size: 9.3pt, fill: ink-soft)[张三，李四，王麻子. 基于 LaTeX 的简历凑字数研究\[C\], CVChina 2017.]
  ]
]
