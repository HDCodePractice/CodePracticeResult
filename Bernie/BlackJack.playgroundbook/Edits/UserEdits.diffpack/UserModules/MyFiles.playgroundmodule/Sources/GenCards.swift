// 为了支持双平台cmd&SwiftPlayground

public func showString(_ string: String){
    // 如果是cmd
    print(string)
    // 如果是swift playgrounds
    // show(string)
}

public func getInput(inputPrompt:String,
              inputElement:[String],
              errorPrompt:String,
              defaultInput: String)-> String{
    var ui = ""
    repeat{
        show("")
        if ui==""{
            show (inputPrompt)
        }else{
            show (errorPrompt)
        }
        ui = askForChoice(strings: inputElement) ?? defaultInput
    }while !inputElement.contains(ui)
    return ui
    // showString(inputPrompt)
    // return askForChoice(strings: inputElement)
}

// print(getInput(inputPrompt:"你还要牌吗? Y/N",
//               inputElement:["Y","y","N","n"],
//               errorPrompt:"你输入的不是Y/N, 请重新输入",
//               defaultInput: "n"))

//输入有几个player玩
public func askPlayerNum()->Int{
    let input = getInput(inputPrompt:"请输入有几个玩家，2～9",
                         inputElement:["2","3","4","5","6","7","8","9"],
                         errorPrompt:"你输入的不是2～9, 请重新输入",
                         defaultInput: "2")
    return Int(input)!
}

// print(askPlayerNum())

public func genIndices()->[Int]{
    var indices : [Int] = []
    for i in 0...51{
        indices.append(i)
    }
    return indices
}

public func genMarks()->[Int]{
    let suitMarks = [2,3,4,5,6,7,8,9,10,10,10,10,11]
    let suits  = ["♦️","♣️","♥️","♠️"]
    var setmarks : [Int] = []
    for _ in suits{
        for i in suitMarks{
            setmarks.append(i)
        }
    }
    return setmarks
}

public func genCards()->[String]{
    let suits  = ["♦️","♣️","♥️","♠️"]
    let suitMarks = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    var cards: [String] = []
    for j in suits{
        for i in suitMarks{
            cards.append("\(j)\(i)")
        }
    }
    return cards
}

public extension Int{
    mutating  func genSmallMark()->Int{
        if self == 11{
            self = 1
        }
        return self
    }
}

// var cs = 0
// var cs2 = 0
// var cards = genCards()
// var indices = genIndices()
// var cardMarks = genMarks()
// cs = cardMarks[5] + cardMarks[18] + cardMarks[33] + cardMarks[51]
// cs2 = cardMarks[5] + cardMarks[18] + cardMarks[33] + cardMarks[51].genSmallMark()

// 一个player 抽一次牌
public func drawOnce(cardB4:[Int],playerCardB4:[Int])->(cardAft:[Int],playerCardAft:[Int]){
    let randomCard = cardB4.randomElement()!
    var pcardB4  = playerCardB4
    pcardB4.append(randomCard)
    let playerCardAft : [Int] = pcardB4
    let cardAft = cardB4.filter{$0 != randomCard}
    return (cardAft,playerCardAft)
}

// var pcardsB4: [Int] = []
// print(drawOnce(cardB4:indices,playerCardB4:pcardsB4))

//根据player数量，创建持牌信息的数组
public func multiPlayer(playerNum:Int)-> [[Int]]{
    let playerCard: [Int] = []
    var mPlayerCard: [[Int]] = []
    for _ in 1...playerNum{
        mPlayerCard.append(playerCard) 
    }
    return mPlayerCard
}

// print(multiPlayer(playerNum:3))

//所有players抽一次
public func mPlayerDraw(cardB4:[Int],mPlayerCardB4:[[Int]],playerNum:Int,currentInputResult:[String])->(cardAft:[Int],mPlayerCardAft:[[Int]]){
    var cardLeft: [Int] = cardB4
    var playerCardAft: [Int] = []
    // let mPlayerCardLeft: [[Int]] = mPlayerCardB4
    var mPlayerCardAft: [[Int]] = mPlayerCardB4
    var cardAft: [Int] = []
    
    for i in 0...playerNum-1{
        if currentInputResult[i] == "y"{
            let draw = drawOnce(cardB4: cardLeft, playerCardB4: mPlayerCardB4[i])
            cardLeft = draw.cardAft
            playerCardAft = draw.playerCardAft
            mPlayerCardAft[i] =  playerCardAft
        }
    }
    cardAft = cardLeft
    return (cardAft,mPlayerCardAft)
}

