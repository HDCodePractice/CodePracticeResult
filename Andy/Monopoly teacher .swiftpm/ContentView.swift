import SwiftUI

struct ContentView: View {
    @State var corner : [String] = ["Free Parking","Go  To Jail","Visit Jail","Go"]
    @State var lands : [[String]] = [
        ["","a","a","a","4","a","6","a","8","a",""],
        ["","1","2","3","He","5","6","7","a","9",""],
        ["","1","2","3","4","a","a","7","8","9",""],
        ["","1","2","a","a","a","a","7","8","y",""]
    ]
    @State var Player : player = player()
    @State var dice : Int = 1
    @State var turn : Bool = false
    @State var color : [[[Color]]] = [[
        [.clear,.red,.blue,.clear,.blue,.green,.clear,.red,.clear,.clear,.clear],
        [.red,.red,.blue,.clear,.blue,.green,.yellow,.red,.clear,.clear,.yellow],
        [.red,.red,.blue,.clear,.yellow,.green,.blue,.red,.clear,.clear,.yellow],
        [.red,.red,.blue,.blue,.blue,.yellow,.blue,.clear,.red,.clear,.yellow]
    ],[
        [.cyan, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .cyan],
        [.cyan, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .cyan],
        [.cyan, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .cyan],
        [.cyan, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .clear, .cyan]
      ]]
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
    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                ForEach(0..<11){ y in
                    HStack(spacing: 0) {
                        ForEach(0..<11){ x in
                            ZStack{
                                var value : [Int] = getIndex(x: x, y: y)
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
                                            .fill(color[0][value[0]][value[1]])
                                        Rectangle()
                                            .fill(.clear)
                                        Rectangle()
                                            .fill(.clear)
                                        Rectangle()
                                            .fill(color[1][value[0]][value[1]])
                                    }
                                    var colorz : [Color] = Player.circleColor(x: x, y: y)
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
                        withAnimation(.easeInOut(duration: 0.5)){
                            dice = Int.random(in: 1...6)
                            turn.toggle()
                            Player.movePlayer(amount: dice)
                            for i in 0...3{
                                var value : [Int] = getIndex(x:Player.players[i][0],y:Player.players[i][1])
                                if color[1][value[0]][value[1]] == .clear{
                                    color[1][value[0]][value[1]] = Player.playerColors[i]
                                }
                            }
                        }
                    }
                Text("\(dice)")
                    .foregroundColor(.black)
            }
        }
        .onAppear{
            print(color)
            
        }
        .padding()
    }
}
