import SwiftUI

struct ContentView: View {
    @State var corner : [String] = ["a","b","c","d"]
    @State var lands : [[String]] = [
        ["","Jaden","Jaden","Jaden","4","Claire","6","Claire","8","Claire",""],
        ["","1","2","3","He","5","6","7","AAAA","9",""],
        ["","1","2","3","4","5lol","appol","7","8","9",""],
        ["","1","2","He","he","he","haw","7","8","y",""]
    ]
    @State var color : [[Color]] = [
        [.clear,.red,.blue,.clear,.blue,.green,.clear,.red,.clear,.clear,.clear],
        [.red,.red,.blue,.clear,.blue,.green,.yellow,.red,.clear,.clear,.yellow],
        [.red,.red,.blue,.clear,.yellow,.green,.blue,.red,.clear,.clear,.yellow],
        [.red,.red,.blue,.blue,.blue,.yellow,.blue,.clear,.red,.clear,.yellow]
    ]
    
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
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}
