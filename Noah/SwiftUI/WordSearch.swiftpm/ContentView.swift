import SwiftUI

struct ContentView: View {
    @State var vm = ViewModule()
    @State var DrawColor = Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0)
    @State var BackgroundColor = Color(.sRGB, red: 1.0, green: 1.0, blue: 1.0)

    var body: some View {
        ZStack {
            BackgroundColor
            drawGrid()
            draw
            VStack {
                options
                Spacer()
                utils
            }.padding(50)
        }
        .gesture(drag)
        .ignoresSafeArea()
    }

    var drag: some Gesture {
        return DragGesture()
            .onChanged { value in
                vm.start = [Int(value.startLocation.x)/31,Int(value.startLocation.y)/35]
                vm.end = [Int(value.location.x)/31,Int(value.location.y)/35]
            }
            .onEnded{ value in
                vm.lines.append(
                    LinePoints(
                        start: [Int(value.startLocation.x)/31,Int(value.startLocation.y)/35],
                        end: [Int(value.location.x)/31,Int(value.location.y)/35],
                        color: DrawColor
                    )
                )
            }
    }
    
    var draw: some View {
        ZStack {
            Line(start: CGPoint(x: Int(vm.start[0])*31, y: Int(vm.start[1])*35), end: CGPoint(x: Int(vm.end[0])*31, y: Int(vm.end[1])*35), color: DrawColor)
            ForEach(vm.lines) { linePoints in
                Line(start: CGPoint(x: Int(linePoints.start[0])*31, y: Int(linePoints.start[1])*35), end: CGPoint(x: Int(linePoints.end[0])*31, y: Int(linePoints.end[1])*35), color: linePoints.color)
            }
        }
    }
    var options: some View {
        VStack {
            HStack {
                Spacer(minLength: 30)
                ColorPicker("Draw Color",selection: $DrawColor)
                    .font(.system(size: 20, design: .rounded))
                Spacer(minLength: 30)
            }
            HStack {
                Spacer(minLength: 30)
                ColorPicker("Background Color",selection: $BackgroundColor)
                    .font(.system(size: 20, design: .rounded))
                Spacer(minLength: 30)
            }
            HStack {
                Spacer(minLength: 30)
                Text("Drawing:")
                    .font(.system(size: 20, design: .rounded))
                    .bold()
                Spacer(minLength: 30)
            }
        }
    }
    
    var utils: some View {
        HStack {
            Image(systemName: "arrow.uturn.backward.square.fill")
                .foregroundColor(.accentColor)
                .font(.system(size: 50, design: .rounded))
                .onTapGesture {
                    if vm.lines.count > 0 {
                        vm.lines.removeLast()
                    }
                    vm.start = [0,0]
                    vm.end = [0,0]
                }
            Button() {
                vm.lines = []
                vm.start = [0,0]
                vm.end = [0,0]
            } label: {
                ZStack {
                    Color.accentColor
                    Text("Clear")
                        .font(.system(size: 20, design: .rounded))
                        .foregroundColor(.white)
                        .bold()
                }
                .frame(width: 200, height: 45)
                .cornerRadius(5)
                .shadow(radius: 5)
            }
        }
    }
}

