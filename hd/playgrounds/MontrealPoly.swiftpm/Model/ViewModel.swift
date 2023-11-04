import SwiftUI

struct ViewModel{
    var lands : [[Land]] = []
    var currentPlayer = 0
    var players : [Player] = []

    init(){
        initGame()
    }
    
    mutating func initGame(){
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
        players = []
        players.append(Player(color: .red, x: 10, y: 10, money: 10000))
    }
    
    mutating func movePlayer(step: Int){
        var player = players[0]
        for _ in 0..<step{
            if player.y == 10 && player.x > 0 {
                player.x -= 1
            }else if player.x == 0 && player.y > 0{
                player.y -= 1
            }else if player.y == 0 && player.x < 10{
                player.x += 1
            }else if player.x == 10 && player.y < 10 {
                player.y += 1
            }
        }
        players[0] = player
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
