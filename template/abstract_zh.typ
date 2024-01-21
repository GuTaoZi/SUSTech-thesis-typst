#import "../utils/style.typ" : *

#let abstract_zh(
  anonymous: false,
  info: (:),
  fonts: (:),
  keywords: (:),
  body,
) = {

  set par(leading: 1.5em)

  fonts = FONTS + fonts

  set align(center)
  for line in info.title {
    text(size: FSIZE.二号, font: FONTS.黑体,line + "\n")
    // text(size: FSIZE.二号, font: FONTS.黑体,line)
  }

  align(right)[
    #text(size: FSIZE.小二, font: "Arial", "---")
    #text(size: FSIZE.小二, font: FONTS.黑体, info.subtitle)
  ]

  text(size: FSIZE.四号, font: FONTS.宋体)[
    #info.author

  ]


  text(size: FSIZE.小四, font: FONTS.楷体)[
    (#info.department  指导教师：#info.supervisor)\
    \
    \
  ]

  align(left)[
    #par(leading: 25pt)[
      #text(size: FSIZE.三号, font: FONTS.黑体)[
          \[摘要\]：
      ]
      #text(size: FSIZE.四号, font: FONTS.宋体)[
          #body
      ]
    ]
  ]

  align(left+bottom)[
    #par(leading: 25pt)[
        #text(size: FSIZE.三号, font: FONTS.黑体)[
            \[关键词\]：
        ]
        #text(size: FSIZE.四号, font: FONTS.宋体)[
            #(("",)+ keywords.intersperse("；")).sum()
        ]
    ]
  ]
}