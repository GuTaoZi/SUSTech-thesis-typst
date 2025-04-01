#import "../utils/font.typ" : *
#import "../utils/datetime_display.typ": datetime_display_en


#let decl_en(
  anonymous: false,
  print_date: datetime.today()
) = {
  if anonymous{
    return
  }
  
  align(center)[
    #text(font: FONTS.宋体,size: FSIZE.三号, datetime_display_en(
      print_date,
    ))
    \
    #v(1.8em)
    #text("COMMITMENT OF HONESTY",size: FSIZE.二号,font: FONTS.黑体)
    #v(3em)
  ]

  set text(size: FSIZE.四号,font: FONTS.宋体)
  par(first-line-indent: 0em)[
    \
    \
    1\. I solemnly promise that the paper presented comes from my independent research work under my supervisor's supervision. All statistics and images are real and reliable.\
    2\. Except for the annotated reference, the paper contents no other published work or achievement by person or group. All people making important contributions to the study of the paper have been indicated clearly in the paper.\
    3\. I promise that I did not plagiarize other people's research achievement or forge related data in the process of designing topic and research   content.\
    4\. If there is violation of any intellectual property right, I will take legal responsibility myself.\
    \
    \
    \
    \
  ]
  align(right)[
    #block(width: 11em)[
      #align(left)[
        #text("Signature:")
      ]
    ]
    #block(width: 11em)[
      #align(left)[
        #text("Date:")
      ]
    ]
  ]
}