// print(mPlayerDraw(cardB4:genIndices(),mPlayerCardB4:[[5],[9]],playerNum:2,currentInputResult:["y","y"]))

//所有player 抽两次
public func mPlayer2Draw(cardB4:[Int],mPlayerCardB4:[[Int]],playerNum:Int)->(cardAft:[Int],mPlayerCardAft:[[Int]]){
    
    // var cardLeft: [Int] = []
    // var mPlayerCardAft: [[Int]] = []
    var oldCard: [Int] = cardB4
    var oldPlayerCard: [[Int]] = mPlayerCardB4 
    var inputResult: [String] = []
    
    for _ in 1...playerNum{
        inputResult.append("y")
    }
    
    for _ in 1...2{
        let draw = mPlayerDraw(cardB4: oldCard, mPlayerCardB4: oldPlayerCard, playerNum: playerNum,currentInputResult:inputResult)
        oldCard = draw.cardAft
        oldPlayerCard = draw.mPlayerCardAft
    }  
    return (oldCard,oldPlayerCard)
}

// print(mPlayer2Draw(cardB4:genIndices(),mPlayerCardB4:[[5],[9]],playerNum:2))

//判断是否等于21
public func is21(mPlayerCard:[[Int]])->[Bool]{
    
    var isOrNot: [Bool] = []
    var result: Int = 0
    let allMarks = genMarks()
    for i in mPlayerCard{
        // print(i)
        var playerMark: [Int] = []
        for j in i{
            playerMark.append(allMarks[j])
        }
        // print(playerMark)
        result = playerMark.reduce(0,{x,y in x+y})
        if result == 21{
            isOrNot.append(true)
        }else{
            isOrNot.append(false)
        }
    }
    return isOrNot
}

// var mPlayerCard = [[4, 35], [48, 25]]
// print(is21(mPlayerCard: mPlayerCard))

// 发布获得21的赢家
public func winner21(mPlayerCard:[[Int]])->String{
    //判断是否有人得分等于21 而获胜
    var msg: String = ""
    let twentyOne = is21(mPlayerCard:mPlayerCard)
    if twentyOne.contains(true){
        for i in twentyOne{
            if i == true{
                let is21msg = "\n player \(i) 赢了"
                msg += is21msg
            }
        }
    }
    return msg
}

//判断是否爆牌 大于21
public func is21Bigger(mPlayerCard:[[Int]])->[Bool]{
    
    var isOrNot: [Bool] = []
    var result: Int = 0
    var allMarks = genMarks()
    for i in mPlayerCard{
        // print(i)
        var playerMark: [Int] = []
        for j in i{
            playerMark.append(allMarks[j].genSmallMark())
        }
        // print(playerMark)
        result = playerMark.reduce(0,{x,y in x+y})
        if result > 21{
            isOrNot.append(true)
        }else{
            isOrNot.append(false)
        }
    }
    return isOrNot
}


// var mPlayerCard = [[37, 49], [40, 12]]
// print(is21Bigger(mPlayerCard: mPlayerCard))

//发布大于21点的输家
public func loser21Plus(mPlayerCard:[[Int]])->String{
    //判断是否有人得分大于21 而赌输
    var msg: String = ""
    let check21Bigger = is21Bigger(mPlayerCard:mPlayerCard)
    // print(check21Bigger)
    if check21Bigger.contains(true){
        for j in 1...check21Bigger.count{
            if check21Bigger[j-1] == true{
                let is21Bigger = "\n player \(j) 输了"
                msg += is21Bigger
            }
        }
    }
    return msg
}

// var mPlayerCard = [[37, 49], [40, 12]]
// print(loser21Plus(mPlayerCard: mPlayerCard))

