import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    @State var dictInt : Int = 1
    
    var dice : Binding<Int>{
        Binding{
            dictInt
        }set:{ newValue in
            dictInt = newValue
            vm.movePlayer(step: dictInt)
        }
    }
    
    
    var body: some View {
        ZStack{
            BoardView(vm: vm)
            
            Text("MontrealPoly")
                .font(.system(size: 50))
                .padding()
                .border(.primary, width: 2)
                .rotationEffect(.degrees(-45))
            Image(systemName: "questionmark")
                .font(.system(size: 50))
                .padding()
                .border(.primary, width: 2)
                .offset(x: 100, y: 100)
            Image(systemName: "dollarsign")
                .font(.system(size: 50))
                .padding()
                .border(.primary, width: 2)
                .offset(x: -100, y: -100)
            
            DiceView(dice: dice)
                .offset(y: -200)
        }
        .border(.primary)
        .padding()
    }
}
