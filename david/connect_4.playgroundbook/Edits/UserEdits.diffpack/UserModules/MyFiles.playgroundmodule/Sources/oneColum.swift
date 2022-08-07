
func oneColum(
    _ column:[String],
    _ chessman:String
)->(
    column:[String],
    fullMark:Bool,
    rowNum:Int
){
    var column = column
    var fullMark = false
    var rowNum = 0
    
    if (column.last == "n") {
        
        for i in 0...column.count-1{
            if column[i] == "n"{
                column[i] = chessman
                fullMark = true
                rowNum = i
                return (column,fullMark,rowNum)
            }
        }
        
    }else{
        
        fullMark = false
        rowNum = 0
        return (column,fullMark,rowNum)
        
    }
    
    return (column,fullMark,rowNum)
}
