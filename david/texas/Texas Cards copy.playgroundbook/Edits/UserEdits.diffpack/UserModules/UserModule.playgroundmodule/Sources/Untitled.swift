
//    var cardNums = isHighCard(cards: cards)
//    var cards = isHighCard(cards: cards)
//    var shows:[String]=[]
//    for i in cards{
//        shows.append(showCard(card: i))
//    }
//    shows.sort()
////    shows.reverse()
//    return shows
//}
//public func showCard(card: Int)->String{
//    var cardShow=String()
//    var cardsTypes = ["♠️","♥️","♣️","♦️"]
//    var cardNum = showCardNum(card: card)
//    if card != 1{
//        if (card-2)/13==0{
//            cardShow = cardsTypes[(card-2)/13]+showCardNum(card: card)
//        }else if (card-2)/13==1 {
//            cardShow = cardsTypes[(card-2)/13]+showCardNum(card: card)
//        }else if (card-2)/13==2{
//            cardShow = cardsTypes[(card-2)/13]+showCardNum(card: card)
//        }else if (card-2)/13==3{
//            cardShow = cardsTypes[(card-2)/13]+showCardNum(card: card)
//        }
//    }else{
//        print("\(card) is a wrong card!")
//    }
//    return cardShow
//    
//}
//
//func showCardNum(card:Int)->String{
//    var cardNum = String()
//    
//    if card%13==1{
//        cardNum = "A"
//    }else if card%13==11{
//        cardNum = "J"
//    }else if card%13==12{
//        cardNum = "Q"
//    }else if card%13 == 0{
//        cardNum = "K"
//    }else{
//        cardNum = String(card%13)
//    }
//    return cardNum
//}
