#import "../utils/font.typ": *

#let list_of_figures(show_both: true) = {
  context {
    align(center)[
      #hide[
        #heading(
          level: 1,
          numbering: none,
          if text.lang == "en" { "List of Figures" } else { "插图目录" },
        )
        #v(-20pt)
      ]
      #text(
        font: FONTS.黑体,
        size: FSIZE.三号,
        weight: "bold",
        if show_both {
          "插图目录\nList of Figures"
        } else {
          if text.lang == "en" { "List of Figures" } else { "插图目录" }
        },
      )
    ]
  }

  v(3em)
  set text(font: FONTS.宋体, size: FSIZE.小四)
  outline(title: none, target: figure.where(kind: image))
}
