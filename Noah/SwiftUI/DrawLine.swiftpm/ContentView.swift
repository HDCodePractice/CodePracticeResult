import SwiftUI

struct ContentView: View {
    @State var vm = ViewModule()
    @State var DrawColor = Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0)
    @State var BackgroundColor = Color(.sRGB, red: 1.0, green: 1.0, blue: 1.0)
    
    var body: some View {
        ZStack {
            BackgroundColor
//            LinearGradient(colors: [.orange,.yellow], startPoint: .top, endPoint: .bottom)
            Line(start: vm.start, end: vm.end, color: DrawColor)
            ForEach(vm.lines){ linePoints in
                Line(
                    start: linePoints.start,
                    end: linePoints.end,
                    color: linePoints.color
                )
            }
            VStack {
                HStack {
                    Spacer(minLength: 5)
                    ColorPicker("Draw Color",selection: $DrawColor)
                        .font(.system(size: 20, design: .rounded))
                    Spacer(minLength: 5)
                }
                HStack {
                    Spacer(minLength: 5)
                    ColorPicker("Background Color",selection: $BackgroundColor)
                        .font(.system(size: 20, design: .rounded))
                    Spacer(minLength: 5)
                }
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
                vm.start = value.startLocation
                vm.end = value.location
            }
            .onEnded{ value in
                vm.lines.append(
                    LinePoints(
                        start: value.startLocation,
                        end: value.location,
                        color: DrawColor
                    ))
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
                    vm.start = CGPoint(x: 0, y: 0)
                    vm.end = CGPoint(x: 0, y: 0)
                }
            Button() {
                vm.lines = []
                vm.start = CGPoint(x: 0, y: 0)
                vm.end = CGPoint(x: 0, y: 0)
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
