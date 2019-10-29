---
title: "Project Management 项目管理方案"
date: 2019-08-17
toc : true
categories:
- Project
tags:
- Project
---

一个合理的项目目录结构可以有效的组织管理我们的项目，提高我们的开发效率。这篇文章整合了几片文章，其主要依赖是Cookiecutter。
并且这里介绍的项目结构对数据科学项目比较友好。
<!-- more -->

## 1. Example

Most of this part is from this web page <https://stackoverflow.com/questions/36427747/scientific-computing-ipython-notebook-how-to-organize-code>

### 1.1. Create a shared (multi-project) utils library.
  
You most likely have to reuse/repeat some code in different research projects. Start refactoring those things into "common utils" package. Make `setup.py` file, push module to github (or similar), so that team members can "pip install" it from VCS.

Examples of functionality to put in there are:

- Data Warehouse or Storage access functions 
- common plotting functions 
- re-usable math/stats methods

### 1.2. Split your fat master notebook into smaller notebooks
  
In my experience, the good length of file with code (any language) is only few screens (100-400 lines). Jupyter Notebook is still the source file, but with output! Reading a notebook with 20+ cells is very hard. I like my notebooks to have 4-10 cells max.

Ideally, each notebook should have one "hypothesis-data-conclusions" triplet.

Example of splitting the notebook:

- data_preparation.ipynb
- data_validation.ipynb
- exploratory_plotting.ipynb
- simple_linear_model.ipynb
- hierarchical_model.ipynb
- playground.ipynb
  
Save output of 1_data_preparation.ipynb to pickle df.to_pickle('clean_data.pkl'), csv or fast DB and use pd.read_pickle("clean_data.pkl") at the top of each notebook.

### 1.3. It is not Python - it is IPython Notebook

What makes notebook unique is cells. Use them well. Each cell should be "idea-execution-output" triplet. 

- If cell does not output anything combine with the following cell. Import cell should output nothing this is an expected output for it.
- If cell have few outputs it may be worth splitting it.

- Hiding imports may or may not be good idea:

  `from myimports import *`  
  Your reader may want to figure out what exactly you are importing to use the same stuff for her research. So use with caution.   
  We do use it for pandas, numpy, matplotlib, sql however.

- Hiding "secret sauce" in /helpers/model.py is bad:

  `myutil.fit_model_and_calculate(df)`  
  This may save you typing and you will remove duplicate code, but your collaborator will have to open another file to figure out what's going on. Unfortunately, notebook (jupyter) is quite inflexible and basic environment, but you still don't want to force your reader to leave it for every piece of code. I hope that in the future IDE will improve, but for now, keep "secret sauce" inside a notebook. While "boring and obvious utils" - wherever you see fit. DRY still apply - you have to find the balance.

This should not stop you from packaging re-usable code into functions or even small classes. But "flat is better than nested".

### 1.4. Keep notebooks clean

You should be able to "reset & Run All" at any point in time.

Each re-run should be fast! Which means you may have to invest in writing some caching functions. May be you even want to put those into your "common utils" module.

Each cell should be executable multiple times, without the need to re-initialise the notebook. This saves your time and keep the code more robust. But it may depend on state created by previous cells. Making each cell completely independent from the cells above is an anti-pattern, IMO.

After you are done with research - you are not done with notebook. Refactor.

### 1.5. Create a project module, but be very selective

If you keep re-using plotting or analytics function - do refactor it into this module. But in my experience, people expect to read and understand a notebook, without opening multiple util sub-modules. So naming your sub-routines well is even more important here, compared to normal Python.

"Clean code reads like well written prose" Grady Booch (developer of UML)

### 1.6.  Host Jupyter server in the cloud for the entire team

You will have one environment, so everyone can quickly review and validate research without the need to match the environment (even though conda makes this pretty easy).

And you can configure defaults, like `mpl style/colors` and make `matplotlib` inline, by default:

In `~/.ipython/profile_default/ipython_config.py`

Add line `c.InteractiveShellApp.matplotlib = 'inline'`

### 1.7.  (experimental idea) Run a notebook from another notebook, with different parameters

Quite often you may want to re-run the whole notebook, but with a different input parameters.

To do this, you can structure your research notebook as following: Place params dictionary in the first cell of "source notebook".
```
params = dict(platform='iOS', start_date='2016-05-01', retention=7) df = get_data(params ..) do_analysis(params ..)
```

## 2.  Cookiecutter Data Science

This is provide by Cookiecutter Data Science
```
├── LICENSE
├── Makefile           <- Makefile with commands like `make data` or `make train`
├── README.md          <- The top-level README for developers using this project.
├── data
│   ├── external       <- Data from third party sources.
│   ├── interim        <- Intermediate data that has been transformed.
│   ├── processed      <- The final, canonical data sets for modeling.
│   └── raw            <- The original, immutable data dump.
│
├── docs               <- A default Sphinx project; see sphinx-doc.org for details
│
├── models             <- Trained and serialized models, model predictions, or model summaries
│
├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│
├── references         <- Data dictionaries, manuals, and all other explanatory materials.
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│   └── figures        <- Generated graphics and figures to be used in reporting
│
├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
│                         generated with `pip freeze > requirements.txt`
│
├── src                <- Source code for use in this project.
│   ├── __init__.py    <- Makes src a Python module
│   │
│   ├── data           <- Scripts to download or generate data
│   │   └── make_dataset.py
│   │
│   ├── features       <- Scripts to turn raw data into features for modeling
│   │   └── build_features.py
│   │
│   ├── models         <- Scripts to train models and then use trained models to make
│   │   │                 predictions
│   │   ├── predict_model.py
│   │   └── train_model.py
│   │
│   └── visualization  <- Scripts to create exploratory and results-oriented visualizations
│       └── visualize.py
│
└── tox.ini            <- tox file with settings for running tox; see tox.testrun.org
```

另一个项目管理方案可以参考：[十项至简规则用jupyter-notebook做可复现性研究](/learning/learning-jupyter/10)

