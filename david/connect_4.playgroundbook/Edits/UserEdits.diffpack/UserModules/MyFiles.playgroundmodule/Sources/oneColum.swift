
public func oneColum(
    _ column:[String],
    _ chessman:String
)->(
    column:[String],
    fullMark:Bool,
    i:Int
){
    var column = column
    var fullMark = false
    
    
    if (column.last != "n") {
        show("The column is full, please choose another column!")
        return (column,fullMark,0)
        
    }
    
    for i in 0...column.count-1{
        if column[i] == "n"{
            column[i] = chessman
            fullMark = true
//            break
            return (column,fullMark,i)
        }
    }
    
    return (column,fullMark,0)
}
