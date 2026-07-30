// ============================================================================
//  cv_resume · Typst Editorial Premium Edition
//  在我们共同设计下诞生的全新版本
//  设计语言：出血式深海军蓝全高侧栏 + 白底主栏 · PingFang 无衬线
//           克制单色配色 · 编辑级排版 · 填满整页 A4
// ============================================================================

// ---------- 色彩系统（premium navy editorial）----------
#let navy        = rgb("17233B")
#let navy-light  = rgb("1E2E4D")
#let side-line   = rgb("2C3E5F")
#let side-text   = rgb("E6EBF2")
#let side-muted  = rgb("9AA7BD")
#let side-accent = rgb("8FB4E8")
#let ink         = rgb("16202E")
#let body-txt    = rgb("3A4552")
#let muted       = rgb("7A8391")
#let accent      = rgb("1E3A66")
#let rule        = rgb("DFE3E8")
#let soft        = rgb("F2F5F9")

// ---------- 侧栏组件 ----------
#let ssection(title) = block(width: 100%, spacing: 8pt)[
  #text(font: "PingFang SC", weight: "medium", size: 9.5pt, fill: side-accent, tracking: 2.5pt)[#title]
  #v(-4pt)
  #line(length: 100%, stroke: (thickness: 0.5pt, paint: side-line))
]

#let scontact(label, value) = block(width: 100%, spacing: 7pt)[
  #text(size: 8pt, fill: side-muted)[#label]
  #v(-2pt)
  #text(size: 8.8pt, fill: side-text)[#value]
]

#let sskill(category, desc) = block(width: 100%, spacing: 7pt)[
  #text(size: 9pt, fill: side-text, weight: "bold")[#category]
  #v(-2pt)
  #text(size: 8.4pt, fill: side-muted)[#desc]
]

// ---------- 主栏组件 ----------
#let msection(title) = block(width: 100%, spacing: 9pt)[
  #text(font: "PingFang SC", weight: "bold", size: 12.5pt, fill: accent, tracking: 1.5pt)[#title]
  #v(-4pt)
  #line(length: 100%, stroke: (thickness: 0.7pt, paint: rule))
]

#let entry(
  date: "",
  title: "",
  org: "",
  detail: "",
  body: none,
) = block(width: 100%, spacing: 4pt)[
  #text(font: "PingFang SC", weight: "bold", size: 10.5pt, fill: ink)[#title]
  #if org != "" [
    #h(4pt)
    #text(size: 9pt, fill: body-txt)[#org]
  ]
  #if detail != "" [
    #h(4pt)
    #text(size: 8.6pt, fill: muted)[#detail]
  ]
  #h(1fr)
  #text(size: 8.6pt, fill: muted)[#date]
  #if body != none [
    #v(3pt)
    #text(size: 9pt, fill: body-txt)[#body]
  ]
]

#let project(name, desc, href: "") = block(width: 100%, spacing: 2pt)[
  #text(weight: "bold", size: 9.4pt, fill: ink)[#name]
  #if href != "" [
    #h(5pt)
    #text(size: 8.2pt, fill: accent)[#link("https://" + href)[#href]]
  ]
  #text(size: 8.8pt, fill: body-txt)[ — #desc]
]

// ============================================================================
//  页面：出血式深海军蓝全高侧栏（绘制于页面背景）
// ============================================================================
#set text(
  font: ("PingFang SC", "Songti SC"),
  size: 9pt,
  lang: "zh",
  region: "cn",
  fill: body-txt,
)
#set par(leading: 0.95em, spacing: 0.9em, justify: true)

