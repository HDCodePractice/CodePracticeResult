import SwiftUI

struct ContentView: View {
    @State var vm = ChessViewModel()
    
    var body: some View {
        VStack(spacing:0){
            ForEach(0..<vm.grid.count) { i in
                HStack(spacing:0){
                    ForEach(0..<vm.grid[i].count) {
                        j in
                        ZStack{
                            Color.brown
                                .ignoresSafeArea()
                            switch vm.grid[i][j]{
                            case vm.grid[0][0]:
                                topLeftCornerLine()
                                    .stroke(Color.black, lineWidth: 1.0)
                            case vm.grid[0][vm.grid.count - 1]:
                                topRrightCornerLine()
                                    .stroke(Color.black, lineWidth: 1.0)
                            case vm.grid[vm.grid.count - 1][0]:
                                bottomLeftCornerLine().stroke(Color.black, lineWidth: 1.0)
                            case vm.grid[vm.grid.count - 1][vm.grid[1].count - 1]:
                                bottomRrightCornerLine().stroke(Color.black, lineWidth: 1.0)
                            case vm.grid[0][j]:
                                topLine()
                                    .stroke(Color.black, lineWidth: 1.0)
                            case vm.grid[i][0]:
                                leftLine()
                                    .stroke(Color.black, lineWidth: 1.0)
                            case vm.grid[vm.grid.count - 1][j]:
                                bottomLine()
                                    .stroke(Color.black, lineWidth: 1.0)
                            case vm.grid[i][vm.grid[1].count - 1]:
                                rightLine()
                                    .stroke(Color.black, lineWidth: 1.0)
                            default:
                                normalLine()
                                    .stroke(Color.black, lineWidth: 1.0)
                            }
                            
                            GridView(gridItem: vm.grid[i][j])
                        }
                        
                    }
                }
            }
        }.scaledToFit()
            .border(.black, width: 0.5)
            .padding()
    }
}

struct topLeftCornerLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}

struct topRrightCornerLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        return path
    }
}

struct bottomLeftCornerLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}

struct bottomRrightCornerLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        return path
    }
}

struct leftLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}

struct rightLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        return path
    }
}


struct topLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        return path
    }
}

struct bottomLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        return path
    }
}


struct normalLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}




struct GridView: View {
    @State var gridItem: GridItem
    var body: some View {
        GeometryReader { g in
            ZStack{
                Circle()
                    .frame(width: 1.0, height: 1.0)
                
                Image(systemName: gridItem.chess.rawValue).resizable().scaledToFit().foregroundColor(gridItem.chess.rawValue == "circle" ? Color.white : Color.black)
            }
            .onTapGesture{
                gridItem.chess = gridItem.chess.nextChess
                
            }
        }
    }
}
