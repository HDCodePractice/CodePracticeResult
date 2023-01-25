import SwiftUI

func newRound()->[Bottle]{
    var bottles = [Bottle]()
    bottles.append(Bottle(cap: 2, height: 3, liquid: 1))
    bottles.append(Bottle(cap: 1, height: 2, liquid: 3))
    bottles.append(Bottle(cap: 3, height: 1, liquid: 2))
    return bottles.shuffled()
}

func newTarget()->[Int]{
    // 0:cap, 1:height, 2:liquid
    // order : -1 , 1
    let randomOrder = [0,1,2].randomElement() ?? 0
    let randomType = [-1,1].randomElement() ?? 0 
    return [-1,1]
}

func getBottlesByType(bottles: [Bottle], type: Int) -> [Int]{
    var bottleResults = [Int]()
    for i in bottles{
        if type == 0{
            bottleResults.append(i.cap)
        }else if type == 1{
            bottleResults.append(i.height)
        } else if type == 2{
            bottleResults.append(i.liquid)
        }
    }
    return bottleResults
}

func tapBottle(bottles: [Bottle], target:[Int], bottleIndex: Int) -> Bool{
    let bottlesResults = getBottlesByType(bottles: bottles, type: target[1])
    if target[0] == 1{
        if bottlesResults[bottleIndex] == 3{
            return true
        }
    } else if target[0] == -1{
        if bottlesResults[bottleIndex] == 3{
            return true
        }
    }
    return true
}

struct Bottle{
    // 1/2/3
    var cap : Int 
    var height : Int
    var liquid : Int
}

