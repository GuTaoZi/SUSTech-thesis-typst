#import "../utils/font.typ": *

#let references(
  bibPath: "../references.bib",
  show_both: false
) = {
  pagebreak(weak: true)
  context {
    align(center)[
      #hide[
        #heading(
          level: 1,
          numbering: none,
          if text.lang == "en" {"References"} else {"参考文献"}
        )
        #v(-20pt)
      ]
      #text(
        font: FONTS.黑体,
        size: FSIZE.三号,
        weight: "bold",
        if show_both {
          "参考文献\nReferences"
        }
        else {
          if text.lang == "en" {"References"} else {"参考文献"}
        }
      )
      #v(3em)
      #set text(
        font: FONTS.宋体,
        size: FSIZE.五号
      )
      #bibliography(
        bibPath,
        title: none,
        style: if text.lang == "en" {"institute-of-electrical-and-electronics-engineers"} else {"gb-7714-2005-numeric"}
      )
    ]
  }
}  