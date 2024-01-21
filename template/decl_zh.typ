#import "../utils/style.typ" : *


#let decl_zh(
  anonymous: false
) = {
  if anonymous{
    return
  }
  set align(center)
  text("诚信承诺书",size: FSIZE.二号,font: FONTS.黑体, weight: "bold")
  set align(left)
  set text(size: FSIZE.四号,font: FONTS.宋体)
  par(leading: 1.5em,first-line-indent: 2em)[
  \
  \

  1\. 本人郑重承诺所呈交的毕业设计（论文），是在导师的指导下，独立进行研究工作所取得的成果，所有数据、图片资料均真实可靠。

  2\. 除文中已经注明引用的内容外，本论文不包含任何其他人或集体已经发表或撰写过的作品或成果。对本论文的研究作出重要贡献的个人和集体，均已在文中以明确的方式标明。

  3\. 本人承诺在毕业论文（设计）选题和研究内容过程中没有抄袭他人研究成果和伪造相关数据等行为。

  4\. 在毕业论文（设计）中对侵犯任何方面知识产权的行为，由本人承担相应的法律责任。

  \
  \
  \
  \
  ]
  align(right)[
    #block(width: 12em)[
      #align(left)[
        #text("作者签名：")

        #text("________年____月____日")
      ]
    ]
  ]
  pagebreak()
}