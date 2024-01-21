#import"template/template.typ":*

#let info = (
  clc: "CLC",
    thesis_id: "No.1",
    confidentiality_level: "公开",
    udc: "UDC",
    title: ("基于Typst的","南方科技大学毕业论文模板"),
    subtitle: "v0.0.1",
    author: "咕桃",
    student_id: "32123432",
    department: "计算机科学与工程系",
    major: "计算机科学与技术",
    supervisor: "南小科",
    submit_date: datetime.today(),
)

#let keywords = (
  "Typst",
  "南方科技大学",
  "毕业论文",
  "学术写作",
)

#cover(
  anonymous:false,
  info: info,
)

#declare(
  anonymous: false,
)

#abstract(
  anonymous: false,
  info: info,
  keywords: keywords
)[
  Typst是可用于出版的可编程标记语言，拥有变量、函数与包管理等现代编程语言的特性，其优点包括但不限于：语法简洁，源码可读性高，不会像LaTeX一样充斥着反斜杠与花括号；采用增量编译算法和版面缓存方案，编译效率接近常见Markdown渲染引擎，可以做到实时预览PDF，再也不用等LaTeX半小时一次的编译了；环境搭建简单，不需要像LaTeX一样折腾几个G的开发环境，无论是在线还是本地开发都是即开即用；排版工整，Typst提供了不输LaTeX的自动排版功能，规避了用Word进行学术写作时的神秘排版问题。笔者基于Typst重构了南方科技大学毕业论文模板，旨在为同学们提供更优雅的学术写作体验。欢迎通过issue或邮件等方式提出宝贵意见和建议，共同完善模板。
]


