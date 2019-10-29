---
title: "PBS 常用命令"
date: 2019-08-16
categories:
- Linux
tags:
- PBS 
- server
toc: true  # Show table of contents? true/false
type: docs  # Do not modify.
weight: 20
menu:
    linux:
---

PBS 是公开源代码的作业管理系统，在此环境下运行，用户不需要指定程序在哪些节点上运行，程序所需的硬件资源由PBS管理和分配。
<!--more-->

### PBS 命令

PBS 提供4 条命令用于作业管理。

- qsub 命令—用于提交作业脚本  
命令格式：
qsub [-a date_time] [-c interval] [-C directive_prefix]
[-e path] [-I] [-j join] [-k keep] [-l resource_list] [-m mail_options]
[-M user_list][-N name] [-o path] [-p priority] [-q destination] [-r c]
[-S path_list] [-u user_list][-v variable_list] [-V]
[-W additional_attributes] [-z]
[script]
参数说明：因为所采用的选项一般放在pbs 脚本中提交，所以具体见PBS 脚本选项。  
例：# **qsub aaa.pbs** 提交某作业，系统将产生一个作业号

- qstat 命令—用于查询作业状态信息
命令格式：qatat [-f][-a][-i] [-n][-s] [-R] [-Q][-q][-B][-u]
参数说明：

|            |                                              |
| ---------- | -------------------------------------------- |
| -f         | jobid 列出指定作业的信息                     |
| -a         | 列出系统所有作业                             |
| -i         | 列出不在运行的作业                           |
| -n         | 列出分配给此作业的结点                       |
| -s         | 列出队列管理员与scheduler 所提供的建议       |
| -R         | 列出磁盘预留信息                             |
| -Q         | 操作符是destination id，指明请求的是队列状态 |
| -q         | 列出队列状态，并以alternative 形式显示       |
| -au userid | 列出指定用户的所有作业                       |
| -B         | 列出PBS Server 信息                          |
| -r         | 列出所有正在运行的作业                       |
| -Qf  queue | 列出指定队列的信息                           |
| -u         | 若操作符为作业号，则列出其状态。             |
若操作符为destination id，则列出运行在其上的属于user_list 中用户的作业状态。  
例：# qstat -f 211 查询作业号为211 的作业的具体信息。

- qdel 命令—用于删除已提交的作业
命令格式：qdel [-W 间隔时间] 作业号
命令行参数：
例：# qdel -W 15 211 15 秒后删除作业号为211 的作业

- qmgr 命令—用于队列管理
qmgr -c  "create queue batch queue_type=execution"
qmgr -c "set queue batch started=true"
qmgr -c "set queue batch enabled=true"
qmgr -c "set queue batch resources_default.nodes=1"
qmgr -c "set queue batch resources_default.walltime=3600"
qmgr -c "set server default_queue=batch"

### PBS 脚本文件

PBS 脚本文件由脚本选项和运行脚本两部分组成。
> * PBS 作业脚本选项 （若无-C 选项，则每项前面加‘#PBS’）
>
|                          |                                                                          |
| ------------------------ | --------------------------------------------------------- |
| -a date_time             | date_time 格式为：[[[[CC]YY]MM]DD]hhmm[.SS]表示经过date_time 时间后作业才可以运行。|
| -c interval              | 定义作业的检查点间隔，如果机器不支持检查点，则忽略此选项。                              |
| -C directive_prefix      | 在脚本文件中以directive_prefix 开头的行解释为qsub 的命令选项。（若无此选项，则默认为’#PBS’ ） |
| -e path                  | 将标准错误信息重定向到path                                                            |
| -I                       | 以交互方式运行|
| -j join                  | 将标准输出信息与标准错误信息合并到一个文件join 中去。|
| -k keep                  | 定义在执行结点上保留标准输出和标准错误信息中的哪个文件。|
|                          | keep 为o 表示保留前者，e 表示后者，oe 或eo 表示二者都保留，|
|                          | n 表示皆不保留。若忽略此选项，二者都不保留。|
| -l resource_list         | 定义资源列表。以下为几个常用的资源种类。|
| cput=N                   | 请求N 秒的CPU 时间; N 也可以是hh:mm:ss 的形式。 |
| mem=N[K\|M\|G][B\|W]     | 请求N {kilo\|mega\|giga}{bytes\|words} 大小的内存。 |
| nodes=N:ppn=M            | 请求N 个结点，每个结点M 个处理器。  |
| -m mail_options          | mail_option 为a：作业abort 时给用户发信；为b：作业开始运行发信；为e：作业结束运行时发信。若无此选项，默认为a。 |
| -M user_list             | 定义有关此作业的mail 发给哪些用户。 |
| -N name                  | 作业名，限15 个字符，首字符为字母，无空格。    |
| -o path                  | 重定向标准输出到path。 |
| -p priority              | 任务优先级，整数，[-1024，1023]，若无定义则为0.|
| -q destination           | destination 有三种形式： queue , @server,queue@server。  |
| -r y\|n                  | 指明作业是否可运行，y 为可运行，n 为不可运行。 |
| -S shell                 | 指明执行运行脚本所用的shell，须包含全路径。   |
| -u user_list             | 定义作业将在运行结点上以哪个用户名来运行。  |
| -v variable_list         | 定义export 到本作业的环境变量的扩展列表。   |
| -V                       | 表明qsub 命令的所有环境变量都export 到此作业。    |
| -W additional_attributes | 作业的其它属性。      |
| -z                       | 指明qsub 命令提交作业后，不在终端显示作业号。   |