//问所有player 是否继续要牌  每轮无论上轮输入什么这轮都可以输入
public func askInputs(mPlayerInputs:[String],playerNum:Int)->[String]{
    var mPlayerInputResult: [String] = []
    if mPlayerInputs.count == 0{
        for i in 1...playerNum{
            let input = getInput(inputPrompt:"player \(i) 你还要牌吗? Y/N",
                                 inputElement:["Y","y","N","n"],
                                 errorPrompt:"你输入的不是Y/N, 请重新输入",
                                 defaultInput: "n")
            mPlayerInputResult.append(input)
        }
    }else{
        mPlayerInputResult = mPlayerInputs
        for j in 1...playerNum{
            if mPlayerInputs[j-1] == "y"{
                let input = getInput(inputPrompt:"player \(j) 你还要牌吗? Y/N",
                                     inputElement:["Y","y","N","n"],
                                     errorPrompt:"你输入的不是Y/N, 请重新输入",
                                     defaultInput: "n")
                mPlayerInputResult[j-1] = input
            }else{
                mPlayerInputResult[j-1] = mPlayerInputs[j-1]
            }
        }
    }
    return mPlayerInputResult
}


// var mPlayerInputs: [String] = ["y","n","y"] 
// print(askInputs(mPlayerInputs:mPlayerInputs,playerNum:3))

//判断是不是所有player 都不要牌
public func noNewCard(currentInputResult:[String])->Bool{
    let a = Set(currentInputResult)
    if a.count == 1 && a == ["n"]{
        return true
    }else{
        return false
    }
}

// var currentInputResult = ["y","n","n","n"]
// print(noNewCard(currentInputResult: currentInputResult))

//如果有A或多个A  计算有几个A变为1 可以让player得分尽量高 
public extension Array where Element == Int{
    mutating  func has11()->Int{
        var result: Int = 0
        if self.contains(11){
            let numOf11 = self.count - self.filter{$0 != 11}.count
            result = self.reduce(0,{x,y in x+y})
            for _ in 1...numOf11{
                if result > 21{
                    result -= 10
                }  
            }  
        }else{
            result = self.reduce(0,{x,y in x+y})
        }
        return result
    }
}

//都没爆牌 比大小
public func whoIsBigger(mPlayerCard:[[Int]])->String{
    
    let allMarks = genMarks()
    var mPlayerMark: [[Int]] = []
    // var result: Int = 0
    var mPlayerScore: [Int] = []
    var msg: String = ""
    
    for i in mPlayerCard{
        var playerMark: [Int] = []
        for j in i{
            playerMark.append(allMarks[j])
        }
        mPlayerMark.append(playerMark)
    }
    
    for k in mPlayerMark{
        var a = k
        mPlayerScore.append(a.has11())
        // result = k.reduce(0,{x,y in x+y})
        // if result < 22{
        //   mPlayerScore.append(result)
        // }else if result > 21 && result < 32{
        //   mPlayerScore.append(result-10)
        // }else if result > 31 && result < 42{
        //   mPlayerScore.append(result-20)
        // }else if result > 41 && result < 52{
        //   mPlayerScore.append(result-30)
        // }else if result > 51 && result < 56{
        //   mPlayerScore.append(result-40)
        // }
    }
    let biggest = mPlayerScore.max()!
    if Set(mPlayerScore).count == mPlayerCard.count{
        let index = mPlayerScore.firstIndex(of: biggest)!
        msg = "player \(index+1) 赢了"
    }else{
        msg = "平了"
    }
    return msg
}

//计算分数
public func score(mPlayerCard:[[Int]])->[Int]{
    let allMarks = genMarks()
    var mPlayerMark: [[Int]] = []
    // var result: Int = 0
    var mPlayerScore: [Int] = []
    // var msg: String = ""
    
    for i in mPlayerCard{
        var playerMark: [Int] = []
        for j in i{
            playerMark.append(allMarks[j])
        }
        mPlayerMark.append(playerMark)
    }
    for k in mPlayerMark{
        var a = k
        mPlayerScore.append(a.has11())
        // result = k.reduce(0,{x,y in x+y})
        // if result < 22{
        //   mPlayerScore.append(result)
        // }else if result > 21 && result < 32{
        //   mPlayerScore.append(result-10)
        // }else if result > 31 && result < 42{
        //   mPlayerScore.append(result-20)
        // }else if result > 41 && result < 52{
        //   mPlayerScore.append(result-30)
        // }else if result > 51 && result < 56{
        //   mPlayerScore.append(result-40)
        // }
    }
    return mPlayerScore
}

//显示牌面
public func card(mPlayerCard:[[Int]])->[[String]]{
    let cardSet = genCards()
    var allCard: [[String]] = []
    for i in mPlayerCard{
        var playerCard: [String] = []
        for j in i{
            playerCard.append(cardSet[j])
        }
        allCard.append(playerCard)
    }
    return allCard
}


