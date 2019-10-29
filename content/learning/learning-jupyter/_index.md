---
date: 2019-08-08
title: Jupyter Notebook
description: Jupyter Notebook 学习笔记,主要记录Jupyter Notebook使用过程中的点滴.
weight: 3
type: docs
toc: true
menu:
    learning-jupyter:
---

Jupyter Notebook 是一款结合代码和笔记的神器,用起来很方便,插件越来越完善,而且很适合用来
整理项目.

## 一些相关文档/书籍:

- 官方文档资源:<https://github.com/jupyter/jupyter/wiki/A-gallery-of-interesting-Jupyter-Notebooks>
- The Python Data Science HandBook : <https://github.com/jakevdp/PythonDataScienceHandbook>  
- Hands-on the Machine Learning with Scikit-Learn and TensorFlow : <https://github.com/ageron/handson-ml>
- the Deep Learning with Python : <https://github.com/fchollet/deep-learning-with-python-notebooks>
- UC Berkeley Data 100 : <https://github.com/DS-100/textbook>

目前这里主要记录了一些常用的插件和设置,另外就是一些代码的管理技巧.


## 首先万年不变开头

```python
%matplotlib inline
%load_ext autoreload
%autoreload 2

```

 导入其它目录下`.py`文件

```python
from import_packs import *
import sys
sys.path.append('..')
from src.emcee_demo import *
```
