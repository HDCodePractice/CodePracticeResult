import SwiftUI
struct clicks{
    var bottle : [Bottle] = []
    func newRound()->[Bottle]{
        var bottles = [Bottle]()
        bottles.append(Bottle(cap: 1, height: 700, liquid: 200))
        bottles.append(Bottle(cap: 3, height: 550, liquid: 100))
        bottles.append(Bottle(cap: 2, height: 400, liquid: 300))
        return bottles.shuffled()
    }
    init(){
        bottle = newRound()
    }
    func newTarget()->[Int]{
        let type = [0,1,2].randomElement() ?? 0
        let order = [0,1].randomElement() ?? 0
        return [type,order]
    }
    func tapBottle(bottles: [Bottle], target:[Int],tap: Int)-> Bool{
        var targets : [Int] = []
        if target[0] == 0{
            targets = [bottles[0].cap,bottles[1].cap,bottles[2].cap] 
//            print("A")
        }else if target[0] == 1{
            targets = [bottles[0].height,bottles[1].height,bottles[2].height] 
//            print("B")
        }else if target[0] == 2{
            targets = [bottles[0].liquid,bottles[1].liquid,bottles[2].liquid]
//            print("C")
        }
        print(targets)
        for i in 1...2{
            if targets.min()! == 0{
                targets.remove(at:targets.firstIndex(of:targets.min()!)!)
            }
        }
        print(targets)
        if target[1] == 0{
            print("E")
            if target[0] == 0{
                print("f")
                if targets.max()! == bottles[tap].cap{
                    return true
                }
                return false
            }else if target[0] == 1{
                print("H")
                if targets.max()! == bottles[tap].height{
                    return true
                }
                return false
            }else if target[0] == 2{
                print("G")

                if targets.max()! == bottles[tap].liquid{
                    return true
                }
                return false
            }
        }else if target[1] == 1{
            print("D")
            if target[0] == 0{
                if targets.min()! == bottles[tap].cap{
                    return true
                }
                return false
            }else if target[0] == 1{
                if targets.min()! == bottles[tap].height{
                    return true
                }
                return false
            }else if target[0] == 2{
                if targets.min()! == bottles[tap].liquid{
                    return true
                }
                return false
            }
        }
        return true
    }
}
struct Bottle{
    var cap : Int
    var height : Int
    var liquid : Int
}
