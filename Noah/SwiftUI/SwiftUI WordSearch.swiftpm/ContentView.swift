import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct ContentView: View {
    let difficulties = ["Easy"]
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.orange,.yellow], startPoint: .top, endPoint: .bottom)
                VStack {
                    ForEach(difficulties,id: \.self){ difficulty in
                        NavigationLink() {
                            GridView()
                        } label: {
                            ZStack {
                                Text(difficulty)
                                    .font(.title)
                                    .padding()
                            }
                            .frame(width:300)
                            .foregroundColor(.white)
                            .background(.red)
                            .cornerRadius(7)
                            .shadow(radius: 5)
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .navigationTitle("WordSearch 1.0")
        }
    }
    
    
}

struct GridView: View {
    @State var vm = ViewModel()
    @State var divisor = Int(Double(UIScreen.screenWidth - 90)/7.8)
    var body: some View {
        ZStack {
            VStack {
                drawGrid
                ForEach (vm.words, id: \.self) { eachWord in
                    Text(eachWord.title)
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .foregroundColor(eachWord.isFound ? .gray : .black)
                }
                Button() {
                    vm.restartgame()
                } label: {
                    ZStack {
                        Text("Restart game")
                            .font(.title)
                            .padding()
                    }
                    .frame(width:225)
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(7)
                    .shadow(radius: 5)
                }
                Spacer()
            }
            draw
        }
        .gesture(drag)
    }
    
    var drag: some Gesture {
        return DragGesture()
            .onChanged { value in
                vm.tempLine.start = [(Int(value.startLocation.x)/divisor),(Int(value.startLocation.y)/divisor)]
                vm.tempLine.end = [(Int(value.location.x)/divisor),(Int(value.location.y)/divisor)]
            } 
            .onEnded{ value in
                if (vm.tempLine.start[0] > 0 && vm.tempLine.start[0] < vm.gridSize+1 && vm.tempLine.start[1] >= 0 && vm.tempLine.start[1] < vm.gridSize) && (vm.tempLine.end[0] > 0 && vm.tempLine.end[0] < vm.gridSize+1 && vm.tempLine.end[1] >= 0 && vm.tempLine.end[1] < vm.gridSize) &&
                    (vm.tempLine.end[0] == vm.tempLine.start[0] || vm.tempLine.end[1] == vm.tempLine.start[1] || abs(vm.tempLine.end[0]-vm.tempLine.start[0]) == abs(vm.tempLine.end[1]-vm.tempLine.start[1]))
                {
                    for w in 0 ... vm.words.count-1  {
                        if (vm.tempLine.start == vm.words[w].location[0] && vm.tempLine.end == vm.words[w].location[1]) ||
                            (vm.tempLine.start == vm.words[w].location[1] && vm.tempLine.end == vm.words[w].location[0]) {
                            vm.words[w].isFound = true
                            vm.lines.append(
                                Line(
                                    start: [(Int(value.startLocation.x)/divisor),(Int(value.startLocation.y)/divisor)],
                                    end: [(Int(value.location.x)/divisor),(Int(value.location.y)/divisor)],
                                    color: .red
                                )
                            )
                        }
                            
                    }
                } else {
                    vm.tempLine.start = [777,777]
                    vm.tempLine.end = [777,777]
                }
                
            }
    }
    var draw: some View {
        ZStack {
            DrawLine(
                start: CGPoint(x: Int(vm.tempLine.start[0] * divisor+25), y: Int(vm.tempLine.start[1] * divisor+20)),
                end: CGPoint(x: Int(vm.tempLine.end[0] * divisor+25), y: Int(vm.tempLine.end[1] * divisor+20)),
                color: .red
            )
            ForEach(vm.lines) { linePoints in
                DrawLine(
                    start: CGPoint(x: Int((linePoints.start[0])*divisor)+25, y: Int((linePoints.start[1])*divisor)+20),
                    end: CGPoint(x: Int((linePoints.end[0])*divisor)+25, y: Int((linePoints.end[1])*divisor)+20),
                    color: linePoints.color
                )
            }
        }
    }
    
    var drawGrid: some View {
        VStack (alignment: .leading, spacing: 3){
            ForEach(vm.grid, id: \.self) { eachLine in
                HStack (spacing: 3){
                    ForEach(eachLine, id: \.self) { each in
                        drawTiles(content: each.text, color: .orange, textColor: .white, textSize: 13, size: 35)
                    }
                }
            }
        }
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


