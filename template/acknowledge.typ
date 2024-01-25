#import "../utils/style.typ": *

#let acknoledgement(
  en_title: false,
  body
) = {
  pagebreak(weak: true)
  align(center)[
    #hide[
      #heading(level: 1,numbering: none,"致谢")
      #v(-20pt)
    ]

    #if en_title {
      par(leading: FSIZE.三号)[
        #text(font: FONTS.黑体,size: FSIZE.三号, "致谢")
        #text(font: ("Source Han Sans SC", "Source Han Sans", "Noto Sans CJK SC", "SimHei", "Heiti SC", "STHeiti"),size: FSIZE.三号,"\nAcknowledgement")
      ]
    }else{
      text(font: FONTS.黑体,size: FSIZE.三号, "致谢")
    }
    \
  ]

  par(first-line-indent: 2em,leading: 1.5 *FSIZE.小四)[
     #text(font: FONTS.宋体,size: FSIZE.小四, body)
  ]
}  