import SwiftUI

struct ContentView: View {
    @State private var bgColor = Color.blue
    @State var vm = ViewModel()
    var body: some View {
        ZStack{
            LinearGradient(colors: [.yellow,.red], startPoint: .top, endPoint: .bottom)
            VStack {
                ColorPicker("Change all Color line", selection: $bgColor)
                Spacer()
            }.padding(50)
            Line(color:bgColor, start: vm.start, end: vm.end)
            ForEach(vm.lines){linePoints in
                Line(color:bgColor, start: linePoints.start, end: linePoints.end)
            }
            VStack{
                Spacer()
                Button(){
                    vm.lines = []
                    vm.start = CGPoint(x: 0, y: 0)
                    vm.end = CGPoint(x: 0, y: 0)
                }label: {
                    ZStack{
                        Color.white
                        Text("Clear")
                            .font(.custom("Gill Sans", size: 20))
                            .fontWeight(.semibold)
                            .foregroundColor(.pink)
                    }
                    .frame(width: .infinity)
                    .cornerRadius(100)
                    .shadow(radius: 5)
                }
                .frame(width: 200, height: 50)
                .cornerRadius(5)
                .shadow(radius: 20)
                
            }
        }
        .gesture(drag)
        .ignoresSafeArea()
    }
    var drag : some Gesture{
        DragGesture()
            .onChanged{ value in
                vm.start = value.startLocation
                vm.end = value.location
                
            }
            .onEnded{ value in
                vm.lines.append(LinePoints(start: value.startLocation, end: value.location))
            }
    }
}
