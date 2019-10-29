---
title: 进阶
weight: 300
toc: true  # Show table of contents? true/false
type: docs  # Do not modify.
menu: 
    learning-Hugo:
---
---

为了方便管理自己的博客和学习笔记,选择的两个主题:

- [Academic](https://github.com/gcushen/hugo-academic) 做为主站
- ~~[material-docs](https://github.com/skyao/) 用来写笔记文档很漂亮~~(已放弃)

并且我们希望在分别管理主站和学习笔记时比较方便,文件路径层数不要太多.每个笔记可以分开管理.
- 这就要利用到 Github 的 Project Pages 的功能了,就是建立一个`gh-pages`分支, Github 会在项目的 setting 中 Pages 一栏自动选择`gh-pages`作为Pages源目录.

- 其次利用`ln -s`命令共享主题,这样可以帮我们节省本地磁盘空间.

> 上面就是核心思想,以下主要关注`update_theme.sh`和`deploy.sh`这两个文件里面命令.

两个主题的配置过程参见: https://skyao.io/learning-hugo/ 

大佬写的很详细

## 创建gh-pages分支

为了部署Github Project Pages我们需要创建一个gh-pages分支.
(其实不创建也可以,deploy.sh的最后一段命令可以代替这步操作)
利用命令:

```bash
git branch gh-pages
```

详情参考git[官方文档](https://git-scm.com/doc).

## ``update_theme.sh``文件

用来更新主题和通过`ln -s`链接主题文件

```bash
#!/bin/bash

if [ ! -d "themes" ];then
  echo "No themes directory, create it"
  mkdir themes
fi

if [ -d "themes/hugo-material-docs" ];then
  echo 'Find directoy "themes/hugo-material-docs", update by "git pull"'
  cd themes/hugo-material-docs
  git pull
  cd ../../
else
  echo 'Directoy "themes/hugo-material-docs" not found, do "ln -s"'
  # git clone https://github.com/skyao/hugo-material-docs.git themes/hugo-material-docs
  # git clone git@github.com:skyao/hugo-material-docs.git themes/hugo-material-docs
  cd themes
  ln -s ../../hugo-material-docs hugo-material-docs  #注意文件路径
fi
```

## `deploy.sh` 文件

用来发布到Github, master和gh-pages两个分支.
master为源文件分支,
gh-pages为pages网页分支.

```bash
#!/bin/bash
echo -e "\033[0;32m Deploying updates to GitHub...\033[0m"

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi


# Add changes to git.
git add -A

# Commit changes.
git commit -m "$msg"

# remove old public
rm -rf public

# Push source and build repos.
git push origin master

# Build the project and push to gh-pages
hugo
git subtree push --prefix=public origin gh-pages
```

## 免密推送到Github

只需要第一次推送成功后,就可以免密操作了

```bash
git config  --global credential.helper store
```

查看配置

```bash
git config --list
```

如果有如下命令就是配置成功:

```bash
credential.helper=store
```

## Academic 添加 Katex 支持

参考文献:

1. https://github.com/oblitum/hugo-theme-slim/commit/2726427d5899720447d90177824ab26996bb0750
2. https://www.jianshu.com/p/f2b28954d902
3. https://katex.org/docs/browser.html

目前还没有成功 19-09-02

在`head.html`下添加如下几行命令即可.但是目前的问题是一行内有两个及以上的`_`时就不能识别,
目前的解决方式是在`<p>$公式$</p>`


```html
<!-- mathjax config similar to math.stackexchange -->
<script type="text/x-mathjax-config">
MathJax.Hub.Config({ 
jax: ["input/TeX", "output/HTML-CSS"], 
    tex2jax: { 
    inlineMath: [ ['$', '$'],['\\(','\\)']], 
    displayMath: [ ['$$', '$$'], ['\[','\]']], 
    processEscapes: true, 
    processEnvironments: true,
    skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code'],
    TeX: { equationNumbers: { autoNumber: "AMS" },
        extensions: ["AMSmath.js", "AMSsymbols.js"] } 
}, 
messageStyle: "none", 
"HTML-CSS":{ preferredFont: "TeX", availableFonts: ["STIX","TeX"] } 
});
</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
```

已解决 19-09-11
