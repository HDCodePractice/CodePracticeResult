import SwiftUI

struct ContentView: View {
    @State var vm = CalculatorModel()
    var body: some View {
        VStack {
            ForEach (vm.keyboard, id: \.self) {
                row in
                HStack (spacing: 10){
                    ForEach (row, id: \.self) {
                        button in
                        MyView(buttonTitle: button.title,background: button.background,width: button.width, height:  button.height)
                    }
                }
                
            }
        }
    }
}
