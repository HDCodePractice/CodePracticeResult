
public func getInput(
    inputPrompt:String,
    inputElements:[String],
    errorPrompt:String,
    defaultInput: String
)->String{
    var ui = ""
    while !inputElements.contains(ui){
            
            ui=askForChoice(strings: inputElements) 
        
    }
    return ui
}

// 2. for replit

//func getInput(inputPrompt:String, 
//              inputElement:[String], 
//              errorPrompt:String, 
//              defaultInput: String) -> String{
//    var ui = ""
//    repeat{
//        print ("")
//        if ui==""{
//            print (inputPrompt)
//        }else{
//            print (errorPrompt)
//        }
//        ui = readLine () ?? defaultInput
//    }while !inputElement.contains(ui)
//    return ui
//}
