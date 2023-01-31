import SwiftUI

struct ViewModel {
    var bottles : [Bottle]  = []
    var target : [Int] = []
    
    var typeString: String{
        if target.count > 1{
            if target[1] == 0{
                return "Cap"
            }else if target[1] == 1{
                return "Height"
            }
        }
        return "Liquid"
    }
    
    var targetSymbol : String{
        if target.count > 0{
            if target[0] == -1 {
                return "⬇️"
            }
        } 
        return "⬆️"
    }
    
    init(){
        self.bottles = newRound()  
        self.target = newTarget()
    }
    
    mutating func newGame(){
        bottles = newRound()
        target = newTarget()
        print(target)
    }
    
    func newRound()->[Bottle]{
        var bottles = [Bottle]()
        bottles.append(Bottle(cap: 2, height: 3, liquid: 1))
        bottles.append(Bottle(cap: 1, height: 2, liquid: 3))
        bottles.append(Bottle(cap: 3, height: 1, liquid: 2))
        return bottles.shuffled()
    }
    
    func newTarget()->[Int]{
        // order : -1 , 1
        // 0:cap, 1:height, 2:liquid
        let randomType = [0,1,2].shuffled()[0]
        let randomOrder = [-1,1].shuffled()[0]
        return [randomOrder,randomType]
    }
    
    func getBottlesByType(bottles: [Bottle],type: Int) -> [Int]{
        var bottleResults =  [Int]()
        for i in bottles{
            if type == 0 {
                bottleResults.append(i.cap)
            }else if type == 1{
                bottleResults.append(i.height)
            }else if type == 2{
                bottleResults.append(i.liquid)
            }
        }
        return bottleResults
    }
    
    func getTapedCount(bottles: [Bottle])->Int{
        var count = 0
        for i in bottles{
            if i.cap == 0{
                count += 1
            }
        }
        return count
    }
    
    func tapBottle(bottles: [Bottle], target:[Int], bottleIndex: Int) -> Bool{
        let bottleResults = getBottlesByType(bottles: bottles, type: target[1])
        let tapedCount = getTapedCount(bottles: bottles)
        var targetInt = 0
        if target[0] == 1{
            // 1 2 3
            targetInt = 1 + 1 * tapedCount       
        }else if target[0] == -1{
            // 3 2 1
            targetInt = 3 - 1 * tapedCount
        }
        return bottleResults[bottleIndex] == targetInt
    }
}
