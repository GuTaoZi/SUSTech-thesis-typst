#import "lib.typ": setup
#import "utils/datetime_display.typ": datetime_display_zh

#let thesis = setup(
  lang: "zh",
  info: (
    clc: "CLC",
    thesis_id: "20260405",
    confidentiality_level: "公开",
    udc: "UDC",
    title: ("基于Typst的", "南方科技大学毕业论文模板"),
    subtitle: "v0.1.0",
    author: "咕桃",
    student_id: "32123432",
    department: "计算机科学与工程系",
    major: "计算机科学与技术",
    supervisor: "南小科",
    submit_date: datetime.today(),
  ),
  info_en: (
    clc: "CLC",
    thesis_id: "20260405",
    udc: "UDC",
    title: ("Graduation Thesis Template", "Based on Typst"),
    subtitle: "v0.1.0",
    author: "GuTao",
    student_id: "32123432",
    department: "Computer Science and Engineering",
    major: "Computer Science and Technology",
    supervisor: "XiaoKe Nan",
    submit_date: datetime.today(),
  ),
  keywords_zh: (
    "Typst",
    "南方科技大学",
    "毕业论文",
    "学术写作",
  ),
  keywords_en: (
    "Typst",
    "SUSTech",
    "Graduation Thesis",
    "Academic Writing",
  ),
  bibliography_data: read("references.bib"),
  abstract_body_zh: [
    Typst是可用于出版的可编程标记语言，拥有变量、函数与包管理等现代编程语言的特性，其优点包括但不限于：语法简洁，源码可读性高，不会充斥反斜杠与花括号；采用增量编译算法和版面缓存方案，编译效率接近常见Markdown渲染引擎，可以做到实时预览PDF；环境搭建简单，无论是在线还是本地开发都是即开即用；排版工整，Typst提供了不输LaTeX的自动排版功能，规避了用Word进行学术写作时的排版问题。笔者基于Typst重构了南方科技大学毕业论文模板，旨在为同学们提供更优雅的学术写作体验。欢迎通过issue，PR或邮件等方式提出宝贵意见和建议，共同完善模板。
  ],
  abstract_body_en: [
    Typst, a programmable markup language for publishing, combines modern programming language features with advantages such as concise syntax, high readability, and efficient compilation. It eliminates LaTeX complexities, offering real-time PDF previews and easy setup. This project revamped a graduation thesis template for Southern University of Science and Technology, aiming to enhance the academic writing experience. Feedback is encouraged for ongoing template refinement via issues, pull requests and emails.
  ],
  include_list_of_figures: true,
  include_list_of_tables: true,
)

#show: thesis.style

#(thesis.preface)()

#(thesis.mainmatter)[
  #include "sections/1_lorem.typ"
  #include "sections/2_introduction.typ"
  #include "sections/3_demonstration.typ"
]

#set heading(numbering: none)
#(thesis.references)()

#(thesis.appendix)[
  #include "sections/appendix.typ"
]

#(thesis.acknowledgement)[
  截至 #datetime_display_zh(datetime.today())，本模板当前版本为v0.1.0。感谢在模板开发过程中提出宝贵意见和建议的同学们，以及每一位使用本模板的同学。
]
