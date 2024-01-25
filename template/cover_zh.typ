#import "../utils/datetime_display.typ" : *
#import "../utils/style.typ" : *
#import "@preview/tablex:0.0.6" : *

#let cover_zh(
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
        columns: (10em,auto),
        rect(
            width: 10em,
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
        "分类号",
        info.clc,
      )
    ],
    align(right)[
#display_info_top(
        "编 号",
        info.thesis_id,
      )
    ],
  )

  v(-1cm)

  gridx(
    columns: (50%,50%),
    align(left)[
#display_info_top(
        "U  D  C",
        info.udc,
      )
    ],
    align(right)[
#display_info_top(
        "密 级",
        info.confidentiality_level,
      )
    ],
  )

  set align(center)

  if(anonymous){
    text("under consturction")
  }
  else{
    
  }

  image("../assets/logo_zh.svg",width: 13cm)

  v(-10pt)

  text("本科生毕业设计（论文）",size: FSIZE.小初,font: FONTS.宋体,weight: 600)

  v(40pt)

  // render info

  let title_rows = info.title.len()

  let it = 0
  while it < title_rows {
    if it == 0 {
      display_info(
        "题　　目：",
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
    "姓　　名：",
    info.author,
  )
  display_info(
    "学　　号：",
    info.student_id,
  )
  display_info(
    "院　　系：",
    info.department,
  )
  display_info(
    "专　　业：",
    info.major,
  )
  display_info(
    "指导教师：",
    info.supervisor,
  )
  // render submit date
  align(center+bottom)[
  #text(font: FONTS.宋体,size: FSIZE.三号,datetime_display_zh(
    info.submit_date,
  ))]
}