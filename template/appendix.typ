#import "../utils/style.typ": *

#let appendix(
  en_title: false,
) = {
  pagebreak(weak: true)
  align(center)[
    #hide[
      #heading(level: 1,numbering: none,"附录")
      #v(-20pt)
    ]

    #if en_title {
      par(leading: FSIZE.三号)[
        #text(font: FONTS.黑体,size: FSIZE.三号, "附录")
        #text(font: ("Source Han Sans SC", "Source Han Sans", "Noto Sans CJK SC", "SimHei", "Heiti SC", "STHeiti"),size: FSIZE.三号,"\nAppendix")
      ]
    }else{
      text(font: FONTS.黑体,size: FSIZE.三号, "附录")
    }
    
    \
  ]
}  