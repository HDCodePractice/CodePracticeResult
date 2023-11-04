import SwiftUI


struct ContentView: View {
    let lands = [
        ["1","2","3","4","5","6","7","8","9"],// top
        ["1","2","3","4","5","6","7","8","9"],// left
        ["1","2","3","4","5","6","7","8","9"],// right
        ["1","2","3","4","5","6","7","8","9"]// bottom
    ]
    var body: some View {
        ZStack{
        VStack(spacing: 3) {
            ForEach(0..<11, id:\.self){y in
                HStack(spacing: 3){
                    ForEach(0..<11, id:\.self){x in
                        ZStack{
                            
                            Rectangle()
                                .fill(fillColor(x,y))
                            Text(showStName(x,y))
                        } 
                        }
                        
                }// HStack
            }
        }// VStack
        Text("MontrealPoly")
            .font(.system(size:50))
            .padding()
            .border(.primary, width: 2)
            .rotationEffect(.degrees(-45))
            Image(systemName: "questionmark")
                .font(.system(size:50))
                .padding()
                .border(.primary, width: 2)
                .rotationEffect(.degrees(-45))
                .offset(x: 100, y: 100)
            Image(systemName: "bitcoinsign")
                .font(.system(size:50))
                .padding()
                .border(.primary, width: 2)
                .rotationEffect(.degrees(135))
                .offset(x: -100, y: -100)
                
    }
        .border(.primary)
        .padding()
    }
    
    func fillColor(_ x: Int, _ y: Int)-> Color{
        if x == 0 || y == 0 || x == 10 || y == 10{
            return .cyan
        }
        return .clear
    }
    
    func showStName(_ x: Int, _ y: Int) -> String{
        var lots = [[String]]()
        for i in lands{
            var element = i
            element.insert("", at: 0)
            element.append("")
            lots.append(element)
        }
        if y == 0 {
            return lots[0][x]
        }
        if x == 0{
            return lots[1][y]
        }
        if x == 10{
            return lots[2][y]
        }
        if y == 10{
            return lots[3][x]
        }
        return ""
    }
    
}
