#import "../utils/font.typ": *

#let content_zh(
) = {

  set align(center)
  text(font: FONTS.黑体, size: FSIZE.小二, "目录")

  set text(font: FONTS.宋体, size: FSIZE.小四)

  show outline.entry.where(
    level: 1
  ): it => {
    strong(it)
  }

  outline(title: none)

}