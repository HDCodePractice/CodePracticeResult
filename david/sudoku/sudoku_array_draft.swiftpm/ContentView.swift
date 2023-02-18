import SwiftUI

struct ContentView: View {
    @State var gridArr:[[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    @State var backColors:[[Color]] = Array(repeating: Array(repeating: .white, count: 9), count: 9)
    @State var backColorTemp:[[Color]] = []
    @State var textColor:[[Color]] = Array(repeating: Array(repeating: .black, count: 9), count: 9)
    
    @State var rGet = 0
    @State var cGet = 0
    
    var body: some View {
        
        @State var game = Game()
        gridArr = game.
        
        ZStack{
            Color.blue
            Color.black
                .opacity(0.3)
            
            VStack(spacing:3){
                ForEach(0..<3,id:\.self){ rowBig in
                    HStack(spacing:3){
                        ForEach(0..<3,id:\.self){ columbBig in
                            VStack (spacing:1){
                                ForEach(0..<3,id:\.self){ rowSmall in 
                                    HStack(spacing:1){
                                        ForEach(0..<3,id:\.self){ columnSmall in 
                                            let r : Int = rowBig*3+rowSmall
                                            let c : Int = columbBig*3 + columnSmall
                                            ZStack{
                                                Rectangle()
                                                    .fill(backColors[r][c])
                                                Text(gridArr[r][c]==0 ? "":"\(gridArr[r][c])")
                                                    .font(.largeTitle)
                                                    .foregroundColor(textColor[r][c])
                                                    .bold()
                                            }
                                            .onTapGesture {
                                                rGet = r
                                                cGet = c
                                                backColor(rGet: rGet, cGet: cGet)
                                                
                                                if isDuplic(r: rGet, c: cGet){
                                                    for i in 0..<backColorTemp.count{
                                                        for j in 0..<backColorTemp[i].count{
                                                            if backColorTemp[i][j] == .red.opacity(0.85){
                                                                backColors[i][j] = .red
                                                                    .opacity(0.85)
                                                            }
                                                        }
                                                    }
                                                    
                                                }
                                                
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(3)
        }
        .onAppear(){
            game.startGame()
        }
        
        VStack{
            HStack{
                ForEach(1...9,id:\.self){ i in
                    Button("\(i)"){
                        
                        if gridArr[rGet][cGet] == 0{
                            gridArr[rGet][cGet] = i
                            textColor[rGet][cGet] = .blue
                        }
                        showDuplic(r: rGet, c: cGet)
                        
                    }
                    .font(.largeTitle)
                }
                
            }
            HStack{
                Button("Erase"){
                    if textColor[rGet][cGet] != .black{
                        gridArr[rGet][cGet] = 0
                        backColorTemp = backColors                   
                        
                    }
                    
                }
                .buttonStyle(.bordered)
                .font(.largeTitle)
                
                Button("Restart"){
                    startGame()
                    backColorTemp = []
                }
                .buttonStyle(.bordered)
                .font(.largeTitle)
                
            }
            
        }
        
        .padding()
    }
}


