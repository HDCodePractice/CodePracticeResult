

public func plCapital(plRemain:Int)->[Int]{
    
    var plCapital = 0
    var plRemain = 0
    var capitalSum = [Int]()
    var plC = "Yes"
    
    //    while plRemain>=0{
    repeat{
        plCapital = Int(getInput(
            inputPrompt: "How much do you want to deposit?", 
            inputElements: ["yes","no"], 
            errorPrompt: "it's a wrong message,please try again", 
            defaultInput: "No"
        ))!
        
        plRemain = plCapital+plRemain
        //        print(plCapital)
        capitalSum.append(plCapital)
        print(capitalSum)
        showString("Do you want more?")
        plC = askForChoice(strings: ["Yes","No"])
        
    }while plC=="Yes"
    
    show("You have $ \(plRemain) in your account!")
    show("You deposit \(capitalSum.count) times, a total of $\(capitalSum.reduce(0,{x,y in x+y}))")
    //    }
    return capitalSum
}
