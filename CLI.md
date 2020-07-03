# Linux & Mac & BSD  CLI 命令行入门


## 在Mac里打开终端

* 在Mac下打开终端  `Ctrl+空格` 输入 `terminal.app` 就可以打开终端

* 在Finder里，左边的 `Applications` 中的 `Utilities` 中有 `Terminal.app` 

每个命令行前都会有一段固定的内容，叫提示(prompt)。闪烁的光标就是你可以输入的内容了。

### pwd

显示当前所在的文件夹（目录）

### ls

列出当前目录里的文件和文件夹。

ls -ahl

a 显示隐藏文件
h 显示文件的属性
l 显示文件的大小

ls --help

显示帮助，所有的命令基本上都可以使用 --help 参数显示帮助 

### man

man cmd

显示出`cmd`的手册帮助。按`q`退出显示帮助。

### mkdir

mkdir <dirname>
  
建立一个指定名子的目录。

### cd

cd <dirname>
  
改变当前目录到指定路径去。

`.` 这个名字的目录是当前目录
`..` 这个名字的目录是上一层目录

所有的目录里都有这两个目录。