#set page(
  paper: "a4",
  margin: (left: 7.2cm, right: 1.6cm, top: 1.5cm, bottom: 1.5cm),
  fill: rgb("FFFFFF"),
  background: place(
    left + top,
    block(width: 6.4cm, height: 100%, fill: navy, inset: (x: 18pt, y: 42pt))[
      // 头像（圆形 + 浅蓝描边环）
      #align(center)[
        #box(
          fill: navy-light,
          radius: 50%,
          stroke: (thickness: 2pt, paint: side-accent),
          clip: true,
          width: 2.1cm,
          height: 2.1cm,
        )[#image("avatar.png", width: 2.1cm, height: 2.1cm, fit: "cover")]
      ]
      #v(10pt)
      #align(center)[
        #text(font: "PingFang SC", weight: "bold", size: 23pt, fill: rgb("FFFFFF"))[张　三]
      ]
      #v(3pt)
      #align(center)[
        #text(size: 9.5pt, fill: side-accent, tracking: 3pt)[SAN ZHANG]
      ]
      #v(4pt)
      #align(center)[
        #text(size: 8.6pt, fill: side-muted)[1990 / 11 / 11]
      ]

      #v(20pt)

      #ssection[联系方式]
      #scontact("手机", "18888888888")
      #scontact("邮箱", "me@resume.com")
      #scontact("GitHub", "github.com/geekplux")
      #scontact("微信", "xxxx")
      #scontact("博客", "geekplux.com")
      #scontact("QQ", "123456")

      #v(20pt)

      #ssection[专业技能]
      #sskill("前端", [熟练掌握前端技术栈，熟悉各类工具与原理。])
      #sskill("后端", [熟练掌握后端技术，熟悉系统架构与原理。])
      #sskill("数据", [掌握数据处理与数据库，熟悉数据建模。])
      #sskill("工程", [熟练使用 Git / Vim / Emacs / Makefile。])

      #v(20pt)

      #ssection[语言能力]
      #sskill("中文", [母语，书面与口头表达俱佳。])
      #sskill("英语", [流利，可阅读技术文档与日常交流。])

      #v(20pt)

      #ssection[兴趣爱好]
      #text(size: 8.6pt, fill: side-muted)[开源贡献 · 篮球 · 写作 · 摄影]
    ],
  ),
)

// ============================================================================
//  主栏内容（右侧白底区域）
// ============================================================================
#text(font: "PingFang SC", weight: "bold", size: 12.5pt, fill: accent, tracking: 1.5pt)[个人总结]
#v(-4pt)
#line(length: 100%, stroke: (thickness: 0.7pt, paint: rule))
#text(size: 9pt, fill: body-txt)[
  一名注重工程质量与用户体验的开发者，热衷开源与技术分享。擅长把复杂问题拆解为清晰可维护的方案，追求代码与产品体验的极致平衡。乐于在团队协作中推动技术落地，持续关注前端工程化与可视化领域的前沿实践，期望用技术创造真正的价值。
]

#v(14pt)

#msection[工作经历]
#entry(
  date: "2017.01 - 2017.12",
  title: "高级前端工程师",
  org: "不长不短的公司名称",
  detail: "可爱的项目",
  body: [负责核心产品的开发与维护，运用现代化技术栈解决了关键性能瓶颈，主导核心模块重构与工程化升级，积极参与开源社区贡献。],
)
#v(7pt)
#entry(
  date: "2016.01 - 2016.12",
  title: "前端工程师",
  org: "好长的公司名称",
  detail: "有趣的项目",
  body: [按照产品目标完成高质量交付，优化关键路径渲染性能，建立组件化开发规范，获得团队与用户一致认可。],
)
#v(7pt)
#entry(
  date: "2015.01 - 2015.12",
  title: "开发工程师",
  org: "不知道叫什么的公司名称",
  detail: "不可告人的项目",
  body: [独立完成核心功能开发，建立工程规范与代码审查流程，出色完成各项任务并获年度最佳员工。],
)

#v(14pt)

#msection[教育经历]
#entry(
  date: "2015.09 - 2018.06",
  title: "硕士 · 软件工程",
  org: "和尚庙大学",
  detail: "实验室 XXX · 导师 XXX",
  body: [主要研究人工智能、图形学、编译原理等方向，发表多篇学术论文。],
)
#v(7pt)
#entry(
  date: "2011.09 - 2015.06",
  title: "本科 · 计算机科学与技术",
  org: "尼姑庵大学",
)
#v(3pt)
#block(
  width: 100%,
  fill: soft,
  radius: 4pt,
  inset: (x: 10pt, y: 7pt),
  spacing: 2pt,
)[
  #text(size: 8.2pt, fill: accent, weight: "bold")[所获奖项　]
  #text(size: 8.4pt, fill: body-txt)[最快编程大师一等奖 · 最强编程大师金奖 · 第 x 届「编程杯」一等奖 · 国家奖学金 · 三好学生 · 学生会主席]
]

#v(14pt)

#msection[项目经历]
#project("markvis", [在 markdown 中直接生成可视化图表的插件，GitHub 1000 stars], href: "markvis.js.org")
#v(4pt)
#project("netjsongraph.js", [用力导向图可视化无线路由图谱数据], href: "github.com/netjson/netjsongraph.js")
#v(4pt)
#project("typing", [Hexo 静态博客主题], href: "github.com/geekplux/hexo-theme-typing")
#v(4pt)
#project("UnityVis", [Unity 中的基本可视化图表库], href: "github.com/geekplux/Basic-Visualization-in-Unity")

#v(14pt)

#msection[学术发表]
#text(size: 9pt, fill: body-txt)[张三，李四，王麻子. 基于 LaTeX 的简历凑字数研究\[C\]. CVChina, 2017.]
