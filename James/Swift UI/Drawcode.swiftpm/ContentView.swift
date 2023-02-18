import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    
    var body: some View {
        ZStack {
            HStack{
                Button("Red"){
                    Color.red
                }
                Button("Green"){
                    Color.green
                }
                Button("Blue"){
                    Color.red
                }
            }
            Line(start: vm.start, end: vm.end)
            ForEach(vm.lines){ linePoints in
                Line(
                    start: linePoints.start,
                    end: linePoints.end
                )
            }
            VStack{
                Button("erase"){
                    Line.disabled("")
                }
            }
        }
        .gesture(drag)
        .ignoresSafeArea()
    }
    
    var drag : some Gesture{
        return DragGesture()
            .onChanged { value in
                vm.start = value.startLocation
                vm.end = value.location
            }
            .onEnded{value in
                vm.lines.append(
                    LinePoints(
                        start: value.startLocation,
                        end: value.location
                    ))
            }
    }
    
}
