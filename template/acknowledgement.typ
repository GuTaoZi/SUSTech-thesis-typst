#import "../utils/font.typ": *

#let acknowledgement(
  show_both: false,
  body
) = {
  pagebreak(weak: true)
  context {
    align(center)[
      #hide[
        #heading(
          level: 1,
          numbering: none,
          if text.lang == "en" {"Acknowledgements"} else {"致谢"}
        )
        #v(-20pt)
      ]
    #text(
      font: FONTS.黑体,
      size: FSIZE.三号,
      weight: "bold",
      if show_both {
        "致谢\nAcknowledgements"
      }
      else {
        if text.lang == "en" {"Acknowledgements"} else {"致谢"}
      }
    )

    \
    ]

    par(first-line-indent: 2em,leading: 1.5 *FSIZE.小四)[
       #text(font: FONTS.宋体,size: FSIZE.小四, body)
    ]
  }
}  