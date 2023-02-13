# `PKUMpLtX`, [项目页]

*A LaTeX document class for 'Modern Physics Laboratory' in PKU based on [`revtex4-2`]*

+ Copyright (C) 2013--2022. Modern Phys. Lab, School of Phys., Peking Univ.
+ Copyright (C) 2013--2014. Sun Sibai <niasw_at_pku.edu.cn>
+ Copyright (C) 2013. Cao Chuanwu <>
+ Copyright (C) 2021--2022. Lin Xuchen <linxc_at_pku.edu.cn>

This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International
License. To view a copy of this license, visit [`LICENSE`]
or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

希望本模板能帮助同学们专注报告内容, 减少在格式等问题上不必要的时间消耗.
(虽然使用 $\mathrm{\LaTeX{}}$ 会带来另外一些细节问题)
本模板不保证可靠性.

- [下载](#下载)
  - [\[可选\] 安装](#可选-安装)
- [文件内容](#文件内容)
- [使用方法](#使用方法)
  - [编译](#编译)
  - [字体选项](#字体选项)
    - [关于中文字体的进一步说明](#关于中文字体的进一步说明)
    - [英文字体与 `unicode-math`](#英文字体与-unicode-math)
  - [标点选项](#标点选项)
  - [`physics` 宏包导入选项](#physics-宏包导入选项)
  - [新定义的命令列表](#新定义的命令列表)
- [自动调用的宏包](#自动调用的宏包)
  - [其他需要注意的外部宏包](#其他需要注意的外部宏包)
- [反馈](#反馈)

## 下载

+ 稳定版: 前往 [Releases] 页面下载最新版本的 `Source code` 文件.
+ 最新: 在[项目页]下载最新源代码.
+ `git clone`: 如果会使用 git, 可以直接 `git clone` 本项目. 之后可以直接 `pull` 获取更新.
  + 加上 `--filter=blob:none` 选项可以减小下载大小 (比如不下载曾经被 `git` 跟踪的 PDF 文件).

### \[可选\] 安装

+ 不想折腾的话直接将 [`mpltx.cls`] 复制/链接到编写报告的当前文件夹, 然后按[使用方法](#使用方法)中描述的那样在 `*.tex` 中调用即可.
+ 如果想要正经地安装这个宏包, 从而不用每次手动复制/链接:
  + 请找到用户的 $\mathrm{\TeX}$ 根目录位置 (`$TEXMF`).
    + $\mathrm{\TeX\ Live}$ 用户: 应该就是 `$HOME/texmf` (*nix) 或者 `%USERPROFILE%\texmf` (Windows).
    + $\mathrm{MiK\TeX}$ 用户: 建议如 $\mathrm{\TeX\ Live}$ 那样在用户文件夹创建 `texmf` 文件夹, **然后在 $\mathrm{MiK\TeX}$ Console 中注册该文件夹**, 请参考[文档说明](https://miktex.org/faq/local-additions).
  + 将整个 `PKUMpLtX` 文件夹移动到 `$TEXMF/tex/latex`.
    + 所以, 实际上可以直接在 `$TEXMF/tex/latex` 进行 `git clone`.
  + 需要使用 `mktexlsr` 命令刷新文件名数据库缓存.
  + (可选) 将 [`template.tex`], [`bibli.bib`] 和 [`fig/`] 复制到其他文件夹, 测试能否正常编译. 注意修改开头的[字体选项](#字体选项).
+ 为测试本模板可以正常工作, 请在**修改开头的[字体选项](#字体选项)后**尝试[编译](#编译) [`template.tex`]. 结果文档应该除了字体外, 与 [Releases] 页面供下载的 PDF 文件完全一致.

## 文件内容

+ [`mpltx.cls`]\: 模板文件.
+ `README.md`: 本文件, 说明文档.
+ [`template.tex`]\: 示例报告模板兼说明文档, 可编译得到 `template.pdf`.
  + [`bibli.bib`]\: 用于参考文献生成的文件.
  + [`fig/`]\: 示例报告用到的图片.
+ [`figgen.py`]\: 生成其中一张图片用的脚本.
  + [`fig.mplstyle`]\: 相应的格式设置.

## 使用方法

只需将 [`mpltx.cls`] 复制/链接到当前文件夹, (如果[安装](#可选-安装)了, 则不用做复制或链接), 然后使用该文档类
```latex
\documentclass[<options>]{mpltx}
```
`[<options>]` 为可选的选项列表, 可以给入标准文档类 `article` 以及 [`revtex4-2`] 可接受的任何参数.
但只建议传 [`mpltx.cls`] 定义的中文字体参数和标点符号参数 (见下).
使用前推荐先仔细查看 [`template.tex`] 文件.
如果有魔改需求可以自定义 [`mpltx.cls`]

如果初次使用 $\mathrm{\LaTeX{}}$, 推荐以下入门文档:
1. [lshort-zh-cn]
2. [lnotes2]

### 编译

由于使用了 [`xeCJK`], 需用 `xelatex` 编译.
为避免编码的问题, 所有源代码请用 UTF-8 保存 (这应该是大多数现代纯文本编辑器的默认配置).
1. 常规编译: `xelatex %DOC%` 一次;
2. 更新超链接: `xelatex %DOC%` 两次;
3. 更新参考文献引用: `xelatex %DOC%` 一次, `bibtex %DOC%` 一次, `xelatex %DOC%` 两次.

以上的 `%DOC%` 均为 `*.tex` 主文件去掉拓展名后的剩余部分.
绝大多数 $\mathrm{\LaTeX{}}$ 编辑器在适当配置后可以为你完成这些工作, 还能帮你自动添加 synctex 等选项.

比如, 示例文档的编译为
```bash
xelatex template
bibtex template
xelatex template
xelatex template
```

### 字体选项

`font={`**`default`**`|noto|notofandol|windows|macos|diy}`
+ `default`: 默认选项, 使用 [`xeCJK`] 默认配置. 小白友好. 
+ `fandol`: 作者搭配的使用 [`fandol`] 的字体配置, 与默认的配法不同. 需要事先安装 [`fandol`] 宏包, $\mathrm{MiK\TeX}$ 在这个选项下并不会自动下载 `fandol`.
+ `noto`: 使用 Noto CJK SC 系列的宋体与黑体. 这是一款优秀的开源中文字体, 可在[其主页](https://github.com/googlefonts/noto-cjk/releases)下载最新版的 Noto CJK Serif SC (即思源宋体) 和 Noto CJK Sans SC (即思源黑体),
  或者安装 [`notocjksc`] 宏包 (但宏包的字体版本是 18 年的).
  但仿宋体和楷体 Noto 未提供, 故将自动使用 Windows 或 macOS 自带的相应字体. **Linux 用户很可能会因为没有相应的商业仿宋体和楷体字体而出错**, 请改用下方的 `notofandol`, 或改用 `diy` 自行使用 `\setCJK*font` 等命令配置.
  + `notofandol`: 用 Fandol 的仿宋体和楷体搭配 Noto 系列的宋体与黑体. **Fandol 和 Noto 的基线不齐**.
+ `windows`: 使用 Windows 系统自带字体 (都使用华文系列; 除了黑体为等线).
+ `macos`: 使用 macOS 系统自带字体 (黑体为苹方). **苹方和其他字体的基线不对齐. 但 macOS 的所有黑体类字体都有这个问题.**
+ `diy`: 历史遗留选项, 与 `default` 完全一致.

使用以上任意选项后, 都仍可用 `\setCJK*font` 自行调整字体.

比如, Windows 用户就可以这样子调用
```latex
\documentclass[font=windows]{mpltx}
```
同时, 在任何系统上这应该都可以编译
```latex
\documentclass{mpltx}
```

以上各选项 (`default` 除外) 的字体配置风格如下 (与 `xeCJK` 默认的配置方式有所不同)
|         | Roman  | Sans Serif | Monospace |
| :-----: | :----: | :--------: | :-------: |
| Upright | 宋体类 |   黑体类   |  仿宋类   |
| Italic  | 仿宋类 |   楷体类   |  楷体类   |

`default` 的字体配置则为
|         | Roman  | Sans Serif | Monospace |
| :-----: | :----: | :--------: | :-------: |
| Upright | 宋体类 |   黑体类   |  仿宋类   |
| Italic  | 楷体类 |    没有    |   没有    |

各平台可以支持的字体选项如下 (叹号表示需要安装特定的字体宏包或开源字体)
|    选项    | Windows | macOS | Linux | Overleaf |
| :--------: | :-----: | :---: | :---: | :------: |
|  default   |    ✓    |   ✓   |   ✓   |    ✓     |
|   fandol   |   ✓!    |  ✓!   |  ✓!   |    ✓     |
|    noto    |   ✓!    |  ✓!   |   ✗   |    ✗     |
| notofandol |   ✓!    |  ✓!   |  ✓!   |    ✓     |
|  windows   |    ✓    |   ✗   |   ✗   |    ✗     |
|   macos    |    ✗    |   ✓   |   ✗   |    ✗     |

#### 关于中文字体的进一步说明

除了上面已经提到的基线不齐的问题外, 还有可能影响输出效果的问题有:
除 macOS 自带的楷体外, 其他所有的楷体字体都没有粗体, 因此 Sans Serif 和 Monospace 的 `\textit` 与 `\textbf` 连用仅产生 `\textbf` 效果.
所有的仿宋体字体也是如此, Roman 的 `\textit` 与 `\textbf` 连用也仅产生 `\textbf` 效果.
对于 Monospace 字体, `AutoFakeBold` 选项被本模板开启, 因此粗体的 Monospace 为伪粗体的仿宋, 效果可能不佳.
但鉴于对实验报告来说, 使用各种 fancy 字体样式的需求不大, 因此问题应该不是很显著.

[`template.tex`] 在附录给了一段供检查字体效果的排版内容.

#### 英文字体与 `unicode-math`

本模板未对英文字体做设置, 输出的为 XeTeX 下默认的 Latin Modern 系列字体.
如有修改英文字体需求, 请自行使用 [`fontspec`] 宏包提供的命令修改 ([`xeCJK`] 自动调用了此宏包).

如有修改数学字体的需求, 请自行使用 [`fontspec`] 相关功能或调用 [`unicode-math`] 并下载相应的数学 OTF 字体宏包.

### 标点选项

报告要求是 "全文标点符号除 '顿号' 外, 其他用英文半角标点符号".
但也可能有人想使用全角标点, 或者使用全角标点但把句号从 "。" 改为 "．".
+ 如果你想完全用半角标点, 不用任何选项, 直接用半角标点输入.
+ 如果你想完全用符合 GB/T 15834-2011 的全角标点, 直接用全角标点输入.
+ 如果你想像 GB/T 15834-1995 所说, "在科技文档中用实心全角圆点 '．' 替代句号 '。'", 
  + 如果你有方便的直接输入 "．" 的方法, 直接输入;
  + 如果没有, 使用 `quanjiao` 选项, 在源文件中直接用 "。" 做句号.
    [`xeCJK`] 会自动帮你做替换.

### `physics` 宏包导入选项

**[`physics`] 宏包使用了一些可能在未来被弃用的 $\mathrm{\LaTeX{}}$ 功能，请考虑使用 Tingxuan Zhang 编写的 [`physics2`]。**

[`physics`] 提供了众多方便的物理符号与公式输入, 如导数符号命令 `\dv{f}{x}`, 自动调整大小的括号 `\qtyp()` 等.
**但本宏包已十年没有维护, 故默认没有导入**, 如需要请使用 `physics` 文档类选项, 而非自行导入!
此宏包定义的 "自动调整括号大小" 命令 `\qty` 与 `siunitx` 的 "物理量" 命令重名.
所以, 本模板导入时将该宏包的命令**重命名**为 `\qtyp`.
具体其他功能请参考其文档.

### 新定义的命令列表

+ `\emailphone[<pretext>]{<email>}{<phone>}`: 在当前位置插入脚注, 内容为 `<pretext><email>; <phone>` 且电子邮件地址转为链接.
+ `\jj`, `\ii`, `\ee`: 数学模式下 j, i 和 e 的 `\mathrm` 版本.
+ `\mc`: `\multicolumn` 的别名.

## 自动调用的宏包

模板已提前调用了很多为撰写报告提供便利的宏包, 请前往 [`mpltx.cls`] 查看, 其中含有解释其功能的注释.
一些特殊说明如下:

+ [`siunitx`] 用于便利地打出格式良好的物理量的值和单位, 如 `\qty{299792.458}{\km\per\s}`， `$g=\qty{9.801}{m.s^{-2}}$`.
+ [`dcolumn`] $\mathrm{\LaTeX{}}2\epsilon$ 基础包的一个, 提供按小数点对齐的表格列格式.
`siunitx` 其实也提供了类似功能, 感兴趣的可以参考两者文档.

### 其他需要注意的外部宏包

+ [`caption`] 存在与本模板的基础 `revtex4-2` 不兼容的情况, 请勿使用.
+ [`subfig`] 默认会自动调用 `caption`.
调用时请使用选项 `caption=false`.
+ [`fixdif`] 宏包提供了正体微分符号命令, 如有需求可以调用.

## 反馈

如果使用中发现问题或有建议, 请联系 Lin Xuchen <linxc_at_pku.edu.cn>, 或到[项目页]提 issue.
如果有大佬愿意改进这个写得稀烂的文档类, 也欢迎动手.

[项目页]: https://github.com/CastleStar14654/PKUMpLtX
[Releases]: https://github.com/CastleStar14654/PKUMpLtX/releases

[`mpltx.cls`]: mpltx.cls
[`template.tex`]: template.tex
[`bibli.bib`]: bibli.bib
[`fig/`]: fig/
[`figgen.py`]: figgen.py
[`fig.mplstyle`]: fig.mplstyle
[`LICENSE`]: LICENSE

[`revtex4-2`]: https://www.ctan.org/pkg/revtex
[`unicode-math`]: https://www.ctan.org/pkg/unicode-math
[`fontspec`]: https://www.ctan.org/pkg/fontspec
[lshort-zh-cn]: http://mirrors.ctan.org/info/lshort/chinese/lshort-zh-cn.pdf
[lnotes2]: https://github.com/huangxg/lnotes/blob/master/lnotes2.pdf
[`xeCJK`]: https://www.ctan.org/pkg/xecjk
[`fandol`]: https://www.ctan.org/pkg/fandol
[`notocjksc`]: https://www.ctan.org/pkg/notocjksc
[`physics`]: https://www.ctan.org/pkg/physics
[`physics2`]: https://www.ctan.org/pkg/physics2
[`siunitx`]: https://www.ctan.org/pkg/siunitx
[`caption`]: https://www.ctan.org/pkg/caption
[`subfig`]: https://www.ctan.org/pkg/subfig
[`dcolumn`]: https://www.ctan.org/pkg/dcolumn
[`fixdif`]: https://www.ctan.org/pkg/fixdif
