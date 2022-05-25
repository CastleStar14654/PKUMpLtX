%
% PKUMpLtX --- A LaTeX document class for 'Modern Physics Laboratory' in PKU based on `revtex4-2`
%
% Please read `README.md' and the template file before using

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mpltx}[2022/05/25 XeLaTeX class for MP Lab in PKU]

\def\currversion{2.0}

% 基于 APS 的文档类 revtex4-2; 参数含义:
% APS 系列期刊 Phys. Rev. E 格式预印本, 显示关键词, A4
\LoadClass[aps,pre,preprint,showkeys,a4paper]{revtex4-2}
% 使用中文结构名
\usepackage[chinese,provide=*]{babel}
% 基本数学包
\RequirePackage{amsmath}
\RequirePackage{amssymb}
% revtex4-2 推荐的数据展示表格工具
\RequirePackage{dcolumn}
% 控制表格对齐方式
\RequirePackage{array}
% 对宽表格进行90度旋转
\RequirePackage{rotating}
% 插入图片
\RequirePackage{graphicx}
% [外部宏包] 国际单位制与数值支持
\RequirePackage[unit-mode=text]{siunitx}
% [外部宏包] 提供很多物理符号和微积分符号
\RequirePackage{physics}
% 用于防止首页大段空白需要使用的宏包, 勿删除
\RequirePackage{etoolbox}
% 首段缩进
\RequirePackage{indentfirst}
% 将页边距减小
\RequirePackage[hmargin=2.5cm,top=2cm,bottom=1.6cm,footskip=1cm,includefoot]{geometry}
% PDF 超链接以及元数据
\RequirePackage[pdfusetitle=true,bookmarksnumbered=true,bookmarksopen=true]{hyperref}
% 为了超链接指向图的开头; hypcap 要求在 hyperref 后调用
\RequirePackage[all]{hypcap}
% [外部宏包] 平台类型检测
\RequirePackage{ifplatform}
% [外部宏包] 中文支持
\RequirePackage{xeCJK}
\RequirePackage{zhnumber}


% 提供字体配置
\def\@testfandol{% 检测 fandol 宏包有没有安装
  \IfFontExistsTF{FandolSong}{}{
    \ClassError{mpltx}{'fandol' is not installed}{Please install package 'fandol'}
  }
}
\def\@testnoto{% 检测 noto 字体有没有安装
  \IfFontExistsTF{Noto Serif CJK SC}{}{
    \ClassError{mpltx}{Noto fonts are not installed}{%
      Please install package `notocjksc`\MessageBreak
      or download at https://github.com/googlefonts/noto-cjk}
  }
}
\def\@mapping{}
\DeclareOption{quanjiao}{\def\@mapping{,Mapping={fullwidth-stop}}}%
\DeclareOption{default}
   {\@testfandol%
    \setCJKmainfont[BoldFont={FandolSong Bold},ItalicFont={FandolFang}\@mapping]{FandolSong}%
    \setCJKsansfont[BoldFont={FandolHei Bold},ItalicFont={FandolKai}\@mapping]{FandolHei}%
    \setCJKmonofont[AutoFakeBold=true,ItalicFont={FandolKai}\@mapping]{FandolFang}}%
\DeclareOption{noto}
  {\@testnoto%
   \ifwindows{
    \setCJKmainfont[BoldFont={Noto Serif CJK SC Bold},ItalicFont={FangSong}\@mapping]{Noto Serif CJK SC}%
    \setCJKsansfont[BoldFont={Noto Sans CJK SC Bold},ItalicFont={KaiTi}\@mapping]{Noto Sans CJK SC}%
    \setCJKmonofont[AutoFakeBold=true,ItalicFont={KaiTi}\@mapping]{FangSong}}%
   \else{
    \setCJKmainfont[BoldFont={Noto Serif CJK SC Bold},ItalicFont={STFangsong}\@mapping]{Noto Serif CJK SC}%
    \setCJKsansfont[BoldFont={Noto Sans CJK SC Bold},ItalicFont={KaiTi SC}\@mapping]{Noto Sans CJK SC}%
    \setCJKmonofont[AutoFakeBold=true,ItalicFont={KaiTi SC}\@mapping]{STFangsong}}%
   \fi}
\DeclareOption{notofandol}
   {\@testnoto\@testfandol%
    \setCJKmainfont[BoldFont={Noto Serif CJK SC Bold},ItalicFont={FandolFang}\@mapping]{Noto Serif CJK SC}%
    \setCJKsansfont[BoldFont={Noto Sans CJK SC Bold},ItalicFont={FandolKai}\@mapping]{Noto Sans CJK SC}%
    \setCJKmonofont[AutoFakeBold=true,ItalicFont={FandolKai}\@mapping]{FandolFang}}%
\DeclareOption{windows}
  {\setCJKmainfont[BoldFont={STZhongsong},ItalicFont={FangSong}\@mapping]{SimSun}%
   \setCJKsansfont[BoldFont={DengXian Bold},ItalicFont={KaiTi}\@mapping]{DengXian}%
   \setCJKmonofont[AutoFakeBold=true,ItalicFont={KaiTi}\@mapping]{FangSong}}
\DeclareOption{macos}
  {\setCJKmainfont[BoldFont={Songti SC Bold},ItalicFont={STFangsong}\@mapping]{Songti SC}%
   \setCJKsansfont[BoldFont={PingFang SC Semibold},ItalicFont={Kaiti SC}\@mapping]{PingFang SC}%
   \setCJKmonofont[AutoFakeBold=true,ItalicFont={KaiTi SC}\@mapping]{STFangsong}}
\DeclareOption{diy}{}


\ExecuteOptions{default}
\ProcessOptions\relax


% 参考文献格式
\bibliographystyle{apsrev4-2}
% 定义虚数单位简写
\newcommand{\jj}{\mathrm{j}}
\newcommand{\ii}{\mathrm{i}}
\newcommand{\ee}{\mathrm{e}}
% 简写 multicolumn
\newcommand{\mc}[3]{\multicolumn{#1}{#2}{#3}}

\def\frontmatter@abstractwidth{400\p@}%摘要收窄
\def\@pacs@name{\textbf{PACS码: }}
\def\@keys@name{\textbf{关键词: }}
\def\Dated@name{实验日期: }
\def\frontmatter@abstractfont{%摘要开头空两格
 \small
 \parindent2em\relax
 \adjust@abstractwidth
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 来自 https://tex.stackexchange.com/questions/413116/how-to-prevent-page-break-in-revtex-4-1
%!!!!!!    别改动这一段配置   !!!!!!%
%!!!!!! 与防止首页大段空白有关 !!!!!!%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\patchcmd{\frontmatter@abstract@produce}
  {\vskip200\p@\@plus1fil
   \penalty-200\relax
   \vskip-200\p@\@plus-1fil}
  {}
  {}
  {}
% 让 email 加上手机号
\newcommand*\emailphone[3][]{\begingroup\sanitize@url\@emaildouble{#1}{#2}{#3}}%
\def\@emaildouble#1#2#3{%
 \endgroup
 \@AF@join{#1\href{mailto:#2}{#2}; #3}%
}%
% PDF 书签摘要名字
\newcommand{\bookmarkabstractname}{摘要}
\def\addcontents@abstract{%
\phantomsection
\expandafter\def\csname Parent0\endcsname{section*.2}%
\expandafter\@argswap@val\expandafter{\bookmarkabstractname}{\addcontentsline{toc}{abstract}}%
}%
\makeatother

% 中文本地化
\setlocalecaption{chinese}{abstract}{}
\renewcommand{\acknowledgmentsname}{致谢}
% 使 hyperref 的 \autoref 可以生成正确结构名
\renewcommand{\figureautorefname}{图}
\newcommand{\subfigureautorefname}{子图}
\renewcommand{\tableautorefname}{表}
\renewcommand{\sectionautorefname}{小节}
\renewcommand{\appendixautorefname}{附录}
\def\equationautorefname~#1\null{式~(#1)\null}
% revtex 内部对 \section 的更改使得 hyperref 对 \appendix 的修改没有产生效果
% 这里做了修复
\apptocmd{\appendix}{
  \patchcmd{\phantomsection}{%
    \Hy@MakeCurrentHrefAuto{section*}%
  }{%
    \Hy@MakeCurrentHrefAuto{\Hy@chapapp*}%
  }{}{}%
}{}{}

% 定义表格中的数字格式, d{a.b} 即为按小数点区分, 前留 a 位, 后留 b 位
\newcolumntype{d}[1]{D{.}{.}{#1}}
% 开头空两格
\AtBeginDocument{\setlength{\parindent}{2em}}
% 处理 siunitx 和 physics 对 qty 重名: 前者变成 \qnty
\AtBeginDocument{\NewCommandCopy\qnty\SI}
