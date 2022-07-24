
public func playerGains(_ records:[Bool])->Int{
    var gains = 0
    var times = 0
    var a = Bool()
    var gainsList = [Int]()
    var sumGains = 0
    
    for i in records{
        if i{
            gains = 10
        }else{
            gains = -10
        }
        
        if a == i{
            times += 1
            gains = gains*(1<<times)
            
        }else {
            times = 0
        }
        a = i
        sumGains = sumGains + gains
//        print(gains)
        gainsList.append(gains)
        
        
    }
    print(gainsList)
    
    return sumGains
}
