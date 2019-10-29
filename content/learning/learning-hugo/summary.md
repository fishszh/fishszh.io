---
title: 部署流程总结

weight: 400
toc: true  # Show table of contents? true/false
type: docs  # Do not modify.
menu: 
    learning-Hugo:
---
---

## 安装

- 注册 Github
- 安装 hugo
  
## 下载主题

- 主站: [Academic](https://github.com/gcushen/hugo-academic) 
- 学习笔记: [material-docs](https://github.com/skyao/) 

新建My_website文件

```bash
mkdir my_website
cd my_website
```

下载 Academic

```bash
wget https://raw.githubusercontent.com/skyao/hugo-material-docs/master/exampleSite/update_theme.sh
chmod +x update_theme.sh
./update_theme.sh
```

参见: https://skyao.io/learning-hugo/ 


同目录下:

``` bash
mkdir learning
cd learning
```
下载material-docs主题

```bash
wget https://raw.githubusercontent.com/skyao/hugo-material-docs/master/exampleSite/update_theme.sh
chmod +x update_theme.sh
./update_theme.sh
```

## 配置主站

下载完就可以配置主题了
详情参见: https://skyao.io/learning-hugo/ 


## 配置学习笔记

```bash
cd learning/
hugo new site learning-hugo 
```

把 `material-docs/exampleSite` 文件拷贝到`learning-hugo`下.
(每个新建笔记都要重复的步骤)

### 目录结构

当前目录结构如下

```bash
.
└── learning                           # 学习笔记文件
    ├── hugo-material-docs             # 主题文件 不用修改
    ├── learning-algorithms            # 每个笔记文件,对应一个Github 仓库
    ├── learning-hugo
    ├── learning-python
    └── learning-vscode
```

### 修改配置文件

```bash
.
├── learning-hugo
   ├── config.toml      # 主要修改这个
   ├── content          # 存放笔记文件
   ├── deploy.sh        # 部署到Github的命令文件 需要修改
   ├── layouts
   ├── resources
   ├── static
   ├── themes
   └── update_theme.sh  # 更新并链接主题的文件
```


## 开始写博客笔记

到这一步终于可以开始写博客了.

在每个项目下的`content`文件下就可以开始写博客了.

1. 注意事项:

>- 在`markdown`文件front matter中添加`weight`参数
>- `.gitignore` 文件内容
>- 新建`gh-pages`分支:  `git branch gh-pages`
>- 添加免密推送`git config  --global credential.helper store`

2. 需要修改的文件
 
> - `deploy.sh`
> - config.toml
  
1. 实时预览了
     
> ```bash
>hugo server
>```

3. 写完了之后:

>- `hugo`
>- bash deploy.sh 部署到Github

