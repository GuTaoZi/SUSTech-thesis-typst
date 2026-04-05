#import "font.typ": *
#import "style.typ": force_indent as force_indent_impl

#let force_indent = force_indent_impl

#let data_source(body) = {
  set align(center)
  text(
    font: FONTS.宋体,
    size: FSIZE.五号,
    body,
  )
}

#let dataSource(body) = data_source(body)
