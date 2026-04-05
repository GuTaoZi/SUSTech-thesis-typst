// For published package usage, switch to:
// #import "@preview/sustech-thesis-typst:0.1.0": setup
#import "../lib.typ": setup
#import "../utils/datetime_display.typ": datetime_display_zh

#let thesis = setup(
  lang: "zh",
  info: (
    title: ("基于 Typst 的", "南方科技大学论文模板示例"),
    subtitle: "template entry",
    author: "示例作者",
    student_id: "12000000",
    department: "计算机科学与工程系",
    major: "计算机科学与技术",
    supervisor: "示例导师",
  ),
  info_en: (
    title: ("SUSTech Thesis Template", "Starter Project"),
    subtitle: "template entry",
    author: "Example Author",
    student_id: "12000000",
    department: "Computer Science and Engineering",
    major: "Computer Science and Technology",
    supervisor: "Example Supervisor",
  ),
  keywords_zh: ("Typst", "SUSTech", "模板"),
  keywords_en: ("Typst", "SUSTech", "Template"),
  bibliography_data: read("ref.bib"),
  abstract_body_zh: [
    这是一个用于 `typst init` 风格使用场景的模板入口示例。用户应主要修改本文件中的元数据，并按需增删 `sections/` 下的章节内容。
  ],
  abstract_body_en: [
    This is a starter thesis entry intended for package-style initialization. Most users only need to edit the metadata here and adjust the chapters under `sections/`.
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
  截至 #datetime_display_zh(datetime.today())，此模板入口用于演示推荐的项目组织方式：通过统一 `setup(...)` 配置前置部分，再在正文和附录中按需组织章节。
]
