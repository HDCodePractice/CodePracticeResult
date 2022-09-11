
public func plBets (_ plRemain:Int)->(
    plBetInt:Int,
    plRemain:Int
    //    plC:String
){
    var plBetInt = 0
    var plBet = ""
    var plRemain = plRemain
    //        var betLimit = [String]()
    var betLimit = ["5","10","20","50","100","200","500","1000","\(plRemain)"]
    
    for i in betLimit{
        if (Int(i)!)>plRemain{
            betLimit.remove(at:betLimit.index(of:i)!)
        }
    }
    //    betLimit.append("others")
    
    plBet = String(
        getInput(
            inputPrompt: "How much do you want to bet?", 
            inputElements: betLimit,
            errorPrompt: "it's a wrong message,please try again", 
            defaultInput: "yes"
        )
    )
    
    //    if !(plBet=="others"){
    //        
    //    }
    
    //    print(plBet)
    
    //    while plBet=="others"{
    //        
    //        plBet = askForNumber()
    //        
    //        if plBet>plRemain{
    //            plBetS = "others"
    //            show("You only have  $\(plRemain), pls try again!")
    //        }
    //    }
    plBetInt=Int(plBet)!
    
    plRemain = plRemain - plBetInt
    
    
    
    show("You are betting $\(plBet). You still have $\(plRemain).")
    
    //    var plC = getInput(inputPrompt: "You don't have enough money! Do you want to continue? ", inputElements: ["Yes","No"], errorPrompt: "wrong message", defaultInput: "Yes").uiS
    
    return(plBetInt,plRemain)
}
