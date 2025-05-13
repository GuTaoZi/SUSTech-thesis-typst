#import "../template/template.typ": *
= 示例 (`sections/3_demonstration.typ`)

== 段落缩进与公式缩进

此段落用以演示特性：在文章首段落缩进2字符。

此段落用以演示特性：不再在公式结束时首行缩进。
$
  bold(c) = integral_(H^2) f (bold(p), bold(omega)_i, bold(omega)_o) L_i (bold(p), bold(omega)_i) abs(bold(N) dot bold(omega)_i) d bold(omega)_i
$
其中$H^2$代表积分的半球。

此段落用以演示特性：标记公式的结束并换行。要强制换行，使用`#force_indent()`.
$
  bold(c) = integral_(H^2) f (bold(p), bold(omega)_i, bold(omega)_o) L_i (bold(p), bold(omega)_i) abs(bold(N) dot bold(omega)_i) d bold(omega)_i.
$

#force_indent()
此段落标记一般不会出现的换行测试。

== 引用示例 <引用示例>

#lorem(20)@wang2010guide #lorem(20) @kopka2004guide 如 @图片示例 和 @表格示例 所示，Typst提供了方便的引用功能，我们也可以通过在标题后加`<some-tag-name>`引用特定的段落，就像 @引用示例 所述的那样。

== 脚注示例

#lorem(20)#footnote("这是一个脚注示例")

$
a^2 = b^2 + c^2
$ <pt2>

This is a reference of equation @pt from another subsection, and the above equation @pt2.

== 图片示例

#figure(
  caption: link("https://www.bilibili.com/opus/792419765560803378")[May. 06, 2023 立夏，画师：\@Setaria_italica ],
  image(
    width: 30%,
    "../images/Lixia.jpg"
  )
) <图片示例>

== 表格示例

#figure(
	table(
		columns: 4,
		[],[col-1],[col-2],[col3],
		[row-1],[1,1],[1,2],[1,3],
		[row-2],[2,1],[2,2],[2,3],
		[row-3],[3,1],[3,2],[3,3],
	),
	caption: "表格示例"
)<表格示例>
#dataSource("表格数据来源：实验数据")