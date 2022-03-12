
import SwiftUI
struct DragGestureView : View {
    @State var vm : ViewModel = ViewModel()

    var body: some View{
        ZStack{
            Color.red
            Line(start: vm.start, end: vm.end)
            ForEach(vm.lines){line in
                line
            }
        }
        .gesture(drag)
    }
    
    var drag : some Gesture{
        DragGesture(minimumDistance: 0)
            .onChanged{value in
                vm.start = value.startLocation
                vm.end = value.location
            }
            .onEnded{value in
                vm.lines.append(
                    Line(start: value.startLocation,
                         end: value.location
                    ))
            }
    }
}
