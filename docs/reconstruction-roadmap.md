# 面向当前仓库的重构任务列表

## 目标

将当前仓库从“可直接修改的本科论文模板工程”重构为“可发布的 Typst 模板包 + 示例工程 + 基础验证体系”，参考 `modern-nju-thesis` 与 `better-thesis` 的项目组织方式，同时保留当前仓库已经完成的页面实现。

## P0：架构与发布形态

### 1. 完成 package 化
- 新增 `typst.toml`
- 新增 `lib.typ` 或 `export.typ` 作为统一导出入口
- 在 `typst.toml` 中声明 `[package]` 与 `[template]`
- 增加 `thumbnail` 资源，满足 Universe 发布要求

### 2. 拆分“库代码”和“示例工程”
- 保留 `template/` 作为示例模板入口
- 将当前 [`thesis.typ`](/Users/KevinHuge/Project/SUSTech-thesis-typst/thesis.typ) 的用户示例部分迁入新的模板入口
- 将可复用逻辑迁入 `lib.typ`、`layouts/`、`pages/`、`utils/`

### 3. 统一配置 API
- 设计 `setup(...)` 或 `documentclass(...)` 入口
- 将论文元数据、语言、匿名模式、参考文献样式、附录开关等统一收口
- 避免用户继续手动串联 `#cover`、`#declare`、`#abstract`、`#references`

## P1：目录与模块重组

### 4. 引入分层结构
- 新增 `layouts/`：正文、前置部分、附录、分页与页眉页脚
- 新增 `pages/`：封面、声明、摘要、目录、致谢、参考文献等
- 保留 `utils/`：字体、日期、通用 helper
- 将 `sections/` 明确为示例内容，而非模板实现

### 5. 为未来多学位支持预留规范层
- 先抽象本科与研究生的共同字段和差异字段
- 视复杂度新增 `specifications/` 或 `profiles/`
- 当前阶段至少不要把本科逻辑继续写死在通用入口里

## P1：功能补全

### 6. 补齐前置与附录相关页面
- 插图目录
- 表格目录
- 符号表
- 更完整的附录页样式与编号规则

### 7. 升级参考文献实现
- 从当前 `gb-7714-2005-numeric` 升级到 `GB/T 7714-2015`
- 支持 `numeric` 与 `author-date` 两种模式
- 明确 BibTeX / Hayagriva 的兼容策略

## P2：工程化与质量保障

### 8. 增加最小验证样例
- 新建 `examples/` 或 `tests/`
- 分别覆盖封面、摘要、目录、参考文献、附录、双语场景
- 确保变更可通过最小样例快速回归

### 9. 增加自动化
- 新增 GitHub Actions 自动编译模板 PDF
- PR 中执行编译检查
- 可选增加发布流程与 release 附件

### 10. 完善开发者文档
- 重写 README，区分“安装”“本地开发”“作为包使用”“常见问题”
- 增加 API 示例
- 补充字体要求、已知限制、学校规范来源

## 建议执行顺序

1. `typst.toml` + `lib.typ`
2. 重构目录并分离示例工程
3. 设计统一配置入口
4. 迁移本科模板到新架构
5. 补齐缺失页面
6. 增加示例验证与 CI
7. 再推进硕士/博士支持
