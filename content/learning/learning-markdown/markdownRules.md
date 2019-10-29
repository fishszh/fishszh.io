---
title: "Markdown 语法"
date: 2019-08-16
categories:
- markdown
tags:
- markdown
toc: true  # Show table of contents? true/false
type: docs  # Do not modify.
weight: 10
menus: 
    learning-markdown:
---

<!--more-->
**说明**：<br/>
网上已经有一堆堆的Markdown的语法文档，这里不包含那些最基础的，只是一些带技巧的？以后用到的时候，可以随时查看。

<!--toc-->
## 图片

- `![Title](dir)`


## 连接

- `[Title](dir)`
- `<www.github.com>`
 
## 公式

Markdown支持LaTeX公式格式，所以这块可操作性比较强。相信能在Markdown里写公式的都知道LaTeX，各种操作请直接搜索LaTeX公式相关文章（懒人可以直接单击下面参考文献连接）。这里只是Markdown公式的简单语法。

参考：

- <https://www.jianshu.com/p/c2814458dbfe>
- <https://blog.csdn.net/c20182030/article/details/84840373>
- <https://blog.csdn.net/wait_for_eva/article/details/84307306>


### 行内

```latex
$e^x=1$
```

### 独立公式

```latex
$$ 
e^x + e^y = 1
$$
```

### 自动编号公式

```latex
\begin{equation}
数学公式
\label{eq:当前公式名}
\end{equation}
```

自动编号后的公式可在全文任意处使用 \eqref{eq:公式名} 语句引用

手动编号`\tag{2}`,`\label{st}`


## Emoji

参考:

- [EmojiHomePage](http://emojihomepage.com/)
- [Emoji cheat sheet](https://www.webfx.com/tools/emoji-cheat-sheet/)

|              |            |              |            |
| ------------ | ---------- | ------------ | ---------- |
| `:grinning:` | :grinning: | `:grin:`     | :grin:     |
| `:smiley:`   | :smiley:   | `:smile:`    | :smile:    |
| `:joy:`      | :joy:      | `:laughing:` | :laughing: |
| `:wink:`     | :wink:     | `:blush:`    | :blush:    |
| `:tomato:`   | :tomato:   |
