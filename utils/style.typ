#import "@preview/codly:1.2.0": *
#import "@preview/codly-languages:0.1.7": *
// 官方模板就代码块样式没有作要求，因此本模板使用codly插件来渲染代码块。
// 使用说明：https://typst.app/universe/package/codly/

#import "headings.typ" : *

// Generate a fake paragraph for indent at the next paragraph
#let force_indent() = [#context {[#box();#v(-measure(block()+block()).height)]}]

#let documentClass(lang: "zh", body) = [
	// 标题样式
	#import "@preview/cuti:0.3.0": show-cn-fakebold
	#show: show-cn-fakebold
	#set heading(numbering: sustech-undergraduate-heading-numbering)
	#show heading: it => {
		set text(
			font: FONTS.黑体,
			size: array.at(heading-size, (it.level)-1),
			weight: "regular",
		)
		it
		v(-0.5*FSIZE.小四)
    par(leading: 1.0em)[#text(size:0.0em)[#h(0.0em)]] // Fake paragraph for first-line-indent of the actual first paragraph
	}
	// 正文样式
	#set text(
		lang: lang,
		font: FONTS.宋体,
		size: FSIZE.小四,
	)
	#set par(
		first-line-indent: (
			amount: 2*FSIZE.小四,
			all: false,
		),
		leading: 1.5*FSIZE.小四,
	)
	// 图片样式
	#show figure.caption: it => {
		set text(
			font: FONTS.黑体,
			size: FSIZE.五号,
			weight: "regular",
		)
		it
	}
	// 表格样式
	#show figure.where(
		kind: table
	): set figure.caption(position: top)
	// 代码块样式
	#show: codly-init.with()
	#codly(
		languages: codly-languages,
		display-name: false,
		display-icon: false,
		zebra-fill: none,
	)
	// 页码样式
	#set page(
		footer: context [
			#set align(center)
			#set text(
				font: "Times New Roman",
				size: FSIZE.五号,
			)
			#counter(page).display()
		]
	)
	// Formula Style
	#set math.equation(numbering: num => "(" + (counter(heading).get() + (num,)).map(str).join(".") + ")")
	#body
]