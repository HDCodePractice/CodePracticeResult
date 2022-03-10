import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    
    var body: some View {
        ZStack {
            Color.red
            MyRectangle(start: vm.start, end: vm.end)
            ForEach(vm.lines){ linePoints in
                MyRectangle(
                    start: linePoints.start,
                    end: linePoints.end
                )
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
