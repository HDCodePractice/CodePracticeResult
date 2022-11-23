import SwiftUI

struct ContentView: View {
    @State var corner : [String] = ["a","b","c","d"]
    @State var lands : [[String]] = [
        ["","Jaden","Jaden","Jaden","4","Claire","6","Claire","8","Claire",""],
        ["","1","2","3","4","5","6","7","8","9",""],
        ["","1","2","3","4","5","6","7","8","9",""],
        ["","1","2","3","4","5","6","7","8","9",""]
    ]
    @State var color : [[Color]] = [
        [.clear,.red,.blue,.clear,.blue,.green,.yellow,.red,.clear,.clear,.clear],
        [.red,.red,.blue,.clear,.blue,.green,.yellow,.red,.clear,.clear,.yellow],
        [.red,.red,.blue,.clear,.blue,.green,.yellow,.red,.clear,.clear,.yellow],
        [.red,.red,.blue,.clear,.blue,.green,.yellow,.red,.clear,.clear,.yellow]
    ]
    
    func getText(x: Int,y:Int)->String{
        if y==0{
            return lands[0][x]
        }
        if x==0 {
            return lands[1][y]
        }
        if x==10{
            return lands[2][y]
        }
        if y==10{
            return lands[3][x]
        }
        return ""
    }
    func getColor(x: Int,y:Int)->Color{
        if y==0{
            return color[0][x]
        }
        if x==0 {
            return color[1][y]
        }
        if x==10{
            return color[2][y]
        }
        if y==10{
            return color[3][x]
        }
        return .clear
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
                            Rectangle()
                                .fill(isClear(x: x, y: y) ? .white : .cyan)
                                .overlay{
                                    if !isClear(x: x, y: y){
                                        Rectangle()
                                            .stroke(.black,lineWidth: 2)
                                    }
                                }
                            if x != y{
                                if x == 10 && y == 0{
                                    Text(corner[1])
                                }else if x == 0 && y == 10{
                                    Text(corner[2])
                                }else{
                                    Text(getText(x: x, y: y))
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
                                    .fill(getColor(x: x, y: y))
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
        .padding()
    }
}
