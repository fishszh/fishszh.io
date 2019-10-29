---
title: 部署流程

weight: 100
toc: true  # Show table of contents? true/false
type: docs  # Do not modify.
menu: 
    learning-Hugo:
---
---

## 1. 注冊 Github

自行解決吧，这个很简单

## 2. 安装 Hugo
Mac下安装Hugo可以使用HomeBrew，也可以到[Hugo Github](https://github.com/gohugoio/hugo/releases)上下载二进制包安装。

```bash
 brew install hugo 
```

安装完成后，在命令行输入一下命令验证安装：

```bash
 hugo version 
```

## 3. 下载主题

```bash
# 本地准备好Academic主题仓库
git clone https://github.com/gcushen/hugo-academic.git
# 直接获取kickstart的内容作为建站基础
git clone https://github.com/sourcethemes/academic-kickstart.git fishszh.io
cd fishszh.io/
rm -rf .git .gitmodules
rem -r themes/academic
```

## 4. Git 相关文件

### 4.1. 免密推送到Github

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

### 4.2. 修改`.gitignore`内容文件如下

```bash
.*
!.gitignore
public/
themes/
```

### 4.3. 修改`update_academic.sh`文件内容如下:

```bash
#!/bin/bash

if [ ! -d "themes" ];then
  echo "No themes directory, create it"
  mkdir themes
fi

if [ -d "themes/academic" ];then
  echo 'Find directoy "themes/academic", update by "git pull"'
  cd themes/academic
  git pull
  cd ../../
else
  echo 'Directoy "themes/academic" not found, do "ln -s"'
  cd themes
  ln -s ../../hugo-academic academic
  cd ../
fi
```

执行命令 `sh update_academic.sh` 获取 `academic` 主题文件(实际是一个ln过程)。此时`themes/academic`是我们订制的主题内容，此时两个`git`仓库都可以分别提交内容，而且实时生效，非常方便本地修改。

### 4.4. 根目录下 添加`deploy.sh` 文件

用来发布到Github, 将`fishszh.github.io`的`Pages`作为主站,并将源文件放在`github.com/fishszh/fishszh.io`中.

commit等工作在VSC中完成.

```bash
#用来保存源文件和布置主站

#!/bin/bash
echo -e "\033[0;32m Deploying updates to GitHub...\033[0m"

# Push source to 
git push origin master

cd public/
# push academic 主站到 Github  
git push origin master
```

## 5. 配置文件

详情参见[Academic 文档](https://sourcethemes.com/academic/)

这几个都是要修改的

```bash
.
├── config
│   └── _default
│       ├── config.toml
│       ├── languages.toml
│       ├── menus.toml
│       └── params.toml
├── config.toml
├── content
│   └── authors
│       └── admin
├── data
│   ├── fonts
│   │   └── material.toml
│   └── themes
│       └── material.toml
├── deploy.sh
├── update_academic.sh

```

### 5.1. 修改 config.toml

```markdown
title = "Fish Szh"
baseurl = "http://fishszh.github.io/"
copyright = "Fish Szh &copy; 2019"
defaultContentLanguage = "zh"

[permalinks]
    post = "/blog/:slug"
```

### 5.2. 修改 languages.toml

```markdown
[zh]
  languageCode = "zh-Hans"
```

### 5.3. 修改 params.toml

```markdown
theme = "material"   # 个性化主题配色方案 ./data/theme/material.toml
font = "material"   # 个性化字体方案 ./data/font/material.toml
description = "Fish Szh的个人博客"
logo = "spinner-fish.png"
math = true
```

### 5.4. 修改 content/home & content/authors

配置主页和个人信息

## 6. 主题模板调整

Academic的css文件在`./themes/academic/assets/sass/`中,另外Academic提供了一些变量接口,可以调节配色主题和字体主题.

- 修改配色方案
- 修改字体方案
- 修改导航栏排版

### 6.1. 修改配色方案

创建`./data/theme/material.toml`文件

```toml
# Theme metadata
name = "1950s"

# Is theme light or dark?
light = true

# Primary
primary = "#EF525B"

# Menu
menu_primary = "#e84e40"
menu_text = "#fff"
menu_text_active = "#212121"
menu_title = "#fff"

# Backgrounds
background = "#f5f3f0"
home_section_odd = "#e6e4d8"
home_section_even = "#e6e5e1"

font = "rose"
```

另外修改了原来`h2`和`table`的颜色,只需修改`academic/_root.scss`文件:

```scss
h2 {
    font-weight: 300;
    margin-top: 1rem;
    font-size: 1.5rem;
    color: #F44336
}

table>tfoot>tr>td {
    padding: 8px;
    line-height: 1.43;
    vertical-align: top;
    border: 1px solid #ddd;
}

table>thead>tr>th {
    vertical-align: bottom;
    border-bottom: 2px solid #ddd;
    background: rgba(239, 82, 90, 0.719);
    border-radius: 4px;
}
```


### 6.2. 修改字体方案

创建`./data/fonts/material.toml`文件

```toml
# Font style metadata
name = "material"

# Optional Google font URL
google_fonts = "Lato:400,700|Merriweather|Roboto+Mono"

# Font families
heading_font = "Lato"
body_font = "Merriweathe"
nav_font = "Lato"
mono_font = "Roboto Mono"
```

### 自定义 custom.css 

创建 `assets/css/custom.css` 文件,并设置`config/params.toml`文件内`plugins=["custom"]`.

`custom.css` 文件可以自定义几乎所有变量, 这里设置了如下内容:

- majax 颜色
- h2 颜色
- table head 颜色
- table 边框
- 二级菜单缩进 padding
- toc border-left 

```css
/* customize MathJax color */
.MathJax {
    color: rgb(108, 50, 161);
}

/* customize h2 color */
h2 {
    color: #F44336
}

/* table color */
table>tfoot>tr>td {
    border: 1px solid #ddd;
}
table>thead>tr>th {
    background: rgba(240, 64, 79, 0.719);
    border-radius: 4px;
}

#TableOfContents {
    padding-left: 0;
    border-left: 2px solid rgb(202, 91, 91);
}

.docs-sidebar .nav>li>a {
    padding: .25rem 2.5rem;
    color: rgba(0, 0, 0, .65);
}
```
