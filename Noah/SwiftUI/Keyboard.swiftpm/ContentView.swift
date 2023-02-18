import SwiftUI

struct ContentView: View {
//    GeometryReader { proxy in
//        let cellWidth = proxy.size.width
//        let cellHeight = proxy.size.height
//    }
    @State var Shift: Bool = true
    let lowerL = [
        ["Q","W","E","R","T","Y","U","I","O","P","Delete"],
        ["A","S","D","F","G","H","J","K","L","return"],
        ["LShift","Z","X","C","V","B","N","M",",",".","RShift"],
        ["L123","Globe","Microphone"," ","R123","KeyboardDown"]
    ]
    let lowerSL = [
        ["q","w","e","r","t","y","u","i","o","p","Delete"],
        ["a","s","d","f","g","h","j","k","l","return"],
        ["LShift","z","x","c","v","b","n","m",",",".","RShift"],
        ["L123","Globe","Microphone"," ","R123","KeyboardDown"]
    ]
    let upperL = [
        ["1","2","3","4","5","6","7","8","9","0",""],
        ["@","#","$","&","*","(",")","'","\"",""],
        ["","%","-","+","=","/",";",":","!","?",""],
        ["","","","","",""]
    ]
    let oddSizeKeys = ["Delete","return","LShift","RShift","L123","Globe","Microphone"," ","R123","KeyboardDown"]
    let oddSizeSymbols = ["delete.left","return","shift.fill","shift.fill","textformat.123","globe","mic","","textformat.123","keyboard.chevron.compact.down"]
    let systemColors: [Color?] = [.teal,.teal,.white,.white,.teal,.teal,.teal,.blue,.teal,.teal]
    let systemFontColor: [Color?] = [.white,.white,.mint,.mint,.white,.white,.white,.white,.white,.white]
    
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let sW = (width - width/8)/12
            let sH = (height > width) && (width < 810)  ? sW * 1.5 : sW
            let oddSizes = [sW*1.185185,sW*1.851851,sW,sW*1.185185,sW,sW,sW,sW*5.777777,sW*1.57407,sW*1.57407]
//            let systemFont: [Font?] = [
//                .system(size: Int(sW/2)),
//                .system(size: 20),
//                .system(size: 25),
//                .system(size: 20),
//                .system(size: 20),
//                .system(size: 20),
//                .system(size: 20),
//                .system(size: 20),
//                .system(size: 25),
//                .system(size: 25)
//            ]
            ZStack(alignment: .bottom){
                Color.init(red: 149/255, green: 246/255, blue: 205/255, opacity: 100.0)
                VStack(alignment: .trailing, spacing: (sW/6.75)-32) {
                    let input = Shift ? lowerL : lowerSL
                    (input, id: \.self) { column in
                        HStack(spacing: sW/6.75) {
                            ForEach(column, id: \.self) { row in
                                Button() {
                                    if ["LShift","RShift"].contains(row) {
                                        Shift = Shift ? false : true
                                    }
                                } label: {
                                    if oddSizeKeys.contains(row) {
                                        let KeyNum = Int(oddSizeKeys.firstIndex(of: row) ?? 0)
                                        ZStack {
                                            systemColors[KeyNum]
                                            if oddSizeKeys[KeyNum] == "return" {
                                                Text("\(oddSizeKeys[KeyNum])")
                                                    .font(.system(size: 16))
                                                    .foregroundColor(systemFontColor[KeyNum])
                                            } else if ["LShift","RShift"].contains(oddSizeKeys[KeyNum]) {
                                                if Shift {
                                                    Image(systemName: oddSizeSymbols[KeyNum])
                                                        .font(.system(size: 20))
                                                        .foregroundColor(systemFontColor[KeyNum])
                                                } else {
                                                    Color.mint
                                                    Image(systemName: "shift")
                                                        .font(.system(size:20))
                                                        .foregroundColor(.white)
                                                }
                                            } else {
                                                Image(systemName: oddSizeSymbols[KeyNum])
                                                    .font(.system(size: 20))
                                                    .foregroundColor(systemFontColor[KeyNum])
                                            }
                                        }
                                        .frame(width: CGFloat(oddSizes[KeyNum]), height: sH)
                                        .clipShape(RoundedRectangle(cornerRadius: 7))
                                        .shadow(radius: 5)
                                    } else {
                                        let RowNum = Int(input.firstIndex(of: column) ?? 0)
                                        let KeyNum = Int(column.firstIndex(of: row) ?? 0)
                                        ZStack {
                                            Color.blue
                                            if ![".",","].contains(row) {
                                                VStack {
                                                    Text("\(upperL[RowNum][KeyNum])")
                                                        .font(.caption)
                                                        .foregroundColor(.teal)
                                                    Text(row)
                                                        .font(.title2)
                                                        .foregroundColor(.white)
                                                }
                                            } else {
                                                VStack(spacing:-10){
                                                    Text("\(upperL[RowNum][KeyNum])")
                                                        .font(.body)
                                                        .foregroundColor(.white)
                                                    Text(row)
                                                        .font(.title2)
                                                        .foregroundColor(.white)
                                                }
                                            }
                                        }
                                        .frame(width: sW, height: sH)
                                        .clipShape(RoundedRectangle(cornerRadius: 7))
                                        .shadow(radius: 5)
                                    }
                                }
                            }
                        }.padding()
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
    
//    var keyboard: some View {
//
//    }
}
