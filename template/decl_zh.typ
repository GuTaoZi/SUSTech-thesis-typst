#import "../utils/font.typ" : *
#import "../utils/datetime_display.typ": datetime_display_zh


#let decl_zh(
  anonymous: false,
  print_date: datetime.today()
) = {
  if anonymous{
    return
  }

  align(center)[
    #text(font: FONTS.宋体,size: FSIZE.三号, datetime_display_zh(
      print_date,
    ))
    \
    #v(1.8em)
    #text("诚信承诺",size: FSIZE.二号,font: FONTS.黑体, weight: "bold")
    #v(3em)
  ]

  set text(size: FSIZE.四号,font: FONTS.宋体)
	par(first-line-indent: 2em)[
		1\. 本人郑重承诺所呈交的毕业设计（论文），是在导师的指导下，独立进行研究工作所取得的成果，所有数据、图片资料均真实可靠。
	]
	par(first-line-indent: 2em)[
		2\. 除文中已经注明引用的内容外，本论文不包含任何其他人或集体已经发表或撰写过的作品或成果。对本论文的研究作出重要贡献的个人和集体，均已在文中以明确的方式标明。
	]
	par(first-line-indent: 2em)[
		3\. 本人承诺在毕业论文（设计）选题和研究内容过程中没有抄袭他人研究成果和伪造相关数据等行为。
	]
	par(first-line-indent: 2em)[
		4\. 在毕业论文（设计）中对侵犯任何方面知识产权的行为，由本人承担相应的法律责任。
	]
	
  // Autograph Area: Updated to match Word template
  align(right)[
    #block(width: 14em)[
      #align(left)[
        #text("作者签名：")
      ]
    ]
    #block(width: 14em)[
      #align(left)[
        #text("________年____月____日")
      ]
    ]
  ]
}