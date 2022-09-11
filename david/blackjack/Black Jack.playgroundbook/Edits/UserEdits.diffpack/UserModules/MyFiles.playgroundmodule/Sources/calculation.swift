
public func cardCal(
    _ playerCardsIndex:[[Int]]
)->[Int]{
    
    let players = playerCardsIndex.count
    //    var score = Array(repeating:Int(), count:players)
    var score = [Int]()
    var cardMark = genCardMarks()
    var plMark = Array(repeating:[Int](), count:players)
    
    for i in playerCardsIndex{
        for j in i{
            plMark[playerCardsIndex.index(of:i) ?? 0].append(cardMark[j])
            
        }
        var playerSum = plMark[playerCardsIndex.index(of:i) ?? 0].reduce(0, {x,y in x+y })
        score.append(playerSum)
        //        print(i)
        //        print(plMark)
    }
    //    print(playerCardsIndex)
    return score
}

//上面两种产生数组的方法我在使用过程中的体会，第二种是空数组，第一种是非空数组。
//第一次使用数组索引，还不熟悉
