

public func getInput(
    inputPrompt:String,
    //    startNumber:Int,
    //    endNumber:Int,
    inputElements:[String],
    errorPrompt:String,
    defaultInput: String
)->String{
    var ui = ""
    
    
    if !inputPrompt.contains("bet")&&inputPrompt.contains("How much")||inputPrompt.contains("how much"){
        
        
        if ui==""{
            showString(inputPrompt)
        }else{
            showString(errorPrompt)
        }
        ui = String(askForNumber())
        
        
    }else{
        while !inputElements.contains(ui){
            showString(inputPrompt)
            ui=askForChoice(strings: inputElements) //***
        }
        
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
