import SwiftUI

struct ContentView: View {
    @State private var bgColor = Color.blue
    @State var vm = ViewModel()
    @State var draw = "Line"
    @State var draws = ["Line","Square","Circle"]
    var body: some View {
        ZStack{
            Color.red
            VStack {
                Text("dwejifojriofjwofjeowifjeiow")
                    .foregroundColor(.red)
                ColorPicker("Change all Color line", selection: $bgColor)
                HStack{
                    Text("Drawing: ")
                    Picker(draw,selection: $draws){
                        ForEach(0..<draws.count){
                            Text(draws[$0])
                                .font(.title)
                            
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                }
                Spacer(minLength: 50)


            }.padding()
            Line(color:bgColor, start: vm.start, end: vm.end)
            ForEach(vm.lines){linePoints in
                Line(color:linePoints.color, start: linePoints.start, end: linePoints.end)
            }
            VStack{
                Spacer()
                Button(){
                    vm.lines = []
                    vm.start = CGPoint(x: 0, y: 0)
                    vm.end = CGPoint(x: 0, y: 0)
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
                vm.lines.append(LinePoints(start: value.startLocation, end: value.location, color: bgColor))
            }
    }
}
