#import "template/template.typ": *
#import "utils/typst-boxes.typ": *

#set text(lang: "zh")
#set par(first-line-indent: 2em,leading: 1.5*FSIZE.四号)
#set heading(
numbering: (
  (..nums) => (
    if nums.pos().map(str).len()==1 {
      nums.pos().map(str).at(0) + "."
    }
    else {
      nums.pos().map(str).join(".")
    }
    )
  ),
)// 这里不优雅，但是暂时没想到更好的办法

#let info = (
  clc: "CLC",
    thesis_id: "20240125",
    confidentiality_level: "公开",
    udc: "UDC",
    title: ("基于Typst的","南方科技大学毕业论文模板"),
    subtitle: "v0.0.2",
    author: "咕桃",
    student_id: "32123432",
    department: "计算机科学与工程系",
    major: "计算机科学与技术",
    supervisor: "南小科",
    submit_date: datetime.today(),
)

#let info_en = (
  clc: "CLC",
    thesis_id: "20240125",
    udc: "UDC",
    title: ("Graduation Thesis Template","Based on Typst"),
    subtitle: "v0.0.2",
    author: "GuTao",
    student_id: "32123432",
    department: "Computer Science and Engineering",
    major: "Computer Science and Technology",
    supervisor: "Prof. XiaoKe Nan",
    submit_date: datetime.today(),
)

#let keywords_zh = (
  "Typst",
  "南方科技大学",
  "毕业论文",
  "学术写作",
)

#let keywords_en = (
  "Typst",
  "SUSTech",
  "Graduation Thesis",
  "Academic Writing",
)

#cover(
  en: false,
  anonymous:false,
  info: info,
)

#cover(
  en: true,
  anonymous:false,
  info: info_en,
)

#declare(
  en: false,
  anonymous: false,
)

#declare(
  en: true,
  anonymous: false,
)

#set page(numbering: "I")
#counter(page).update(1)

#abstract(
  show_title: true,
  en: false,
  anonymous: false,
  info: info,
  keywords: keywords_zh
)[
  Typst是可用于出版的可编程标记语言，拥有变量、函数与包管理等现代编程语言的特性，其优点包括但不限于：语法简洁，源码可读性高，不会像LaTeX一样充斥着反斜杠与花括号；采用增量编译算法和版面缓存方案，编译效率接近常见Markdown渲染引擎，可以做到实时预览PDF，再也不用等LaTeX半小时一次的编译了；环境搭建简单，不需要像LaTeX一样折腾几个G的开发环境，无论是在线还是本地开发都是即开即用；排版工整，Typst提供了不输LaTeX的自动排版功能，规避了用Word进行学术写作时的神秘排版问题。笔者基于Typst重构了南方科技大学毕业论文模板，旨在为同学们提供更优雅的学术写作体验。欢迎通过issue，PR或邮件等方式提出宝贵意见和建议，共同完善模板。
]

#abstract(
  show_title: false, 
  en: true,
  anonymous: false,
  info: info_en,
  keywords: keywords_en
)[
  Typst, a programmable markup language for publishing, combines modern programming language features with advantages such as concise syntax, high readability, and efficient compilation. It eliminates LaTeX complexities, offering real-time PDF previews and easy setup. This projecct revamped a graduation thesis template for Southern University of Science and Technology, aiming to enhance the academic writing experience. Feedback is encouraged for ongoing template refinement via issues, pulling requests and emails etc.
]

#content()

#set page(numbering: "1")
#counter(page).update(1)

= 一级标题

== 二级标题

=== 三级标题

#lorem(50)@wang2010guide

=== 三级标题

#lorem(50)

== 二级标题

#figure(
  caption: link("https://www.bilibili.com/opus/792419765560803378")[May. 06, 2023 立夏，画师：\@Setaria_italica ],
  image(
    width: 50%,
    "./images/Lixia.jpg"
    )
)

= 一级标题

#lorem(200)@kopka2004guide

#references()

#appendix()
#set heading(numbering: none)

== 附录A 代码示例

#slantedColorbox(
  title: "Hello, world!",
  color: "gray",
  radius: 0pt,
  width: auto
)[
  #par(leading: 0.65em)[
    ```cpp
    #include <iostream>
    using namespace std;

    int main() {
      cout << "Hello, world!" << endl;
      return 0;
    }
    ```
  ]
]


#acknoledgement(en_title: true)[
  截至 #datetime_display_zh(datetime.today())，本模板当前版本为v0.0.2。 感谢在模板开发过程中提出宝贵意见和建议的同学们，以及每一位使用本模板的同学，你们的支持是模板不断更新迭代的动力，也是笔者最大的荣幸。
]