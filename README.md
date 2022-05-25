# `PKUMpLtX`
*A LaTeX document class for 'Modern Physics Laboratory' in PKU based on `revtex4-2`*

+ Copyright (C) 2013. Modern Phys. Lab, School of Phys., Peking Univ.
+ Copyright (C) Sun Sibai <niasw_at_pku.edu.cn>
+ Copyright (C) Cao Chuanwu <>
+ Copyright (C) 2021--2022. Lin Xuchen <linxc_at_pku.edu.cn>

This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International
License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/
or send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.

## 文件内容

+ `mpltx.cls`: 模板文件.
+ `README.md`: 本文件, 说明文档.
+ `template.tex`, `template.pdf`: 示例报告模板兼说明文档.
  + `bibli.bib`: 用于参考文献生成的文件.
  + `fig/`: 示例报告用到的图片.
+ `figgen.py`: 生成其中一张图片用的脚本.
  + `fig.mplstyle`: 相应的格式设置.

## 使用方法

只需将 `mpltx.cls` 复制/链接到当前文件夹, (或者放置到用户个人的 `$TEXMF`, 如果你知道这是什么意思的话), 然后使用该文档类
```latex
\documentclass[<options>]{mpltx}
```
使用前推荐先仔细查看 `template.tex` 和 `template.pdf` 文件.
如果有魔改需求可以查看 `mpltx.cls`

如果初次使用 $\LaTeX$, 推荐以下入门文档:
1. [lshort-zh-cn](http://mirrors.ctan.org/info/lshort/chinese/lshort-zh-cn.pdf) 
2. [lnotes2](https://github.com/huangxg/lnotes/blob/master/lnotes2.pdf)

### 字体选项
+ `default`: 默认选项, 使用 `xeCJK` 默认的开源 Fandol 字体.
  需要安装 `fandol` 宏包. 如果你使用 Overleaf, 用这个选项或者下方的 `notofandol` 都可以.
+ `noto`: 使用 Noto CJK SC 系列, 一款优秀的开源中文字体, 可在 https://github.com/googlefonts/noto-cjk/releases 下载最新版,
  或者下载 `notocjksc` 宏包也可以 (但宏包的字体版本是 18 年的).
  但仿宋体和楷体 Noto 未提供, 故自动使用 Windows 或 macOS 自带的相应字体. **Linux 用户很可能会因为没有相应的商业仿宋体和楷体字体而出错**, 请改用下方的 `notofandol`, 或自行使用 `\setCJKmainfont` 等命令配置.
  + `notofandol`: 用 Noto 系列搭配 Fandol 字体.
+ `windows`: 使用 Windows 系统自带字体.
+ `macos`: 使用 macOS 系统自带字体.
+ `diy`: 自己使用 `\setCJK*font` 命令配置.

比如, Windows 用户就可以这样子调用
```latex
\documentclass[windows]{mpltx}
```

### 标点选项
报告要求是 ''全文标点符号除 '顿号' 外, 其他用英文半角标点符号''.
但也可能有人想使用全角标点, 或者使用全角标点但把句号从 ''。'' 改为 ''．''.
+ 如果你想完全用半角标点, 不用任何选项, 直接用半角标点输入.
+ 如果你想完全用符合 GB/T 15834-2011 的全角标点, 直接用全角标点输入.
+ 如果你想像 GB/T 15834-1995 所说, ''在科技文档中用实心全角圆点 '．' 替代句号 '。''', 
  + 如果你有方便的直接输入 '．' 的方法, 直接输入;
  + 如果没有, 使用 `quanjiao` 选项, 在源文件中直接用 '。' 做句号.
    `xeCJK` 会自动帮你做替换.

### 编译
由于使用了 `xeCJK`, 需用 `xelatex` 编译:
1. 常规编译: `xelatex %DOC%` 一次;
2. 更新超链接: `xelatex %DOC%` 两次;
3. 更新参考文献引用: `xelatex %DOC%` 一次, `bibtex %DOC%` 一次, `xelatex %DOC%` 两次.
以上的 `%DOC%` 均为 `*.tex` 主文件去掉拓展名后的剩余部分.
绝大多数 $\LaTeX$ 编辑器在适当配置后可以为你完成这些工作.

比如, 示例文档的编译为
```bash
xelatex template
bibtex template
xelatex template
xelatex template
```

## 自动调用的宏包

模板已提前调用了很多为撰写报告提供便利的宏包, 请前往 `MpLtX.cls` 查看, 其中含有解释其功能的注释.
一些特殊说明如下:

+ `physics` 提供了众多方便的物理符号与公式输入,
如导数符号命令 `\dv{f}{x}`, 自动调整大小的括号 `\qty()` 等.
具体请参考其文档.

+ `siunitx` 用于便利地打出格式良好的物理量的值和单位, 如 `\qnty{299792.458}{\km\per\s}`， `$g=\qnty{9.801}{m.s^{-2}}$`.
注意, 此宏包定义的 ''物理量'' 命令 `\qty` 与 `physics` 的 ''自动调整括号大小'' 命令重名.
所以, 本模板将本宏包的命令**重命名**为 `\qnty`.

+ `dcolumn` $\LaTeX 2\epsilon$ 基础包的一个, 提供按小数点对齐的表格列格式.
`siunitx` 其实也提供了类似功能, 感兴趣的可以参考两者文档.

### 其他需要注意的外部宏包

+ `caption` 存在与本模板的基础 `revtex4-2` 不兼容的情况, 避免使用.

+ `subfig` 默认会自动调用 `caption`.
调用时请使用选项 `caption=false`.

## 反馈

如果使用中发现问题或有建议, 请联系 Lin Xuchen <linxc_at_pku.edu.cn>.
如果有大佬愿意改进这个写得稀烂的文档类, 也欢迎动手.
