import SwiftUI

struct ViewModel{
    var lands : [[Land]] = []
    
    
    init(){
        let names = [
            ["westmount1","westmount2","westmount3","westmount4","westmount5","westmount6","westmount7","westmount8","westmount9"],
            ["oldport1","oldport2","oldport3","oldport4","oldport5","oldport6","oldport7","oldport8","oldport9"],
            ["NDG1","NDG2","NDG3","NDG4","NDG5","NDG6","NDG7","NDG8","NDG9"],
            ["ChinaTown1","ChinaTown2","ChinaTown3","ChinaTown4","ChinaTown5","ChinaTown6","ChinaTown7","ChinaTown8","ChinaTown9"]
        ]
        for i in 0..<4{
            var line = [Land]()
            for x in 0..<9{
                line.append(Land(name: names[i][x], image: nil, color: .cyan))
            }
            lands.append(line)
        }
        
        
        //        var line = [Land]()
        //        for x in 0..<9{
        //            line.append(Land(name: "1\(x)", image: nil, color: .cyan))
        //        }
        //        lands.append(line)
        //        line = []
        //        for x in 0..<9{
        //            line.append(Land(name: "2\(x)", image: nil, color: .red))
        //        }
        //        lands.append(line)
        //        line = []
        //        for x in 0..<9{
        //            line.append(Land(name: "3\(x)", image: nil, color: .blue))
        //        }
        //        lands.append(line)
        //        line = []
        //        for x in 0..<9{
        //            line.append(Land(name: "4\(x)", image: nil, color: .yellow))
        //        }
        //        lands.append(line)
        print(lands)
    }
    
    func gridName(_ x:Int, _ y:Int) -> String{
        if y==0 && x>0 && x<10{
            return lands[0][x-1].name
        }
        if x==0 && y>0 && y<10{
            return lands[1][y-1].name
        }
        if x==10 && y>0 && y<10{
            return lands[2][y-1].name
        }
        if y==10 && x>0 && x<10{
            return lands[3][x-1].name
        }
        return ""
    }
    
    func fillColor(_ x: Int, _ y:Int) -> Color {
        if y==0 && x>0 && x<10{
            return lands[0][x-1].color ?? .clear
        }
        if x==0 && y>0 && y<10{
            return lands[1][y-1].color ?? .clear
        }
        if x==10 && y>0 && y<10{
            return lands[2][y-1].color ?? .clear
        }
        if y==10 && x>0 && x<10{
            return lands[3][x-1].color ?? .clear
        }
        return .clear
    }
}
