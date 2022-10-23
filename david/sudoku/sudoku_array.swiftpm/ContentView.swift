import SwiftUI

struct ContentView: View {
    @State var gridArr:[[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    @State var backColors:[[Color]] = Array(repeating: Array(repeating: .white, count: 9), count: 9)
    @State var backColorTemp:[[Color]] = []
    @State var textColor:[[Color]] = Array(repeating: Array(repeating: .black, count: 9), count: 9)
    
    @State var rGet = 0
    @State var cGet = 0
    
    
    
    func autoInput(r:Int,c:Int){
        var numbers:[Int] = [1,2,3,4,5,6,7,8,9]
        numbers.shuffle()
        
        for i in 0..<3{
            for j in 0..<3{
                gridArr[r/3*3+i][c/3*3+j] = numbers[0]
                numbers.removeFirst()
            }
        }
    }
    
    func gridInit(){
        gridArr = Array(repeating: Array(repeating: 0, count: 9),count: 9)
        for i in 0...8{
            for j in 0...8{
                if (i/3==0 && j/3==0) || (i/3==1 && j/3==1) || (i/3==2 && j/3==2){
                    autoInput(r: i, c: j)
                }
            }
        }
    }
    
    func backColorInit(){
        
        backColors = Array(repeating: Array(repeating: .white, count: 9), count: 9)
    }
    
    func backColor(rGet:Int,cGet:Int){
        
        for i in 0..<9{
            backColors[i][cGet] = .white
                .opacity(0.8)
            backColors[rGet][i] = .white
                .opacity(0.8)
        }
        for i in 0..<3{
            for j in 0..<3{
                backColors[rGet/3*3+i][cGet/3*3+j] = .white
                    .opacity(0.8)
            }
        }
    }
    
    func choosedColor(){
        backColors[rGet][cGet] = .white 
            .opacity(0.6)
    }
    
    func startGame(){
        rGet = 1
        cGet = 4
        gridInit()
        backColorInit()
        backColor(rGet: rGet, cGet: cGet)
        choosedColor()
    }
    
    func isDuplic(r:Int,c:Int)->Bool{
        
        for i in 0..<9{
            for j in 0..<9{
                if gridArr[i][j] == gridArr[r][c]{
                    if !(i == r && j == c){
                        if r/3==i/3 && c/3==j/3{
                            return true
                        }else if r==i || c==j{
                            return true
                        }
                        
                    }
                }
            }
        }
        return false
    }
    
    func showDuplic(r:Int,c:Int){
        
        for i in 0..<9{
            for j in 0..<9{
                if backColors[i][j] != .red.opacity(0.85){
                    if !(i == r && j == c){
                        
                        if gridArr[i][j] == gridArr[r][c]{
                            if (r/3==i/3 && c/3==j/3) || (r==i || c==j){
                                backColors[i][j] = .red
                                    .opacity(0.85)
                            }else{
                                backColors[i][j] = .white 
                                    .opacity(0.6)
                            }
                        }
                    }
                }
            }
        }
        backColorTemp = backColors
        if isDuplic(r: r, c: c){
            backColorTemp[r][c] = .red.opacity(0.85)
            
        }
    }
    
    var body: some View {
        ZStack{
            
            Color.black
            Color.blue
                .opacity(0.7)
            Color.white
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
                                                backColorInit()
                                                backColor(rGet: rGet, cGet: cGet)
                                                choosedColor()
                                                
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
            .padding(3)
        }
        .onAppear(){
            startGame()
        }
        ZStack{
            Color.blue
            Color.black
                .opacity(0.3)
            Rectangle()
                .fill(.white)
                .opacity(0.9)
            
            HStack{
                VStack{
                    ForEach(0...2,id:\.self){ i in
                        HStack{
                            ForEach(1...3,id:\.self){j in
                                Button("\(i*3+j)"){
                                    
                                    if gridArr[rGet][cGet] == 0{
                                        gridArr[rGet][cGet] = i*3+j
                                        textColor[rGet][cGet] = .blue
                                    }
                                    showDuplic(r: rGet, c: cGet)
                                }
                                .buttonStyle(.bordered)
                                .font(.largeTitle)
                            }
                        }
                    }
                }
                
                VStack{
                    Button("New Game"){
                        startGame()
                        backColorTemp = []
                    }
                    .buttonStyle(.bordered)
                    .font(.largeTitle)
                    
                    Button("Erase"){
                        if textColor[rGet][cGet] != .black{
                            gridArr[rGet][cGet] = 0
                            backColor(rGet: rGet, cGet: cGet)
                            backColorTemp = backColors
                        }
                    }
                    .buttonStyle(.bordered)
                    .font(.largeTitle)
                }
            }
        }
    }
}


