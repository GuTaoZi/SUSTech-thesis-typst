#import "../utils/datetime_display.typ" : *
#import "../utils/style.typ" : *
#import "@preview/tablex:0.0.6" : *

#let cover_en(
  anonymous: false,
  fonts: (:), 
  info: (:),
) = {

  let display_info_top(
    term,
    value,
  ) = {
    block(
      width: 100%,
      gridx(
        columns: (auto,-15pt,auto),
        rect(
            stroke: none,
            text(font: FONTS.宋体,size: FSIZE.小四,term)
        ),
        "",
        rect(
          width: 3cm,
          stroke: (bottom: 1pt + black),
          align(center)[
            #text(font : FONTS.宋体, size : FSIZE.小四, value)
          ]
        )
      )
    )
  }

  let display_info(
    term,
    value,
  ) = {
    block(
      width: 100%,
      gridx(
        columns: (14em,auto),
        rect(
            width: 14em,
            stroke: none,
            align(right)[
              #text(font: FONTS.宋体,size: FSIZE.三号,weight: "bold",term)
            ]
        ),
        rect(
          width: 9.5cm,
          stroke: (bottom: 1pt + black),
          align(center)[
            #text(font : FONTS.宋体, size : FSIZE.三号, weight : "bold", value)
          ]
        )
      )
    )
    v(-10pt)
  }


  // render cover
  gridx(
    columns: (50%,50%),
    align(left)[
#display_info_top(
        "CLC",
        info.clc,
      )
    ],
    align(right)[
#display_info_top(
        "Number",
        info.thesis_id,
      )
    ],
  )

  v(-1cm)

  gridx(
    columns: (50%,50%),
    align(left)[
#display_info_top(
        "UDC",
        info.udc,
      )
    ],
    align(right+horizon)[
      #text(font: FONTS.宋体,size: FSIZE.小四,"Available for reference   ◻Yes ◻No")
    ],
  )

  set align(center)

  if(anonymous){
    text("under consturction")
  }
  else{
    
  }

  image("../assets/logo_en.svg",width: 13cm)

  v(-10pt)

  text("Undergraduate Thesis",size: FSIZE.小初,font: FONTS.宋体)

  v(40pt)

  // render info

  let title_rows = info.title.len()

  let it = 0
  while it < title_rows {
    if it == 0 {
      display_info(
        "Thesis Title：",
        info.title.at(0),
      )
    }
    else{
      display_info(
        "",
        info.title.at(it),
      )
    }
    it = it + 1
  }

  display_info(
    " ",
    info.subtitle,
  )

  display_info(
    "Student Name：",
    info.author,
  )
  display_info(
    "Student ID：",
    info.student_id,
  )
  display_info(
    "Department：",
    info.department,
  )
  display_info(
    "Program：",
    info.major,
  )
  display_info(
    "Thesis Advisor：",
    info.supervisor,
  )
  // render submit date
  align(center+bottom)[
  #text(font: FONTS.宋体,size: FSIZE.三号,datetime_display_en(
    info.submit_date,
  ))]
}
