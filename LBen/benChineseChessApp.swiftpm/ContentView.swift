import SwiftUI

struct ContentView: View {
    @State var vm = ChineseChessViewMode()
    var body: some View {
        VStack(spacing:0){
            ForEach(0..<vm.gridRow) { i in
                HStack(spacing:0){
                    ForEach(0..<vm.gridColumn) {
                        j in
                        ZStack{
                            Color.brown
                                .ignoresSafeArea()
                            
                           switch vm.grid[i][j]{
                            case vm.grid[0][0]:
                                topLeftCornerLine()
                                    .stroke(Color.black, lineWidth: 1.0)
                            case vm.grid[0][8 ]:
                                topRrightCornerLine()
                                    .stroke(Color.black, lineWidth: 1.0)
                            case vm.grid[10][0]:
                               bottomLeftCornerLine().stroke(Color.black, lineWidth: 1.0)
                            case vm.grid[10][8]:
                                bottomRrightCornerLine().stroke(Color.black, lineWidth: 1.0)
                            case vm.grid[0][j]:
                                topLine()
                                    .stroke(Color.black, lineWidth: 1.0)
                            case vm.grid[i][0]:
                                leftLine()
                                    .stroke(Color.black, lineWidth: 1.0)
                            case vm.grid[10][j]:
                                bottomLine()
                                    .stroke(Color.black, lineWidth: 1.0)
                           case vm.grid[i][8]:
                                rightLine()
                                    .stroke(Color.black, lineWidth: 1.0)
                           case vm.grid[6][j]:
                               topLine().stroke(Color.black, lineWidth: 1.0)
                           case vm.grid[4][j]:
                               bottomLine().stroke(Color.black, lineWidth: 1.0)
                           case vm.grid[4][j]:
                               bottomLine().stroke(Color.black, lineWidth: 1.0)
                           case vm.grid[5][j]:
                               Text("楚河汉界").font(Font.system(size: 1))
                           case vm.grid[1][4],vm.grid[9][4]:
                               middleCrossLine()
                                   .stroke(Color.black, lineWidth: 1.0)                           case vm.grid[0][3]:
                               leftCrossLine().stroke(Color.black, lineWidth: 1.0)
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


struct leftCrossLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        return path
    }
}

struct middleCrossLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minY, y: rect.maxY))
        return path
    }
}

struct rightCrossLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        return path
    }
}

struct borderLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

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




struct GridView: View{
    @State var gridItem : GridItem
    @State var vm = ChineseChessViewMode()
    var body: some View {
        GeometryReader { g in
            ZStack(){
                    Circle()
                        .frame(width: 1.0, height: 1.0).foregroundColor(.black)
                Circle()
                    .strokeBorder()
                    .foregroundColor(gridItem.chess.color)
                
                    Text(gridItem.chess.title)
                    .scaledToFit()
                    .foregroundColor(.white)
            
            }

        }
        VStack{

        }
    }
    
}
