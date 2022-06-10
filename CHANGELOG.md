# Changelog

## [Unreleased]

### Changed

1. 代码重构.
2. 字体选项现通过关键字参数传入.
3. 调整了部分字体配置.
4. 为兼容将 `\IfPackageLoadedTF` 改回 `\@ifpackageloaded`

### Added

1. 用户若尝试调用 `caption` 会报错.
2. 调用了 `tabularx`.
3. 文档中增加了对下载, 安装和字体的说明; 增加了命令列表.

## 2022-06-06, [v2.0.2]

### cls

1. 微调了一些行距参数.
2. 表格脚注格式调整.
3. 使各 autorefname 通过 babel 重定义, 更可移值.
4. 删除了导致错误的 `\makeatother`

### doc

1. 修改了表格示例.
2. 改进了文档.
3. 增加了对部分半角标点的输入提示.

### readme

1. 修改了 typo 与格式.

## 2022-05-25, [v2.0.1]

### cls

1. 修复了 `diy` 选项的逻辑错误.

### doc

1. 修正了若干 typo.

## 2022-05-25, [v2.0]

### cls
1. 去除了非必要的外部宏包.
2. 添加了 `siunitx` 方便物理量输入.
3. 使得对附录中的节的 `\autoref` 产生 '附录' 字样而非 '小节'.
4. 去除在 `*.cls` 文件中冗余的 `\makeatletter` 命令.
5. 中文等宽字体改用仿宋系列.
6. 增加 `notofandol` 字体配置.
7. 引入 `babel` 管理部分中文化.
8. 引入 `quanjiao` 选项.

### doc
1. 添加了对外部宏包可能冲突的说明.
2. 使引用标记的位置符合规范.
3. Changelog 独立
4. 发布至 GitHub.

## 2022-04-30

1. 在 `README` 中增加了文件内容.
2. 基本完全依据 `bgmb.doc` 重写了 `template.pdf`.
3. 增加了 `matplotlib` 作图示例 `figgen.py`.
4. 改变了配置字体的实现方法.
5. 更改了页边距.
6. 更改了摘要宽度.
7. 纸张大小改为 A4 而非默认的 Letter.
8. 优化了 PDF 自动生成的书签以及元数据.
9. 新增 `\emailphone` 命令, 以合理显示手机号.
10. 将段落开头间距改为两个汉字字符.

## 2022-03-19

`*.cls` 初版本.

[Unreleased]: https://github.com/CastleStar14654/PKUMpLtX/compare/v2.0.2...HEAD
[v2.0.2]:     https://github.com/CastleStar14654/PKUMpLtX/compare/v2.0.1...v2.0.2
[v2.0.1]:     https://github.com/CastleStar14654/PKUMpLtX/compare/v.2.0...v2.0.1
[v2.0]:       https://github.com/CastleStar14654/PKUMpLtX/releases/tag/v.2.0
