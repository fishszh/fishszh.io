---
title: 简略步骤

weight: 500
toc: true  # Show table of contents? true/false
type: docs  # Do not modify.
menu: 
    learning-Hugo:
---
---

这篇仅归个人使用,以免时间久了忘记,以后出错.

## 1. 主站更新

推送到了两个地方:

- 主站: github.com/fishszh.github.io
- 源文件: github.com/fishszh.io
 
>所以 `deploy.sh`中会有两个push, 两个.git,public/.git

```bash
hugo

bash deploy.sh 'commit'
```

## 2. 学习笔记更新

```
hugo

bash deploy.sh 'commit'
```

### 2.1. 新建一个learing-vscode 目录
### 2.2. 将一个已经完成的learning-python内的文件copy过去
### 2.3. 修改文件

- deploy.sh
- .gitignore
- config.toml

```bash
chmod +x deploy.sh
chmod +x update_theme.sh
```

### 2.4. 清理文件

- static/
- content/
- themes/

### 2.5. `ln -s` 主题

```bash
bash update_theme.sh
```

### 2.6. Git 套餐

```
git init
git add -A
git commit -m 'first commit'
git remote add origin http://github.com/yourname/blog.git
git config  --global credential.helper store
```

### 2.7. 开始写笔记

### 2.8. hugo

### 2.9. 推送

```bash
bash deploy.sh
```

