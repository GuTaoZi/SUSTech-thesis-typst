# 南方科技大学学位论文 SUSTech-thesis-typst

\* 本项目绝赞施工中，欢迎参与开发或提出宝贵意见！

南方科技大学毕业论文（设计）的Typst模板，拥有Markdown的实时渲染与简洁语法，不输$\LaTeX$的自动排版，如Word写作一样轻松上手。本模板按照[南方科技大学本科生毕业论文（设计）撰写规范](https://tao.sustech.edu.cn/studentService/graduation_project.html)进行编写，但由于本模板并非官方模板，**存在不被认可的风险**。

查看示例论文：[thesis.pdf](./build/thesis.pdf)

## 为什么选择Typst?

1. $\LaTeX$语法复杂，可读性低，要从通篇都是反斜杠和花括号的源码中定位文本费时费力。同时在文本数量增多后，编译一次用时几分钟，浪费时间是对写作者的慢性谋杀。

2. Word排版不够优雅，时常出现各种血压情况与排版问题，且每一段都需要手动调整格式，没有技术含量的重复性工作拖累学术写作。

Typst 是可用于出版的可编程标记语言，拥有变量、函数与包管理等现代编程语言的特性，注重于科学写作 (science writing)，定位与 LaTeX 相似。可以阅读[@OrangeX4](https://github.com/OrangeX4):[Typst 中文用户使用体验](https://zhuanlan.zhihu.com/p/669097092) 进一步了解 Typst 的优势。

Typst拥有活跃的社区与完善的文档，可以阅读[Typst Official Tutorial](https://typst.app/docs/tutorial/)或[Typst 中文文档网站](https://typst-doc-cn.github.io/docs/)快速上手，如果你是有经验的$\LaTeX$写手，可以参考[LaTeX 用户指南](https://typst-doc-cn.github.io/docs/guides/guide-for-latex-users/)。

## 搭建编写环境

### 在线编辑

Typst提供了[Web App](https://typst.app/)以支持在线编辑，其使用类似于用Overleaf编写LaTeX，但Typst的增量编译实时渲染让学术写作效率与体验远超recompile一次要一年的LaTeX，极大提高效率和开发体验。

目前Typst Web App对自行上传字体的支持尚不完善，本模板涉及的字体并未完全被在线编辑器支持，因此在使用该模板时推荐使用本地编辑，不过平时写作业/报告使用Web App绰绰有余。

### 本地编辑(推荐)

1. 克隆本仓库到本地

```bash
git clone https://github.com/GuTaoZi/SUSTech-thesis-typst.git
```

2. 使用Visual Studio Code打开此文件夹，安装以下插件以支持Typst本地编辑与预览：
- [Typst LSP](https://marketplace.visualstudio.com/items?itemName=nvarner.typst-lsp)
- [Typst Preview](https://marketplace.visualstudio.com/items?itemName=mgt19937.typst-preview)
- [Typst Companion](https://marketplace.visualstudio.com/items?itemName=CalebFiggers.typst-companion)

3. 打开目录下的`thesis.typ`，使用`CTRL+SHIFT+P`快捷键输入命令`Typst Preview: Preview current file`，即可实时渲染论文了，同时也可以进行双向定位。

![开发环境示意图](https://s2.loli.net/2024/01/21/VBqM3uoxA7yJ2t4.png)

4. 在导出为PDF时，可以使用以下命令，将`thesis.pdf`生成到build目录下，也可以`typst --help`了解更多用法。

```bash
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
    - [ ] 英文封面
    - [x] 诚信承诺书
    - [x] 中文摘要
    - [x] 英文摘要
    - [ ] 目录页
    - [ ] 插图目录
    - [ ] 表格目录
    - [ ] 符号表
    - [ ] 致谢

## 参与贡献

一个人的力量总是有限的，模板中可能存在Bug和不优雅的实现，欢迎大家对本模板进行完善改进，为大家提供更舒适优雅的学术写作环境。

- 关于使用中遇到的问题与未来特性的需求，请通过在本仓库提交issue进行反馈。
- 非常欢迎通过提交PR等方式实现特性，修复问题，协助项目开发。

## 致谢

- 感谢[梁钰栋学长](https://github.com/iydon)开发的$\LaTeX$版本学士学位论文模板[sustechthesis](https://github.com/iydon/sustechthesis)，本项目开发过程中参考了其排版。
- 感谢[nju-thesis-typst](https://github.com/nju-lug/nju-thesis-typst)等基于Typst的中文学位论文模板，文档详细结构清晰，本项目开发过程中多有借鉴。

