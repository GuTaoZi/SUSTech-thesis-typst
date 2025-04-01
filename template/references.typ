#import "../utils/font.typ": *

#let references(
  bibPath: "../references.bib",
  en_title: false,
) = {
  pagebreak(weak: true)
  align(center)[
    #hide[
      #heading(level: 1,numbering: none,"参考文献")
      #v(-20pt)
    ]// 这个实现也挺难受的，自动生成目录时会自动抓取标题原本的样式，如果把下面的文字塞进heading.body，那么目录里就会出现三号黑体的“参考文献”
    #text(font: FONTS.黑体,size: FSIZE.三号,weight: "bold", "参考文献")
    #if en_title [
      #text(font: ("Source Han Sans SC", "Source Han Sans", "Noto Sans CJK SC", "SimHei", "Heiti SC", "STHeiti"),size: FSIZE.三号,weight: "bold", "\nReferences")
    ]
  ]
  v(3em)
  set text(font: FONTS.宋体,size: FSIZE.五号)
  bibliography(bibPath, title: none, style: "gb-7714-2005-numeric")
}  