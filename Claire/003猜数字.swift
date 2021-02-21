var rNumber = Int.random(in: 0 ... 99)
var input = askForNumber("选一个两位数？")
var time = 1
while rNumber != input {
    if rNumber < input {
        show("哦不！你猜的太大啦！重新猜一遍吧！")
    } else if rNumber > input {
        show("哦不！你猜的太小啦！重新猜一遍吧！")
    }
    input = askForNumber("再来试试？")
    time += 1
}
show("恭喜你答对啦！正确的数字是\(rNumber)！你一共用了\(time)猜中了这个数字，重新来一次吧？")
