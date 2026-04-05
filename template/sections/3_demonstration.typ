#import "../../lib.typ": dataSource, force_indent

= 示例特性

== 段落与公式

此段落用于演示公式后的缩进处理。
$
  bold(c) = integral_(H^2) f (bold(p), bold(omega)_i, bold(omega)_o) L_i (bold(p), bold(omega)_i) abs(bold(N) dot bold(omega)_i) d bold(omega)_i
$
其中 $H^2$ 代表积分的半球。

#force_indent()
此段落演示 `#force_indent()` 的典型使用方式。

== 引用与表格 <引用示例>

如 @图片示例 和 @表格示例 所示，Typst 的引用与交叉引用写法较为直接，适合模板示例中的图表和章节跳转演示。

#figure(
  caption: "图片示例",
  image(
    width: 30%,
    "../../images/Lixia.jpg",
  ),
)<图片示例>

#figure(
  table(
    columns: 4,
    [],
    [col-1],
    [col-2],
    [col-3],
    [row-1],
    [1,1],
    [1,2],
    [1,3],
    [row-2],
    [2,1],
    [2,2],
    [2,3],
  ),
  caption: "表格示例",
)<表格示例>

#dataSource("表格数据来源：模板示例数据")
