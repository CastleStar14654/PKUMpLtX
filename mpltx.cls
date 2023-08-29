%
% PKUMpLtX --- A LaTeX document class for 'Modern Physics Laboratory' in PKU based on `revtex4-2`
%
% Please read `README.md' and the template file before using

% ========== Identification ==========
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mpltx}[2023/08/29 v2.1.5 XeLaTeX class for MP Lab in PKU]

% ========== Preliminary declarations ==========
% copy from \GetFileInfo from LaTeX `doc` program
\def\mpltx@filevergen#1{%
  \def\mpltx@filename{#1}%
  \def\@tempb##1 ##2 ##3\relax##4\relax{%
    \def\mpltx@filedate{##1}%
    \def\mpltx@fileversion{##2}%
    \def\mpltx@fileinfo{##3}}%
  \edef\@tempa{\csname ver@#1\endcsname}%
  \expandafter\@tempb\@tempa\relax? ? \relax\relax}
% generate \mpltx@filename \mpltx@filedate etc.
\mpltx@filevergen{mpltx.cls}


% 基于 APS 的文档类 revtex4-2; 参数含义:
% APS 系列期刊 Phys. Rev. E 格式预印本, 显示关键词, A4, 载入 ams 系列
\let\old@label\label
\LoadClass[aps,pre,preprint,showkeys,a4paper,amssymb]{revtex4-2}
\let\label\old@label
\RequirePackage{amsmath}
% 选项处理
\RequirePackage{kvoptions}
% [外部宏包] 字符串处理
\RequirePackage{xstring}
% 更改 revtex 命令定义
\RequirePackage{etoolbox}
% [外部宏包] 平台类型检测
\RequirePackage{ifplatform}
% [外部宏包] 中文支持
\RequirePackage{xeCJK}


% ===== Options =====
\DeclareBoolOption{quanjiao}
\DeclareBoolOption{physics}
\DeclareStringOption[default]{font}
\ProcessKeyvalOptions*\relax


% 全角句点映射
\def\mpltx@mapping{}
\ifmpltx@quanjiao%
  \def\mpltx@mapping{,Mapping={fullwidth-stop}}%
\fi
% 提供字体配置
\def\mpltx@fonttest@fandol{% 检测 fandol 宏包有没有安装
  \IfFontExistsTF{FandolSong}{}{
    \ClassError{mpltx}{'fandol' is not installed}{Please install package 'fandol'}
  }
}
\def\mpltx@fonttest@noto{% 检测 noto 字体有没有安装
  \IfFontExistsTF{Noto Serif CJK SC}{}{
    \ClassError{mpltx}{Noto fonts are not installed}{%
      Please install package `notocjksc`\MessageBreak
      or download at https://github.com/googlefonts/noto-cjk/releases}
  }
}
% 处理字体配置
\IfStrEqCase{\mpltx@font}{%
  {default}{}%
  {fandol}{%
    \mpltx@fonttest@fandol%
    \setCJKmainfont[BoldFont={FandolSong Bold},ItalicFont={FandolFang}\mpltx@mapping]{FandolSong}%
    \setCJKsansfont[BoldFont={FandolHei Bold},ItalicFont={FandolKai}\mpltx@mapping]{FandolHei}%
    \setCJKmonofont[AutoFakeBold=true,ItalicFont={FandolKai}\mpltx@mapping]{FandolFang}%
  }{noto}{%
    \mpltx@fonttest@noto%
    \ifwindows{
      \setCJKmainfont[BoldFont={Noto Serif CJK SC Bold},ItalicFont={FangSong}\mpltx@mapping]{Noto Serif CJK SC}%
      \setCJKsansfont[BoldFont={Noto Sans CJK SC Bold},ItalicFont={KaiTi}\mpltx@mapping]{Noto Sans CJK SC}%
      \setCJKmonofont[AutoFakeBold=true,ItalicFont={KaiTi}\mpltx@mapping]{FangSong}}%
    \else{
      \setCJKmainfont[BoldFont={Noto Serif CJK SC Bold},ItalicFont={STFangsong}\mpltx@mapping]{Noto Serif CJK SC}%
      \setCJKsansfont[BoldFont={Noto Sans CJK SC Bold},ItalicFont={KaiTi SC},BoldItalicFont={KaiTi SC Bold},\mpltx@mapping]{Noto Sans CJK SC}%
      \setCJKmonofont[AutoFakeBold=true,ItalicFont={KaiTi SC},BoldItalicFont={KaiTi SC Bold}\mpltx@mapping]{STFangsong}}%
    \fi
  }{notofandol}{%
    \mpltx@fonttest@noto\mpltx@fonttest@fandol%
    \setCJKmainfont[BoldFont={Noto Serif CJK SC Bold},ItalicFont={FandolFang}\mpltx@mapping]{Noto Serif CJK SC}%
    \setCJKsansfont[BoldFont={Noto Sans CJK SC Bold},ItalicFont={FandolKai}\mpltx@mapping]{Noto Sans CJK SC}%
    \setCJKmonofont[AutoFakeBold=true,ItalicFont={FandolKai}\mpltx@mapping]{FandolFang}
  }{windows}{%
    \setCJKmainfont[BoldFont={STZhongsong},ItalicFont={STFangsong}\mpltx@mapping]{STSong}%
    \setCJKsansfont[BoldFont={DengXian Bold},ItalicFont={STKaiti}\mpltx@mapping]{DengXian}%
    \setCJKmonofont[AutoFakeBold=true,ItalicFont={STKaiti}\mpltx@mapping]{STFangsong}
  }{macos}{%
    \setCJKmainfont[BoldFont={Songti SC Bold},ItalicFont={STFangsong}\mpltx@mapping]{Songti SC}%
    \setCJKsansfont[BoldFont={PingFang SC Semibold},ItalicFont={Kaiti SC},BoldItalicFont={KaiTi SC Bold}\mpltx@mapping]{PingFang SC}%
    \setCJKmonofont[AutoFakeBold=true,ItalicFont={KaiTi SC},BoldItalicFont={KaiTi SC Bold}\mpltx@mapping]{STFangsong}
  }{diy}{}
}[\ClassError{mpltx}{unkown 'font' value}{check for 'font' option}]


% ===== More declarations =====
% ----- Format -----
% 首段缩进
\RequirePackage{indentfirst}
% 将页边距减小
\RequirePackage[hmargin=2.5cm,top=2cm,bottom=1.6cm,footskip=1cm,includefoot]{geometry}
% 参考文献格式
\bibliographystyle{apsrev4-2}
% 让 email 加上手机号
\NewDocumentCommand{\emailphone}{O{} m m}{%
  \begingroup\sanitize@url\mpltx@emaildouble{#1}{#2}{#3}}
\def\mpltx@emaildouble#1#2#3{%
 \endgroup
 \@AF@join{#1\href{mailto:#2}{#2}; #3}%
}%
% 摘要
\def\frontmatter@abstractwidth{400\p@}%摘要收窄
\patchcmd{\frontmatter@abstractfont}
  {1em}
  {2em}%摘要开头空两格
  {}
  {}
% 防止首页大段空白
% 来自 https://tex.stackexchange.com/questions/413116/how-to-prevent-page-break-in-revtex-4-1
\patchcmd{\frontmatter@abstract@produce}
  {\vskip200\p@\@plus1fil
   \penalty-200\relax
   \vskip-200\p@\@plus-1fil}
  {}
  {}
  {}
% 开头空两格
\AtBeginDocument{\setlength{\parindent}{2em}}
% 行距调整
\linespread{1.3}
\setlength{\footnotesep}{1em}
\patchcmd{\footnotesize}
  {\@xpt{14.5pt}}
  {\@xpt{\@xiipt}}
  {}
  {}
\patchcmd{\small}
  {\@xipt{14.5pt}}
  {\@xipt{13\p@}}
  {}
  {}

% ----- Math & physics -----
% [外部宏包] 国际单位制与数值支持
\RequirePackage[unit-mode=text]{siunitx}
\ifmpltx@physics
  \AtBeginDocument{
    % [外部宏包] 提供很多物理符号和微积分符号; 默认不导入; 需打开 `physics` 选项
    \NewCommandCopy{\mpltx@SIqty}{\qty}
    \RequirePackage{physics}
    % 处理 siunitx 和 physics 对 qty 重名: 后者变成 \qtyp
    \NewCommandCopy{\qtyp}{\quantity}
    \RenewCommandCopy{\qty}{\mpltx@SIqty}
    \let\mpltx@SIqty\@undefined
  }
\fi
% 定义虚数单位简写
\newcommand{\jj}{\mathrm{j}}
\newcommand{\ii}{\mathrm{i}}
\newcommand{\ee}{\mathrm{e}}

% ----- Figure -----
% 插入图片
\RequirePackage{graphicx}

% ----- Table -----
% revtex4-2 推荐的数据展示表格工具
\RequirePackage{dcolumn}
% 表格宏包
\RequirePackage{array,rotating,tabularx}
% 定义表格中的数字格式, d{a.b} 即为按小数点区分, 前留 a 位, 后留 b 位
\newcolumntype{d}[1]{D{.}{.}{#1}}
% 简写 multicolumn
\let\mc\multicolumn

% ----- Chinese localization ------
% [外部宏包] 中文支持
\RequirePackage{zhnumber}
\RequirePackage[chinese,provide=*]{babel}
% 额外结构名处理
\setlocalecaption{chinese}{abstract}{}
\setlocalecaption{chinese}{acknowledgments}{致谢}
\def\@pacs@name{\textbf{PACS码: }}
\def\@keys@name{\textbf{关键词: }}
\def\Dated@name{实验日期: }
% 使 hyperref 的 \autoref 本地化
\addto\extraschinese{% here the use of % is necessary
  \def\equationautorefname~#1\null{式~(#1)\null}%
  \renewcommand{\footnoteautorefname}{脚注}%
  \renewcommand{\itemautorefname}{项}%
  \renewcommand{\figureautorefname}{\figurename}%
  \renewcommand{\tableautorefname}{\tablename}%
  \def\partautorefname~#1\null{\prepartname~#1\ \postpartname\null}%
  \renewcommand{\appendixautorefname}{\appendixname}%
  \renewcommand{\sectionautorefname}{小节}%
  \renewcommand{\theoremautorefname}{定理}%
  \def\pageautorefname\nobreakspace\pageref*#1{第~\pageref*{#1}\ 页\null}% 用于 \autopageref
}

% ----- PDF & hyperref -----
% PDF 超链接以及元数据
\RequirePackage[pdfusetitle=true,bookmarksnumbered=true,bookmarksopen=true]{hyperref}
% 为了超链接指向图的开头; hypcap 要求在 hyperref 后调用
\RequirePackage[all]{hypcap}
% PDF 书签摘要名字
\newcommand{\bookmarkabstractname}{摘要}
\patchcmd{\addcontents@abstract}{%
    \abstractname%
  }{%
    \bookmarkabstractname%
  }{}{}
% revtex 内部对 \section 的更改使得 hyperref 对 \appendix 的修改没有产生效果
% 这里做了修复
\appto\appendix{
  \patchcmd{\phantomsection}{%
    \Hy@MakeCurrentHrefAuto{section*}%
  }{%
    \Hy@MakeCurrentHrefAuto{\Hy@chapapp*}%
  }{}{}%
}

% ----- Compatibility -----
\AtBeginDocument{
  % \IfPackageLoadedTF{caption}{%
  \@ifpackageloaded{caption}{%
    \ClassError{mpltx}{package `caption' is incompatible}{do not use `caption'}
  }{}
  \@ifpackageloaded{physics}{%
    \ClassWarning{mpltx}{%
        package `physics' might be broken in the future,\MessageBreak
        try `physics2' by Tingxuan Zhang!
      }
  }{}
}
