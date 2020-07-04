# SwiftPracticeResult

Swift代码练习参考，在这里，请每位同学将自己的练习结果放到自己的*用户名/练习名/*目录中

比如 */hd/000Random Seat/main.swift* 或者 */hd/000随机座位/main.swift*

[Swift代码练习系列（Swift CodePractice）](https://hdcola.github.io)

### 000 随机座位

有四个数字：1、2、3、4，能组成多少个互不相同且无重复数字的三位数？各是多少？

> 可填在百位、十位、个位的数字都是1、2、3、4。组成所有的排列后再去 掉不满足条件的排列。

判断、循环、数字处理练习

### 001 日历回收

输入某年某月某日，判断这一天是这一年的第几天？

> 以3月5日为例，应该先把前两个月的加起来，然后再加上5天即本年的第几天，特殊情况，闰年且输入月份大于2时需考虑多加一天。

判断、循环、数字和字符串处理练习

### 002 填支票本

在北美生活需要手写支票，将一个数字转换成为英文大写。需要支持到百万和小数点后两位。

> 1-21; 30; 40; 50; 60; 70; 80; 90; 100; 1,000; 10,000; 100,000; 1,000,000的英文写法如下：

> One, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Eleven, Twelve, Thirteen, Fourteen, Fifteen, Sixteen, Seventeen, Eighteen, Nineteen, Twenty, Twenty-one, Thirty, Forty, Fifty, Sixty, Seventy, Eighty, Ninety, One Hundred, One Thousand, Ten Thousand, One Hundred Thousand, One Million

> 写完整数后，要加上 Dollars

> 当有小数点时，小数点写为 and ，小数点后的会写为 xxx Cents

> 举例： 175.25美元 one hundred seventy five dollars and twenty-five cents

判断、循环、函数、数字和字符串处理练习。也许可以试试递归

### 003 猜数字

经典的猜数字游戏，随机生成一个三位以内的数字作为答案。用户输入一个数字，程序会提示大了或是小了，直到用户猜中。记得提示用户猜中了多少次，看看谁用的次数少！

判断、循环、数字处理练习

### 004 猜数字AI版

输入一个三位以内的数字，AI不断的猜测数字，显示出猜测的次数和数字以及是大了或是小了，看看你写的程序需要用多少次才能猜中，看看谁写出来的AI最聪明！

判断、循环、数字处理练习

### 005 税务计算器

加拿大的个人所得税分为联帮个人所得税和各省各自征收的个人所得税。

以下是2019年的所得税税率，

联邦个人所得税率：47,630$以下为15%；47,630-95,259$为20.5%；95,259-147,667为26%；147,667-210,371$为29%；210,371$以上为33%。

Quebec省个人所得税率：43,790$以下为15%；43,790-87,575$为20%；87,575-106,555$为24%;106,555$以上为25.75%。

请先输入一个年收入的数字，分别计算出联帮所有税、魁省所得税和要交的税收总额。

判断、循环、数字处理练习，试试数组吧。

参考： https://www.canada.ca/en/revenue-agency/services/tax/individuals/frequently-asked-questions-individuals/canadian-income-tax-rates-individuals-current-previous-years.html

### 006 神奇排序

依次输入三个整数，请把这三个数字由小到大输出。

判断、循环、数字处理练习，试试Array或Set吧

### 007 兔子家庭

一般而言，兔子在出生两个月后，就有繁殖能力，一对兔子每个月能生出一对小兔子来。如果所有兔子都不死，那么一年以后可以繁殖多少对兔子？

输入一个月份，假设兔子都是老不死，看看能有多少对兔子。

数字和递归练习，可以搜索一下它的发现者列昂纳多·斐波那契（Leonardo Fibonacci）

### 008 乘法口诀

输出 9*9 乘法口诀表。就像这样

```
1*1=1
2*1=2 2*2=4
3*1=3 3*2=6 3*3=9
4*1=4 4*2=8 4*3=12 4*4=16
5*1=5 5*2=10 5*3=15 5*4=20 5*5=25
6*1=6 6*2=12 6*3=18 6*4=24 6*5=30 6*6=36
7*1=7 7*2=14 7*3=21 7*4=28 7*5=35 7*6=42 7*7=49
8*1=8 8*2=16 8*3=24 8*4=32 8*5=40 8*6=48 8*7=56 8*8=64
9*1=9 9*2=18 9*3=27 9*4=36 9*5=45 9*6=54 9*7=63 9*8=72 9*9=81
```

### 009 菱形

设置一个变量n为要打印的行数，打印出如下图案（菱形），整个菱形的行数是2*n-1

```
   *
  ***
 *****
*******
 *****
  ***
   *
```


### 010 计算容量

已知信息如下：
 
 - iPhone 的容量以千兆字节 (GB) 计算。这部 iPhone 有 128GB 存储容量。
 - 1 千兆字节大约为 1,000 兆字节 (MB)。
 - 手机上已经存储了 39GB 资料。
 - 1 分钟的视频占用 150MB 空间。
 
创建一个字符串，告诉用户手机上可以存储几分钟的视频。首先，需要执行计算步骤，然后使用字符串插值来显示答案，格式如下
 
 ```
 你的手机有 XXX GB存储，
 现在已经使用了 XXX GB，
 还有 XXX GB剩余空间，
 你可以再记录 XXX 分钟视频。
```

 提示：执行所有计算时以兆字节为单位。
  
  - 1 千兆字节大约为 1,000 兆字节 (MB)。
  - 1 千兆字节大约为 1,000 兆字节 (MB)。
 
 ### 011 截取字符串
 
 写个程序把这首诗的顺序写对。
 
```
更上一层楼
欲穷千里目
黄河入海流
白日依山尽
```

### 012 人狗大战

请写一个小游戏，人狗大战，2个角色，人和狗，游戏开始后，生成3个人，3条狗，互相混战，人被狗咬了会掉血，狗被人打了也掉血，狗和人的攻击力，具备的功能都不一样。可以尝试一下这样的内容：

 - 创建人或狗时的血和攻击力是在一个区间中随机生成的
 - 人和狗应该都是动物的子类
 - 人在攻击时会随机的用出打、踹、棍三种方法中的一种
 - 狗在攻击时会随机的用出咬、扑、撞三种方法中的一种
 - 人、狗轮流攻击，每轮随机选择一位攻击对方一位，已经死的不应该被选择到
 
 ### 013 计算器UI
 
 使用SwiftUI写一个你自己喜欢计算器APP的界面，写出必要的注释让将来的自己和他人容易理解，使用SubView将代码结构良好的分割，使用enum和实现了Hashable的方法来设置界面上不同的显示方法。
 
 ### 014 寻找神数
 
 哪三个数，没有一个是零，不管是加法还是乘法，结果都一样？
 
 What three numbers, none of which is zero, give the same result whether they’re added or multiplied?
 
 贡献者:@Yi
 
 ### 015 三角形

打印出如下图案（三角形）

设置一个变量n为要打印的行数，打印出下面这样的

```
   *
  ***
 *****
*******
```

### 016 寻找素数

判断n到m之间有多少个素数，并输出所有素数。

Determine how many prime numbers there are between n and m, and output all prime numbers.

### 017 寻找水仙花数

打印出所有的"水仙花数"，所谓"水仙花数"是指一个三位数，其各位数字立方和等于该数本身。例如：153是一个"水仙花数"，因为153=1的三次方＋5的三次方＋3的三次方。

Print out all the "daffodil numbers". A "daffodil number" is a three-digit number whose cubic sum is equal to the number itself The number 153 is a "daffodil number" because 153 = 1 cubic + 5 cubic + 3 cubic. For example, 153 is a "daffodil number" because 153 = cubic 1 + cubic 5 + cubic 3.

### 018 分解质因数
将一个正整数分解质因数。例如：输入90,打印出 `90=2*3*3*5`。

对n进行分解质因数，应先找到一个最小的质数k，然后按下述步骤完成：

(1)如果这个质数恰等于n，则说明分解质因数的过程已经结束，打印出即可。

(2)如果n<>k，但n能被k整除，则应打印出k的值，并用n除以k的商,作为新的正整数你n,重复执行第一步。

(3)如果n不能被k整除，则用k+1作为k的值,重复执行第一步。

### 019 排队加法

求s=a+aa+aaa+aaaa+aa...a的值，其中a是一个数字。例如2+22+222+2222+22222(此时共有5个数相加)，几个数相加由键盘控制。

示例：
a = 4
n = 4
4 + 44 + 444 + 4444
计算结果为： 4936

### 020 两数之和

给定一个整数数组 `nums` 和一个目标值 `target`，请你在该数组中找出和为目标值的那 `两个` 整数，并返回他们的数组下标。

你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。

Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

示例:
```
给定 nums = [2, 7, 11, 15], target = 9

因为 nums[0] + nums[1] = 2 + 7 = 9
所以返回 [0, 1]
```

Example:

```
Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
```

代码模板

```swift
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    return []
}

for i in twoSum([1,3,5,7,9], 10) {
    show(i)
}

for i in twoSum([3,3], 6) {
    show(i)
}
```

来源: [https://leetcode-cn.com/problems/two-sum/]

### 021 反转整数

给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

示例 1:

```
输入: 123
输出: 321
```

示例 2:

```
输入: -123
输出: -321
```

示例 3:

```
输入: 120
输出: 21
```

代码模板

```
func reverse(_ x: Int) -> Int {

}

show(reverse(123))
show(reverse(-123))
show(reverse(98900))
```

来源：https://leetcode-cn.com/problems/reverse-integer


### 022 Game2048/00 生成随机的2

参考： https://en.wikipedia.org/wiki/2048_(video_game) 

使用  https://github.com/HDCodePractice/SwiftPracticeResult/blob/master/hd/022%20Game2048/00template.swift 

为模板，为Game2048加入按了`w上s下a左d右`后在内容为0的格子中随机挑选一个格子产生一个2或4，直到所有的格子都被填满。

这是 @sunnypo 贡献的题目

### 022 Game2048/01 滑动

我们为`w上s下a左d右`加入滑动的结果，也就是按了相应的按键以后向指定的方向把有相同数字的内容进行相加，并合并到对应的单元格里去。输入`w`将数字向上合并，例如

```
|0|2|4|2|
|0|2|0|2|
|0|2|4|2|
|2|2|0|0|
```

变为

```
|2|4|8|4|
|0|4|0|2|
|0|0|0|0|
|0|0|0|0|
```

请使用 https://github.com/HDCodePractice/SwiftPracticeResult/blob/master/hd/022%20Game2048/01template.swift 为模板
