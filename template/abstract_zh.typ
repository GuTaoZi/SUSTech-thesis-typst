#import "../utils/font.typ" : *

#let abstract_zh(
  info: (:),
  fonts: (:),
  keywords: (:),
  body,
) = {

  fonts = FONTS + fonts

  align(left)[
    #par(first-line-indent: 0em)[
      #text(size: FSIZE.三号, font: FONTS.黑体, "[摘要]：")
      #text(size: FSIZE.四号, font: FONTS.宋体, body)
    ]
  ]

  align(left+bottom)[
    #par(first-line-indent: 0em)[
        #text(size: FSIZE.三号, font: FONTS.黑体,"[关键词]：")
        #text(size: FSIZE.四号, font: FONTS.宋体)[
            #(("",)+ keywords.intersperse("；")).sum()
        ]
    ]
  ]
}