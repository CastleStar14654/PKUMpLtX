# Changelog

## 2023-02-13, [v2.1.4]

### Added

1. 添加了对 `physics2` 宏包的广告 (by @AlphaZTX ).
   + 如果试图导入 `physics` 宏包，会警告并推荐 `physics2`. 

## 2022-09-24, [v2.1.3]

### Changed

1. 字体选项变化
   + `default` (默认选项) 的行为变为采用 `xeCJK` 的默认配置. 亦即，全系为 fandol 字体, 用楷体作为衬线意大利体, 无衬线字体没有意大利体. 也就是说, 现在 `default` 和 `diy` 行为一致.
     + 所以, 如果什么选项都不传, 用户可以自行用 `\setCJK*font` 配置.
   + 原 `default` 选项变为 `fandol`, 亦即作者配置的版本, 用仿宋作为衬线意大利体.
   + 考虑到初次使用的用户体验, `template.tex` 的示例字体选项不再是 `notofandol`, 而是 `default`.
   + 文档有相应修改.

### Added

1. 一个提示阅读 [`README.md`](README.md) 的空文件.

## 2022-08-27, [v2.1.2]

### Changed

1. 一些格式化.
2. 不再默认导入 `physics`, 而是改为可选项; `\qty` 恢复为 `siunitx` 的命令, `physics` 的命名为 `\qtyp`. (Thanks @AlphaZTX )

### Added

1. 新提到了 `fixdif` 宏包.

### Fixed

1. 去除示例文档中的英文破折号 em-dash 两侧空格, 以符合大多数格式规范的要求.

## 2022-06-16, [v2.1.1]

### Added

1. 对模板文件添加了大量必要的引用与超链接.
2. 对说明文档添加了更详细的安装等说明.
2. 对说明文档添加了英文字体说明.

### Fixed

1. 修复 PDF 书签中摘要为空白的问题.

## 2022-06-12, [v2.1]

### Changed

1. 代码重构, 重命名了内部变量, 为兼容性更多使用 `\patchcmd`
2. 字体选项现通过关键字参数传入.
3. 调整了部分字体配置.
4. 为兼容性将 `\IfPackageLoadedTF` 改回 `\@ifpackageloaded`

### Added

1. 用户若尝试调用 `caption` 会报错.
2. 调用了 `tabularx`.
3. 文档中增加了对下载, 安装和字体的说明; 增加了命令列表.
4. 对字体配置存在的影响显示效果的问题做了说明.

### Removed

1. `git` 文件夹不再保留编译后的 PDF. 将仅通过 [Releases](https://github.com/CastleStar14654/PKUMpLtX/releases) 发布.

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

[Unreleased]: https://github.com/CastleStar14654/PKUMpLtX/compare/v2.1.4...HEAD
[v2.1.4]:     https://github.com/CastleStar14654/PKUMpLtX/compare/v2.1.3...v2.1.4
[v2.1.3]:     https://github.com/CastleStar14654/PKUMpLtX/compare/v2.1.2...v2.1.3
[v2.1.2]:     https://github.com/CastleStar14654/PKUMpLtX/compare/v2.1.1...v2.1.2
[v2.1.1]:     https://github.com/CastleStar14654/PKUMpLtX/compare/v2.1...v2.1.1
[v2.1]:     https://github.com/CastleStar14654/PKUMpLtX/compare/v2.0.2...v2.1
[v2.0.2]:     https://github.com/CastleStar14654/PKUMpLtX/compare/v2.0.1...v2.0.2
[v2.0.1]:     https://github.com/CastleStar14654/PKUMpLtX/compare/v.2.0...v2.0.1
[v2.0]:       https://github.com/CastleStar14654/PKUMpLtX/releases/tag/v.2.0
