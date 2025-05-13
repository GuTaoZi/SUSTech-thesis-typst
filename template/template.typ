#import "abstract_header.typ": *
#import "abstract_zh.typ": *
#import "abstract_en.typ": *
#import "acknowledge.typ": *
#import "appendix.typ": *
#import "content.typ": *
#import "cover_zh.typ": *
#import "cover_en.typ": *
#import "decl_zh.typ": *
#import "decl_en.typ": *
#import "references.typ": *
#import "../utils/style.typ": documentClass, force_indent

#let cover(
  en: false,
  anonymous: false,
  info: (:),
  fonts: (:),
) = {
  info = (
    (
      clc: "CLC",
      thesis_id: "Thesis ID",
      confidentiality_level: "Confidential Level",
      udc: "UDC",
      title: "Title",
      subtitle: "Subtitle",
      author: "Author",
      student_id: "Student ID",
      department: "Department",
      major: "Major",
      supervisor: "Supervisor",
      submit_date: datetime.today(),
    )
      + info
  )
  if en {
    cover_en(
      anonymous: anonymous,
      info: info,
      fonts: fonts,
    )
  } else {
    cover_zh(
      anonymous: anonymous,
      info: info,
      fonts: fonts,
    )
  }
  pagebreak(weak: true)
}

#let declare(
  en: false,
  anonymous: false,
  print_date: datetime.today(),
) = {
  if (en) {
    decl_en(anonymous: anonymous, print_date: print_date)
  } else {
    decl_zh(anonymous: anonymous, print_date: print_date)
  }
  pagebreak(weak: true)
}

#let make_default_abstract_info(
  info: (:),
) = {
  let ret = (
    (
      clc: "CLC",
      thesis_id: "Thesis ID",
      confidentiality_level: "Confidential Level",
      udc: "UDC",
      title: "Title",
      subtitle: "Subtitle",
      author: "Author",
      student_id: "Student ID",
      department: "Department",
      major: "Major",
      supervisor: "Supervisor",
      submit_date: datetime.today(),
    )
      + info
  )
  return ret
}

#let abstract(
  show_title: true,
  prefer_en_header: false,
  en: false,
  anonymous: false,
  keywords_zh: (:),
  keywords_en: (:),
  info_zh: (:),
  info_en: (:),
  fonts: (:),
  body_zh: "",
  body_en: "",
) = {
  info_zh = make_default_abstract_info(info: info_zh)
  info_en = make_default_abstract_info(info: info_en)

  abstract_header(
    en: prefer_en_header, // By default thesis header should be Chinese no matter what
    anonymous: anonymous,
    fonts: fonts,
    info_zh: info_zh,
    info_en: info_en,
  )

  if (en) {
    // en first
    abstract_en(
      keywords: keywords_en,
      info: info_en,
      fonts: fonts,
    )[#body_en]

    pagebreak(weak: true)

    abstract_zh(
      keywords: keywords_zh,
      info: info_zh,
      fonts: fonts,
    )[#body_zh]
  } else {
    abstract_zh(
      keywords: keywords_zh,
      fonts: fonts,
    )[#body_zh]

    pagebreak(weak: true)

    abstract_en(
      keywords: keywords_en,
      fonts: fonts,
    )[#body_en]
  }

  pagebreak(weak: true)
}

#let content() = {
  content_zh()
  pagebreak()
}

#let dataSource(
  body,
) = {
  set align(center)
  text(
    font: FONTS.宋体,
    size: FSIZE.五号,
    body,
  )
}
