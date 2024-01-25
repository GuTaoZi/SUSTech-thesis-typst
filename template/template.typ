#import "abstract_zh.typ" : *
#import "abstract_en.typ" : *
#import "acknowledge.typ" : *
#import "appendix.typ" : *
#import "content_zh.typ" : *
#import "cover_zh.typ" : *
#import "cover_en.typ" : *
#import "decl_zh.typ" : *
#import "decl_en.typ": *
#import "references.typ" : *

#let cover(
  en: false,
  anonymous: false,
  info: (:),
  fonts: (:),
) = {
  info = ( 
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
  )+info
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
  anonymous: false
) = {
  if(en){
    decl_en(anonymous: anonymous)
  } else {
    decl_zh(anonymous: anonymous)
  }
  pagebreak(weak: true)
}

#let abstract(
  show_title: true,
  en: false,
  anonymous: false,
  keywords: (:),
  info: (:),
  fonts: (:),
  body,
) = {
  info = (
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
  )+info
  if(en){
    abstract_en(
      show_title: show_title,
      anonymous: anonymous,
      keywords: keywords,
      info: info,
      fonts: fonts,
    )[#body] 
  } else {
    abstract_zh(
      show_title: show_title,
      anonymous: anonymous,
      keywords: keywords,
      info: info,
      fonts: fonts,
    )[#body]
  }
  pagebreak(weak: true)
}

#let content() = {
  content_zh()
  pagebreak()
}