import SwiftUI

struct ContentView: View {
    @State var corner : [String] = ["Free Parking","Go  To Jail","Visit Jail","Go"]
    @State var lands : [[String]] = [
        ["","Jaden","Jaden","Jaden","4","Claire","6","Claire","8","Claire",""],
        ["","1","2","3","He","5","6","7","AAAA","9",""],
        ["","1","2","3","4","5lol","appol","7","8","9",""],
        ["","1","2","He","he","he","haw","7","8","y",""]
    ]
    @State var dice : Int = 1
    @State var turn : Bool = false
    @State var color : [[Color]] = [
        [.clear,.red,.blue,.clear,.blue,.green,.clear,.red,.clear,.clear,.clear],
        [.red,.red,.blue,.clear,.blue,.green,.yellow,.red,.clear,.clear,.yellow],
        [.red,.red,.blue,.clear,.yellow,.green,.blue,.red,.clear,.clear,.yellow],
        [.red,.red,.blue,.blue,.blue,.yellow,.blue,.clear,.red,.clear,.yellow]
    ]
    @State var players : [[Int]] = [[10,10],[10,10],[10,10],[10,10]]
    @State var playerColors : [Color] = [.red,.blue,.green,.yellow]
    @State var playerTurn = 0
    func getIndex(x: Int,y:Int)->[Int]{
        if y==0{
            return [0,x]
        }
        if x==0 {
            return [1,y]
        }
        if x==10{
            return [2,y]
        }
        if y==10{
            return [3,x]
        }
        return [0,0]
    }
    func isClear(x: Int, y: Int)->Bool{
        if x==0 || y==0 || x==10 || y==10 {
            return false
        }
        return true
    }
    func circleColor(x:Int,y:Int)->[Color]{
        var players1 : [Color] = []
        for i in 0...3{
            if players[i][0]==x && players[i][1]==y{
                players1.append(playerColors[i])
            }else{
                players1.append(.clear)
            }
        }
        return players1
    }
    func movePlayer(position:[Int],amount:Int)->[Int]{
        var pos = position
        for i in 1...amount{
            if pos[0]==0 && pos[1]>0{
                pos[1]-=1
            }else if pos[0]==10 && pos[1]<10{
                pos[1]+=1
            }else if pos[1]==0 && pos[0] < 10{
                pos[0]+=1
            }else if pos[1]==10 && pos[0]>0{
                pos[0]-=1
            }else{
                if pos[0]==pos[1]{
                    if pos[0]==0{
                        pos[0]+=1
                    }else{
                        pos[0]-=1
                    }
                }else{
                    if pos[0]==0{
                        pos[1]-=1
                    }else{
                        pos[1]+=1
                    }
                }
            }
        }
        return pos
    }
    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                ForEach(0..<11){ y in
                    HStack(spacing: 0) {
                        ForEach(0..<11){ x in
                            ZStack{
                                var value = getIndex(x: x, y: y)
                                Rectangle()
                                    .fill(isClear(x: x, y: y) ? .white : .cyan)
                                    .overlay{
                                        if !isClear(x: x, y: y){
                                            Rectangle()
                                                .stroke(.black,lineWidth: 2)
                                        }
                                    }
                                if isClear(x:x, y:y) == false{
                                    if x != y{
                                        if x == 10 && y == 0{
                                            Text(corner[1])
                                        }else if x == 0 && y == 10{
                                            Text(corner[2])
                                        }else{
                                            Text(lands[value[0]][value[1]])
                                        }
                                    }else{
                                        if x == 10{
                                            Text(corner[3])
                                        }else{
                                            Text(corner[0])
                                        }
                                    }
                                    VStack{
                                        Rectangle()
                                            .fill(color[value[0]][value[1]])
                                        Rectangle()
                                            .fill(.clear)
                                        Rectangle()
                                            .fill(.clear)
                                    }
                                    var colorz = circleColor(x: x, y: y)
                                    VStack{
                                        HStack{
                                            Circle()
                                                .fill(colorz[0])
                                                .frame(width: 20)
                                            Circle()
                                                .fill(colorz[1])
                                                .frame(width: 20)
                                        }
                                        HStack{
                                            Circle()
                                                .fill(colorz[2])
                                                .frame(width: 20)
                                            Circle()
                                                .fill(colorz[3])
                                                .frame(width: 20)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            VStack{
                Dice(dice: $dice, turn: $turn)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)){
                            dice = Int.random(in: 1...6)
                            turn.toggle()
                        }
                        playerTurn += 1
                        if playerTurn == 4{
                            playerTurn = 0
                        }
                        print(playerTurn)
                        players[playerTurn]=movePlayer(position: players[playerTurn], amount: dice)
                    }
                Text("\(dice)")
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
}
