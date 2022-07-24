//var b = String()
public func isSameColor(_ c:[String],mark:String)->Bool{
    var counts = 1
    var colFlag = String()
    for i in c{
        if colFlag == mark && colFlag != "n"{
            counts += 1
        }else{
            counts = 1
        }
        if counts==4{
            return true
        }
        colFlag = i
    }
    return false
}
