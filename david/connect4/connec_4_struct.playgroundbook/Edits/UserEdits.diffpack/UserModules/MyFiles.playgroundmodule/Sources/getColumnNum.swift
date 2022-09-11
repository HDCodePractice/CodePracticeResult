
public func getColumnNum(column:Int)->Int{
    var columnMenu = [String]()
    for i in 0...column-1{
        columnMenu.append(String(i))
    }//这个是做下拉菜单的选项
//    print(columnMenu)
    var columnNum = Int(
        getInput(
            inputPrompt: "please input your choice!",
            inputElements:columnMenu,
            errorPrompt: "again",
            defaultInput: "0"
        )
    )!
    return columnNum
}
