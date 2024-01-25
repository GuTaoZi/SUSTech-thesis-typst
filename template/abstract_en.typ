#import "../utils/style.typ" : *

#let abstract_en(
  show_title: true,
  anonymous: false,
  info: (:),
  fonts: (:),
  keywords: (:),
  body,
) = {

  fonts = FONTS + fonts

if show_title {
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
    (#info.department  Thesis Advisor：#info.supervisor)\
    \
    \
  ]}

  align(left)[
    #par(first-line-indent: 0em)[
      #text(size: FSIZE.三号, font: FONTS.黑体, "[Abstract]: ")
      #text(size: FSIZE.四号, font: FONTS.宋体,body)
    ]
  ]

  align(left+bottom)[
    #par(first-line-indent: 0em)[
        #text(size: FSIZE.三号, font: FONTS.黑体,"[Key Words]: ")
        #text(size: FSIZE.四号, font: FONTS.宋体)[
            #(("",)+ keywords.intersperse(", ")).sum()
        ]
    ]
  ]
}