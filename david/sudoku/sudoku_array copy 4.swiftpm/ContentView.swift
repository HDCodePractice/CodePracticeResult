import SwiftUI

struct ContentView: View {
    @State var gridArr:[[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)
    @State var backColors:[[Color]] = Array(repeating: Array(repeating: .white, count: 9), count: 9)
    @State var backColorTemp:[[Color]] = []
    @State var textColor:[[Color]] = Array(repeating: Array(repeating: .white, count: 9), count: 9)
    
    @State var rGet = 0
    @State var cGet = 0
    
    
    // IT can be changed here 
    
    
    func gridInit(){
        gridArr = Array(repeating: Array(repeating: 0, count: 9),count: 9)
        for i in 0...8{
            for j in 0...8{
                //                if (i/3==0 && j/3==0) || (i/3==1 && j/3==1) || (i/3==2 && j/3==2){
                autoInput(r: i, c: j)
                //                }
            }
        }
    }
    
    func autoInput(r:Int,c:Int){ 
        var numbers:[Int] = [1,2,3,4,5,6,7,8,9]
        let starts:[Int] = [0,3,6]
        
        for start in starts{
            numbers.shuffle()
            for i in 0..<3{
                for j in 0..<3{
                    gridArr[start+i][start+j] = numbers[i*3+j]
                    textColor[start+i][start+j] = .black
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
            .opacity(0.5)
    }
    
    func startGame(){
        rGet = 1
        cGet = 4
        gridInit()
        backColorInit()
        backColor(rGet: rGet, cGet: cGet)
        choosedColor()
    }
    
    func isDuplic(rGet:Int,cGet:Int)->Bool{
        var isduplic = false
        
        if gridArr[rGet][cGet] != 0{
            for i in 0..<9{
                if i != rGet{
                    if gridArr[rGet][cGet] == gridArr[i][cGet]{
                        backColors[rGet][cGet] = .red.opacity(0.6)
                        backColors[i][cGet] = .red.opacity(0.6)
                        isduplic = true
                    }                
                }
                
                if i != cGet{
                    if gridArr[rGet][cGet] == gridArr[rGet][i]{
                        backColors[rGet][cGet] = .red.opacity(0.6)
                        backColors[rGet][i] = .red.opacity(0.6)
                        isduplic = true
                    }
                }
            }
            
            for i in 0..<3{
                for j in 0..<3{
                    if !(rGet == rGet/3*3+i && cGet == cGet/3*3+j){
                        if gridArr[rGet][cGet] == gridArr[rGet/3*3+i][cGet/3*3+j]{
                            backColors[rGet][cGet] = .red.opacity(0.6)
                            backColors[rGet/3*3+i][cGet/3*3+j] = .red.opacity(0.6)
                            isduplic = true
                        }
                    }
                }
            }
            
        }
        backColorTemp = backColors
        return isduplic
    }
    
    func checkDuplic(){
        for i in 0..<9{
            for j in 0..<9{
                if gridArr[i][j] != 0{
                    isDuplic(rGet: i, cGet: j)
                }
            }
        }
    }
    
    func answers(){
        let numbers:[Int] = [1,2,3,4,5,6,7,8,9]
        let starts:[Int] = [0,3,6]
        var index = 0 
        var duplicMarker = false
        var row:Int = 0
        var col = 0
        
        for r in starts{
            for c in starts{
                var nums = numbers
                for i in 0..<3{
                    for j in 0..<3{
                        if textColor[r+i][c+j] != .black{
                            
                            while gridArr[r+i][c+j]==0{
                                nums.shuffle()
                                if !nums.isEmpty{
                                    for k in 0..<nums.count{
                                        
                                        gridArr[r+i][c+j] = nums[k]
                                        if !isDuplic(rGet: r+i, cGet: c+j){
                                            nums.remove(at: k)
                                            row = r+i
                                            col = c+j
                                            index = k
                                            duplicMarker = false
                                            print(nums)
                                            break
                                        }
                                        duplicMarker = true
                                        gridArr[r+i][c+j] = 10
                                        
                                    }
                                    if duplicMarker{
//                                        gridArr[row][col] = nums[index]
                                    }
                                }
                                
                            }
                            
                            textColor[r+i][c+j] = .blue
                            checkDuplic()
                        }
                        
                        
                        
                    }
                }
                
            }
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
                                                checkDuplic()
                                                choosedColor()
                                                
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
                                    
                                    //                                    if gridArr[rGet][cGet] == 0{
                                    gridArr[rGet][cGet] = i*3+j
                                    textColor[rGet][cGet] = .blue
                                    //                                    }
                                    checkDuplic()                                    
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
                        backColorTemp = backColors
                    }
                    .buttonStyle(.bordered)
                    .font(.largeTitle)
                    
                    Button("Erase"){
                        if textColor[rGet][cGet] != .black{
                            gridArr[rGet][cGet] = 0
                            backColor(rGet: rGet, cGet: cGet)
                            checkDuplic()                            
                            
                        }
                    }
                    .buttonStyle(.bordered)
                    .font(.largeTitle)
                    
                    Button("Answer"){
                        answers()
                        
                        backColorTemp = backColors
                    }
                    .buttonStyle(.bordered)
                    .font(.largeTitle)
                    
                    Button("Clear"){
                        
                        for i in 0..<9{
                            for j in 0..<9{
                                if textColor[i][j] != .black{
                                    gridArr[i][j] = 0
                                }
                                
                            }                  
                        }
                        backColorInit()
                        backColor(rGet: 1, cGet: 4)
                        choosedColor()
                        
                        
                        
                    }
                    .buttonStyle(.bordered)
                    .font(.largeTitle)
                }
            }
        }
    }
}


