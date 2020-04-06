# 实验2
## 实验要求
- 下载asciinema，完成vimtutor操作全程录像。
- 完成自查清单。
## 实验环境
- Ubuntu 18.04.4
- asciinema
## 实验过程
### 下载asciinema
```
apt-get install asciinema
```
### 开始和结束命令
```
开始录像：asciinema rec
结束录像：exit
```
### 实验录像

 [lesson 1](https://asciinema.org/a/iTHvuB2lY1npf3azdSrewQ9to)

 [lesson 2]( https://asciinema.org/a/EclLSMJMRayymZtIKNnwUGQDr
)

[lesson 3](https://asciinema.org/a/waR9Ipo325IA5E0jnHondthMg
)

[lesson 4](https://asciinema.org/a/fjAadDTk2wIyFMxzUEtJdw4f3)

[lesson 5](https://asciinema.org/a/lGNfy4n6DXc4H2qgNm5jW1rWk)

[lesson 6]( https://asciinema.org/a/wSMBoAIgyQyuNjG4NtGexJG5I
)

[lesspn 7]( https://asciinema.org/a/s05fdgReMLm1l70ihd6ozcHDE
)

## 自查清单
- vim工作形式
```
command-mode
insert-mode
visual-mode
normal-mode
```
- Normal模式下，一次向下移动十行
```
10j
```
- 快速移动到文件开始行和结束行
```
开始行：gg
结束行：G
```
- 快速跳转到第N行
```
Ngg
```
- Normal模式下删除单个字符、单个单词、从当前行光标一直删除到行尾、单行、当前行开始向下数N行
```
删除单个字符：x
删除单个单词：dw
删除到行尾：d$
删除单行：dd
删除到第N行：Ndd
```
- 在vim中快速插入N个空行
```
No+esc
```
- 在vim中快速输入80个-
```
80i- + esc
```
- 撤销最近一次编辑操作
```
u
```
- 重做最后一次被撤销的操作
```
CTRL+R
```
- 剪切单个字符、单行；复制、粘贴
```
单个字符：d
单行：dd
复制：yy
粘贴：p
```
- 编辑文字的操作方式
```
a;i;o;O;x;d;y;p;ce;c$
```
- 查看当前正在编辑的文件名的方法
```
CTRL+G和:f
```
- 文件中关键词搜索；忽略大小写匹配搜索；匹配搜索高亮显示；匹配关键词批量替换
```
/   ?   n   N
:set ic
:set hls is
:s/old/new/g
```
- 在文件中最近编辑过的位置来回快速跳转的方法
```
CTRL+i
```
- 如何把光标定位到各种括号的匹配项
```
%
```
- 在不退出vim的情况下执行一个外部程序的方法
```
:!
```
- 如何使用vim的内置帮助系统来查询一个内置默认快捷键的使用方法？如何在两个不同的分屏窗口中移动光标？
```
:help
CTRL+W
```