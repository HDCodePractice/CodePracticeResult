
import SwiftUI


struct Grids {
    var group : [[Double]] = []
    var count : Int = 100
    init() {
        resetPostion()
    }
    mutating func resetPostion(){
        for _ in 0..<count {
            group.append([0,0])
        }
    }
    mutating func changePosition(index : Int, grid: [Double]) {
        group[index][0] = grid[0]
        group[index][1] = grid[1]
    }
}

struct ContentView: View {
    @State var grids = Grids()
    var body: some View {
        GeometryReader { proxy in
            VStack {
                ZStack{
                    Color.clear
                    ForEach( 0..<grids.group.count , id: \.self) { index in
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                            .offset(x: grids.group[index][0], y: grids.group[index][1])
                        
                    }
                }
                HStack{
                    Button("Start"){
                        for i in 0..<grids.group.count {
                            let x = Double.random(in: -proxy.size.height..<proxy.size.height)
                            let y = Double.random(in: -proxy.size.width..<proxy.size.width)
                            withAnimation(
                                .linear(duration: 1)
                                .delay(0.1)
                            ){
                                grids.changePosition(index: i, grid: [0 - x,0 - y])
                            }
                        }
                        
                    }.buttonStyle(.borderedProminent)
                    Button("Reset"){
                        for i in 0..<grids.group.count {
                            grids.changePosition(index: i, grid: [0,0])
                        }
                        
                    }.buttonStyle(.borderedProminent)
                    
                    
                }
            }
        }
        
    }
}
