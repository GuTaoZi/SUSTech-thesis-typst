# 南方科技大学学位论文 SUSTech-thesis-typst

南方科技大学毕业论文（设计）的 Typst 模板，当前以本地模板工程为主，同时补上了 package 化入口与模板示例工程，方便继续向 Typst Universe 风格演进。

本模板按照 [南方科技大学本科生毕业论文（设计）撰写规范](https://tao.sustech.edu.cn/xueshengfuwu/biyelunwen) 进行编写，但由于本模板并非官方模板，**存在不被认可的风险**。

示例论文见 [`build/thesis.pdf`](./build/thesis.pdf)。

## 本地使用

推荐使用 VS Code + [Tinymist Typst](https://github.com/Myriad-Dreamin/tinymist) 或 Typst CLI 本地编辑。

```bash
typst compile --font-path fonts thesis.typ build/thesis.pdf
typst watch --font-path fonts thesis.typ build/thesis.pdf
typst compile --root . --font-path fonts template/thesis.typ build/thesis-template.pdf
```

默认入口为根目录下的 `thesis.typ`，适合直接在当前仓库内预览和调整模板。

## 公共 API

仓库现在提供 `lib.typ` 作为统一入口，推荐通过 `setup(...)` 收口论文元数据和前置部分配置，而不是手动拼接各个页面模块。

当前只内置本科 profile。`setup(...)` 默认绑定 `undergraduate_profile`，因此现有调用方式不需要修改；后续如果扩展硕士或博士支持，可以在同一入口下切换 profile。当前已支持通过配置项开启插图目录与表格目录。

```typ
#import "lib.typ": setup

#let thesis = setup(
  lang: "zh",
  bibliography_data: read("references.bib"),
  info: (title: ("标题上行", "标题下行")),
  info_en: (title: ("English Title", "Subtitle")),
)

#show: thesis.style
#(thesis.preface)()
#(thesis.mainmatter)[
  // your chapters
]
```

参考文献配置也统一收口在 `setup(...)` 中。当前实现基于 `gb7714-bilingual`，默认采用 GB/T 7714-2015 顺序编码制；如需著者-出版年制，可改为 `bibliography_style: "author-date"`。文献数据当前只接收 BibTeX 文本，推荐直接传 `read("references.bib")`，多文件可用 `read("a.bib") + read("b.bib")` 合并。

```typst
#let thesis = setup(
  bibliography_data: read("references.bib"),
  bibliography_style: "author-date",
  bibliography_standard: "2015",
  bibliography_full: false,
)
```

## 模板示例工程

`template/thesis.typ` 是新的模板入口示例，配合 `template/sections/` 和 `template/ref.bib` 展示推荐的项目结构。由于该文件会向上导入 `../lib.typ`，本地直接编译时请显式添加 `--root .`。`template/` 现在只保留 starter 示例；可复用页面与装配实现已经拆分到 `pages/`、`layouts/`、`utils/` 和 `lib.typ`。

## 项目结构

- `lib.typ`：公共导出入口
- `profiles/`：学校/学位规范配置，当前仅 `undergraduate.typ`
- `layouts/`：文档装配与页面编排
- `pages/`：封面、声明、摘要、目录、参考文献等可复用页面
- `template/`：starter 示例工程
- `utils/`：字体、日期、样式与公共 helper
- `sections/`：根示例工程章节
- `references.bib`：根示例工程参考文献
- `docs/`：重构规划与实施文档

## 当前状态

- 已完成本科模板基础页面
- 已完成 package 元数据、统一 `setup(...)` 入口与页面/示例分层
- 已完成插图目录、表格目录
- 已升级到 `gb7714-bilingual` 的 GB/T 7714-2015 参考文献实现
- 已支持 `numeric` 与 `author-date` 两种引用模式
- 当前参考文献数据源为 BibTeX；Hayagriva 暂未封装到公共 API
- 尚未完成符号表
- 尚未完成硕士、博士模板支持

## 参与贡献

- 问题反馈与需求建议请提交 issue
- 结构性改动前建议先阅读 [`docs/reconstruction-roadmap.md`](./docs/reconstruction-roadmap.md)
- 当前 P0 执行计划见 [`docs/plans/2026-04-05-p0-package-and-api-foundation.md`](./docs/plans/2026-04-05-p0-package-and-api-foundation.md)

## 致谢

- [sustechthesis](https://github.com/iydon/sustechthesis)
- [modern-nju-thesis](https://github.com/nju-lug/modern-nju-thesis)
- [better-thesis](https://github.com/sysu/better-thesis)
