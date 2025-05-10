#import "../utils/font.typ": *

#let appendix(
  show_both: true
) = {
  pagebreak(weak: true)
  context {
    align(center)[
      #hide[
        #heading(
          level: 1,
          numbering: none,
          if text.lang == "en" {"Appendix"} else {"附录"}
        )
        #v(-20pt)
      ]
      #text(
        font: FONTS.黑体,
        size: FSIZE.三号,
        weight: "bold",
        if show_both {
          "附录\nAppendix"
        } else {
          if text.lang == "en" {"Appendix"} else {"附录"}
        }
      )

      \
    ]
  }
}  