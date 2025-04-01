# 南方科技大学学位论文 SUSTech-thesis-typst

\* 本项目绝赞施工中，欢迎参与开发或提出宝贵意见！

南方科技大学毕业论文（设计）的Typst模板，适用于学术写作，编译渲染高效，语法结构简单，排版自由美观。本模板按照[南方科技大学本科生毕业论文（设计）撰写规范](https://tao.sustech.edu.cn/xueshengfuwu/biyelunwen)进行编写，但由于本模板并非官方模板，**存在不被认可的风险**。

示例论文：[thesis.pdf](./build/thesis.pdf)

## 为什么选择Typst?

1. $\LaTeX$ 语法更为繁冗，从源码中较难定位文本。在文本数量增多后编译时间也会极大增加。

2. Word在写手不够熟练时容易出现排版混乱的问题，经常性的手动调整部分格式等重复性工作拖累学术写作。

Typst 是可用于出版的可编程标记语言，拥有变量、函数与包管理等现代编程语言的特性，注重于科学写作 (science writing)，定位与 LaTeX 相似。Typst拥有活跃的社区与完善的文档，可以阅读[Typst Official Tutorial](https://typst.app/docs/tutorial/)或[小蓝书](https://typst-doc-cn.github.io/tutorial/)快速上手。

- 如果你是有经验的 Word 写手，可以参考[面向 Word 用户的快速入门向导](https://typst-doc-cn.github.io/guide/word.html)。
- 如果你是有经验的 $\LaTeX$ 写手，可以参考[LaTeX 用户指南](https://typst-doc-cn.github.io/docs/guides/guide-for-latex-users/)。

## 搭建编写环境

### 在线编辑

Typst提供了[Web App](https://typst.app/)以支持在线编辑，其使用类似于用Overleaf编写LaTeX，但Typst的增量编译实时渲染让学术写作效率与体验远超LaTeX，极大提高效率和开发体验。

目前Typst Web App对自行上传字体的支持尚不完善，本模板涉及的字体并未完全被在线编辑器支持，因此在使用该模板时推荐使用本地编辑，不过平时写作业/报告使用Web App绰绰有余。

### 本地编辑(推荐)

1. 克隆本仓库到本地

```bash
git clone https://github.com/GuTaoZi/SUSTech-thesis-typst.git
```

2. 推荐使用 VS Code 插件[Tinymist Typst](https://github.com/Myriad-Dreamin/tinymist) 进行预览和编辑，或使用Typst官方提供的[命令行工具](https://github.com/typst/typst/releases)进行预览。

![开发环境示意图](https://s2.loli.net/2024/01/21/VBqM3uoxA7yJ2t4.png)

3. 在导出为PDF时，可以使用插件或以下命令，将`thesis.pdf`生成到build目录下，也可以`typst --help`了解更多用法。

```bash
# 请安装Typst并添加可执行文件路径到PATH
typst compile --font-path fonts thesis.typ ./build/thesis.pdf
```

## 项目结构说明

- `template`目录下定义了论文各个部分的排版格式
- `utils`目录包括了一些常用的小工具，例如字体设置
- 默认使用主目录下的`thesis.typ`作为主要编写文档
- 推荐将图片放在`images`目录下，便于管理
- 在`references.bib`文件中添加BibTex格式的参考文献，引用的具体使用方法请移步[官方教程](https://typst.app/docs/reference/model/cite/)

## **开发进度**
- [x] 学士学位模板
    - [x] 中文封面
    - [x] 英文封面
    - [x] 诚信承诺书
    - [x] 中文摘要
    - [x] 英文摘要
    - [x] 目录页
	- [x] 引用与脚注
	- [x] 图片、表格与代码块
	- [x] 公式
    - [x] 致谢
    - [ ] 插图目录
    - [ ] 表格目录
    - [ ] 符号表

## 参与贡献

模板中可能存在Bug和不优雅的实现，欢迎大家对本模板进行完善改进，为大家提供更舒适优雅的学术写作环境。

- 关于使用中的问题与未来特性的需求，请通过在本仓库提交issue进行反馈。
- 非常欢迎通过提交PR等方式实现特性、修复问题、协助项目开发。

## 致谢

- 感谢[梁钰栋学长](https://github.com/iydon)开发的 $\LaTeX$ 版本学士学位论文模板[sustechthesis](https://github.com/iydon/sustechthesis)，本项目开发过程中参考了其排版。
- 感谢[nju-thesis-typst](https://github.com/nju-lug/nju-thesis-typst)等基于Typst的中文学位论文模板，文档详细结构清晰，本项目开发过程中多有借鉴。

