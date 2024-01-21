#import "cover_zh.typ": *
#import "decl_zh.typ": *
#import "abstract_zh.typ": *

#let cover(
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
  cover_zh(
    anonymous: anonymous,
    info: info,
    fonts: fonts,
  )
}

#let declare(
  anonymous: false
) = {
  decl_zh(
    anonymous: anonymous,
  )
}

#let abstract(
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
  abstract_zh(
    anonymous: anonymous,
    keywords: keywords,
    info: info,
    fonts: fonts,
  )[#body]
}