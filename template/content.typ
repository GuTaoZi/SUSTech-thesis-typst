#import "../utils/font.typ": *

#let content_zh(
) = {

  set align(center)
  context {
    text(
      font: FONTS.黑体,
      size: FSIZE.小二,
      weight: "bold",
      if text.lang == "zh" {"目录"} else {"Table of Content"},
    )
  }

  set text(font: FONTS.宋体, size: FSIZE.小四)

  show outline.entry.where(
    level: 1
  ): it => {
    strong(it)
  }

  outline(title: none)

}