var m = 0
var n = 100
var numbers : [Int] = []
func find(_ na : Int, _ ma : Int)-> [Int]{
    var final : [Int] = []
    for i in na ... ma {
        if i > 2 {
            for j in 2 ... i - 1{
                if i % j == 0{
                    break
                }else if j == i - 1{
                    final.append(i)
                }
            }
        }else if i == 2{
            final.append(i)
        }
    }
    return final
}
show("\(find(m,n))")
