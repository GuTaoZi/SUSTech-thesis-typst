#import "../utils/font.typ" : *

#let abstract_header(
  anonymous: false,
  en: false,
  info_zh: (:),
  info_en: (:),
  fonts: (:),
) = {

  set align(center)

  if not en {
    for line in info_zh.title {
      text(size: FSIZE.二号, font: FONTS.黑体,line + "\n")
      // text(size: FSIZE.二号, font: FONTS.黑体,line)
    }

    if info_zh.subtitle != "" {
      align(right)[
        #text(size: FSIZE.小二, font: "Arial", "---")
        #text(size: FSIZE.小二, font: FONTS.黑体, info_zh.subtitle)
      ]
    }

    text(size: FSIZE.四号, font: FONTS.宋体)[
      #info_zh.author
    ]

    linebreak()
    
    text(size: FSIZE.小四, font: FONTS.楷体)[
      (#info_zh.department  指导教师：#info_zh.supervisor)\
      \
      \
    ]
  }
  else {
    for line in info_en.title {
      text(size: FSIZE.二号, font: FONTS.黑体,line + "\n")
      // text(size: FSIZE.二号, font: FONTS.黑体,line)
    }

    if info_en.subtitle != "" {
      align(right)[
        #text(size: FSIZE.小二, font: "Arial", "---")
        #text(size: FSIZE.小二, font: FONTS.黑体, info_en.subtitle)
      ]
    }

    text(size: FSIZE.四号, font: FONTS.宋体)[
      #info_en.author
    ]

    linebreak()

    text(size: FSIZE.小四, font: FONTS.楷体)[
      (#info_en.department #h(1em) Thesis Advisor: #info_en.supervisor)\
      \
      \
    ]
  }
}
