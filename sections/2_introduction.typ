= Introduction (`sections/2_introduction.typ`)

This is an introductory section included from `thesis.typ`.

Document assembly now lives behind the public `setup(...)` API, so ordinary chapter files usually do not need any imports.

关于中文科技论文摘要写作的常见规范，可参考 @wang2010guide；如果需要对比传统排版工具的章节组织方式，也可以参考 @kopka2004guide。

If a chapter needs shared helpers, import only the public symbols you use:
```typst
#import "../lib.typ": force_indent, dataSource
```

That keeps chapter files focused on content and keeps internal layout/page modules out of user code.
