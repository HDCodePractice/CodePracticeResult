import SwiftUI

struct ContentView: View {
    @State var vm = ViewModule()
    @State var DrawColor = Color(.sRGB, red: 0.0, green: 0.0, blue: 0.0)
    @State var BackgroundColor = Color(.sRGB, red: 1.0, green: 1.0, blue: 1.0)
    @State var Drawing = 0
    @State var DrawingOptions = ["Line","Circle","Rectangle"]

    var body: some View {
        ZStack {
            BackgroundColor
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
                vm.start = value.startLocation
                vm.end = value.location
            }
            .onEnded{ value in
                vm.lines.append(
                    LinePoints(
                        start: value.startLocation,
                        end: value.location,
                        color: DrawColor,
                        type: DrawingOptions[Drawing]
                    ))
            }
    }
    
    var draw: some View {
        ZStack {
            if Drawing == 0 {
                Line(start: vm.start, end: vm.end, color: DrawColor, type: "Line")
            } else if Drawing == 1{
                MyCircle(start: vm.start, end: vm.end, color: DrawColor, type: "Circle")
            } else if Drawing == 2 {
                MyRectangle(start: vm.start, end: vm.end, color: DrawColor, type: "Rectangle")
            }
            
            ForEach(vm.lines) { linePoints in
                if linePoints.type == "Line" {
                    Line(start: linePoints.start, end: linePoints.end, color: linePoints.color, type: linePoints.type)
                } else if linePoints.type == "Circle" {
                    MyCircle(start: linePoints.start, end: linePoints.end, color: linePoints.color, type: linePoints.type)
                } else if linePoints.type == "Rectangle" {
                    MyRectangle(start: linePoints.start, end: linePoints.end, color: linePoints.color, type: linePoints.type)
                }
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
                Picker(selection: $Drawing, label: Text("Shape")) {
                    ForEach(0 ..< DrawingOptions.count) {
                        Text(DrawingOptions[$0])
                    }
                }
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
