let numbers = [1,2,3,4,5]
let numbersCount = numbers.count - 1 
var count = 0

// 获取数字，n为现有的数字，bit为当前的位数
func getNumber(n: Int,bit: Int) {
    // 以下相当于10的bit次方计算
    var a = 1
    if bit > 1 {
        for i in 1 ... bit - 1 {
            a = a * 10
        }
    }
    
    for i in numbers{
        if bit < 2{
            let s = String(i * a + n)
            // 判断s里是不是有重复的数字
            if Array(s).count == Set(Array(s)).count {
                count += 1
                show("第\(count)个是:\(s)")
            }
        }
        if bit > 1 {
            getNumber(n: i * a + n , bit: bit - 1)
        }
    }
}

show("需要\(numbersCount)位数")
getNumber(n: 0, bit: numbersCount)
