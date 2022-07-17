func showString(_ string: String){
    // 如果是cmd
    //    print(string)
    // 如果是swift playgrounds
    show(string)
}

public func getInput(inputPrompt:String, 
              startNumber:Int, 
              errorPrompt:String, 
              defaultInput: Int) -> Int{
    showString(inputPrompt)
    var ui = askForNumber()
    
    while ui < startNumber {
        showString(errorPrompt)
        ui = askForNumber()
    }
    return ui
}

public func checkInput(_ userInput:String)->Bool{
    let inputElement=["0","1","2","3","4","5","6","7","8","9","A","a","B","b","C","c","D","d","E","e","F","f","G","g","H","h","I","i","J","j","K","k","L","l","M","m","N","n","O","o","P","p","Q","q","R","r","S","s","T","t","U","u","V","v","W","w","X","x","Y","y","Z","z"]
    for i in userInput{
        print(inputElement.contains(String(i)))
        if inputElement.contains(String(i)) == false{
            return true
        }
    }
    return false
}

public func getInput(inputPrompt:String, 
                     errorPrompt:String) -> String{
    showString(inputPrompt)
    var ui = ask()
    while String(ui.last!) == " " || String(ui.last!) == "\n"{
        ui.removeLast()
    }
    
    while checkInput(ui) {
        showString(errorPrompt)
        ui = ask()
    }
    return ui
}

public func getPlayerNum()->Int{
    let ui = getInput(
        inputPrompt: "请输入有几个玩家，人数要大于1",
        startNumber: 2, 
        errorPrompt:"你输入的不是一个大于1的数字，请重新输入",
        defaultInput: 2)
    return ui
}

public func getSuitsNum()->Int{
    let ui = getInput(
        inputPrompt: "请输入需要几副牌，最少1副",
        startNumber: 1, 
        errorPrompt:"你输入的不是一个大于0的数字，请重新输入",
        defaultInput: 1)
    return ui
}




public func getPlayerName()->String{
    let ui = getInput(
        inputPrompt: "请输入player的名字，只可以用字母或数字",
        errorPrompt:"你输入的不是一个只包括字母或数字的名字，请重新输入" )
    return ui
}

public func genPlayerArray(playerNum:Int)->[String]{
    var names = [String]()
    for i in 0...playerNum-1{
        names.append(getPlayerName())
    }
    return names
}
