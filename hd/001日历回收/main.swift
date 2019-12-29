// 返回year是否是闰年
func isLeapYear(year: Int) -> Bool{
    if year % 4 > 0 {
        return false
    }else{
        return true
    }
}

func calday(input: String) -> Int{
    var days = [0,31,28,31,30,31,30,31,31,30,31,30,31]
    let n = Int(input) ?? 0
    let year = Int(n/10000)
    let month = Int(input.suffix(4).prefix(2)) ?? 0
    let day = Int(input.suffix(2)) ?? 0
    var daycount = 0
    
    show("输入的是\(year)年\(month)月\(day)日")
    
    if year == 0 {
        show("输入的数据\(input)中没有年？")
        return 0
    }
    if isLeapYear(year: year) {
        days[2] = 29
    }
    if month > 12 {
        show("输入的月份\(month)不存在呢！")
        return 0
    }
    if day > days[month] {
        show("在\(month)中不存在\(day)日")
        return 0
    }
    for i in 0 ... month - 1 {
        daycount += days[i]
    }
    daycount += day
    return daycount
}

show(calday(input: "1209"))
show(calday(input: "20191309"))
show(calday(input: "20191131"))
show(calday(input: "20190101"))
show(calday(input: "20190201"))
show(calday(input: "20190301"))
show(calday(input: "20200301"))
show(calday(input: "11231"))