- 运行脚本同LINUX 下一般的运行脚本文件。
[注]：脚本文件中的mpirun_rsh 命令行中的节点列表文件要用环境变量表示\$PBS\_NODEFILE，这个环境变量表示由pbs 自动分配给作业的节点列表；节点数为命令行中指定的进程数。
格式如下：
mpirun_rsh –np 进程数 –hostfile $PBS_NODEFILE 可执行程序名

### PBS 环境下运行示例
 脚本文件编辑示例
>实例1：运行mpi 程序
>>命令行：#vi aaa.pbs
编辑的内容:
```#PBS -N myjob
#PBS -o /home/jz/my.out
#PBS -e /home/jz/my.err
#PBS –l nodes=2:ppn=2
```
>>cd 目录（你们原来直接在节点上运行时所在的目录）
```
mpirun_rsh –np 4 –hostfile $PBS_NODEFILE /home/jz/helloworld
```
>>解释：原先大家都是在中断输入 mpirun_rsh…..这些命令执行程序的，现在只要把这些提交命令放在.pbs 配置文件的最后，由PBS 来调度执行（自动分配节点和其它资源）。
Myjob 是为你此次要运行的程序起的任务名，可以改成你自己想要的名字原先输出信息都是直接在屏幕上显示的，现在屏幕上的显示全部输出到文件中，上例中输出文件是`/home/jz/my.out` 文件，大家可以根据自己的需要修改（目录，文件名）。程序运行时遇到的一些错误会记录在.err 文件中。好处:因为对每个任务都设定了不同的输出文件，所以看结果只要打开相应文件看就可以了，不需要开多个终端，而且里面有任务的详细信息，比如实际分配的是哪些节点计算，运行时间等。
`#PBS –l nodes=2:ppn=2`，你们程序需要几个节点只要修改nodes 后的数字就可以了，`ppn=2` 保持不变，因为我们的机器每个节点都是双cpu 的。
`mpirun_rsh –np 4 –hostfile $PBS_NODEFILE /home/jz/helloworld`
此例中-np 后的4 是并行数（2 × 2 ＝ 4 个cpu ）， `–hostfile $PBS_NODEFILE 不需要改变。
/home/jz/helloworld` 是你编译好的可执行文件名，需修改。
对于每个你要运行的mpi 程序都需要这样一个.pbs 配置文件
也就是说大家原来的操作是：mpirun…………
现在改成2 步走：1）写个pbs 配置文件(比如xxx.pbs)；2）向pbs 提交（qsub xxx.pbs）

>实例2：运行非mpi 程序
>>有些用户并不是自己编写mpi 程序，同样也可以用pbs 提交。
比如物理系运行程序时一般输入的命令是 RunDMol3.sh TiFeCp2-pbe-dspp-m=1-opt ，那么配置文件可以
这样写：
命令行：#vi job.pbs
编辑的内容：
```
#PBS -N physics_job
#PBS -o /home/physics/physics_job.out
#PBS -e /home/physics/physics_job.err
#PBS -l nodes=1:ppn=2
#PBS -r y
```
>>cd 目录（你们原来直接在节点上运行时所在的目录）
RunDMol3.sh TiFeCp2-pbe-dspp-m=1-opt
>>解释：也就是说把原来在终端直接输入的命令RunDMol3.sh TiFeCp2-pbe-dspp-m=1-opt 放到pbs 配置文件中，因为你们只要一个节点，所以nodes=1，至于用哪个节点系统自动分配，你们肯定很关心是分配了哪个节点给你们，那么可以用qstat 命令查询（比如qstat -n）。


提交作业示例
>命令行：#qsub aaa.pbs


 作业状态查询示例
>Qstat 后加不同参数可以查看不同的信息（各参数的意思，上面有详细的说明，你们可以一个个试验一下，以后就知道查看哪些信息，需要哪些参数）
>实例：
>命令行：#qstat –a （查看作业的状态) 
>>解释：Job id 211 是给你提交的任务分配的任务号，S（任务状态，R 表示正在运行，Q 表示正在排队等候调度）
>
>命令行：#qstat –n （查看作业使用的节点）
>>解释:blade32 就是分给你这个任务的节点
>
>命令行：#qstat –f 211 （查看有关作业运行具体信息）
>
>>解释：exec_host 显示的是实际执行该任务的节点

