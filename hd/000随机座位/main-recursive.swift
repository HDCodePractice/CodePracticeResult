let numbers = [1,2,3,4,5,6,7,8,9]
let numbersCount = numbers.count - 1 
var count = 0

// 获取数字，n为现有的数字，bit为当前的位数
func getNumber(n: Int,bit: Int) {
    for i in numbers{
        // 把i放到n的前面，如果n为0，哪么说明就只有i
        var s = ""
        if n == 0 {
            s = "\(i)"
        }else{
            s = "\(i)\(n)"
        }
        
        if bit == numbersCount{
            // 判断s里是不是有重复的数字 
            if Array(s).count == Set(s).count {
                count += 1
//                  show("第\(count)个是:\(s)")
            }
        }else{
            getNumber(n: Int(s) ?? 0 , bit: bit + 1)
        }
    }
}

show("需要\(numbersCount)位数")
getNumber(n: 0, bit: 1)
show("总共有\(count)个数")
