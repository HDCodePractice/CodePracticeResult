import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View {
        ZStack{
            Color.red
            Line(start: vm.start, end: vm.end)
            ForEach(vm.lines){linePoints in
                Line(start: linePoints.start, end: linePoints.end)
            }
            VStack{
                Spacer()
                Button(){

                }label: {
                    Text("Clear")
                        .font(.system(size: 70, design: .rounded))
                        .foregroundColor(.white)
                }
                .frame(width: 200, height: 100)
                .cornerRadius(5)
                .shadow(radius: 5)
                .padding()
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
