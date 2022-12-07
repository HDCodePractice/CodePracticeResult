import SwiftUI

struct ContentView: View {
    let lands = [
        ["1","2","3","4","5","6","7","8","9"],
        ["1","2","3","4","5","6","7","8","9"],
        ["1","2","3","4","5","6","7","8","9"],
        ["1","2","3","4","5","6","7","8","9"],
    ]
    var body: some View {
        ZStack{
            VStack(spacing: 3){
                ForEach(0..<11,id:\.self){y in
                    HStack(spacing: 3){
                        ForEach(0..<11,id:\.self){x in
                            ZStack{
                                Rectangle()
                                    .fill(fillColor(x, y))
                                VStack{
                                    Text(gridName(x,y))
                                    Text("\(x),\(y)")
                                }
                            }
                        }
                    } // HStack
                }
            } // VStack
            Text("MontrealPoly")
                .font(.system(size: 50))
                .padding()
                .border(.primary, width: 2)
                .rotationEffect(.degrees(-45))
            Image(systemName: "questionmark")
                .font(.system(size: 50))
                .padding()
                .border(.primary, width: 2)
                .offset(x: 140, y: 140)
            Image(systemName: "dollarsign")
                .font(.system(size: 50))
                .padding()
                .border(.primary, width: 2)
                .offset(x: -140, y: -140)
        }
        .border(.primary)
        .padding()
    }
    
    func fillColor(_ x: Int, _ y:Int) -> Color {
        if x==0 || y==0 || x==10 || y==10{
            return .cyan
        }
        return .clear
    }
    
    func gridName(_ x: Int, _ y:Int)->String{
        if y==0 && x>0 && x<10 {
            return lands[0][x-1]
        }
        if x==0 && y>0 && y<10 {
            return lands[1][y-1]
        }
        if x==10 && y>0 && y<10{
            return lands[2][y-1]
        }
        if y==10 && x>0 && x<10{
            return lands[3][x-1]
        }
        return ""
    }
}
