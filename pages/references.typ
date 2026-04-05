#import "@preview/gb7714-bilingual:0.2.3": gb7714-bibliography
#import "../utils/font.typ": *

#let references(
  show_both: false,
  full: false,
) = {
  pagebreak(weak: true)
  context align(center)[
    #hide[
      #heading(
        level: 1,
        numbering: none,
        if text.lang == "en" { "References" } else { "参考文献" },
      )
      #v(-20pt)
    ]
    #text(
      font: FONTS.黑体,
      size: FSIZE.三号,
      weight: "bold",
      if show_both {
        "参考文献\nReferences"
      } else {
        if text.lang == "en" { "References" } else { "参考文献" }
      },
    )
  ]

  v(3em)
  set text(font: FONTS.宋体, size: FSIZE.五号)
  gb7714-bibliography(title: none, full: full)
}
