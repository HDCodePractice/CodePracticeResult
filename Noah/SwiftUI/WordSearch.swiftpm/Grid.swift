import SwiftUI

struct Grid {
    let gridSize: Int
    func generate() -> [[String]] {
        var ret: [[String]] = []
        let alphabet: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","W","X","Y","Z"]
        for _ in 0 ... gridSize - 1 {
            var tempVar: [String] = []
            for _ in 0 ... gridSize - 1 {
                tempVar.append(alphabet.randomElement() ?? "null#1")
            }
            ret.append(tempVar)
            tempVar = []
        }
        return ret
    }
}

struct drawTiles: View {
    let content: String
    let color: Color
    let textColor: Color
    let textSize: CGFloat
    let size: CGFloat
    var body: some View {
        ZStack {
            color
            Text(content)
                .font(.system(size: textSize, design: .rounded))
                .foregroundColor(textColor)
                .bold()
        }.frame(width: size, height: size)
    }
}

struct drawGrid: View {
    @State var g = Grid(gridSize: 10)
    var body: some View {
        VStack (alignment: .leading, spacing: 3){
            ForEach(g.generate(), id: \.self) { eachLine in
                HStack (spacing: 3){
                    ForEach(eachLine, id: \.self) { each in
                        drawTiles(content: each, color: .accentColor, textColor: .white, textSize: 13, size: 32)
                    }
                }
            }
        }
    }
}

