import SwiftUI

struct ContentView: View {
    @State var vm = CalculatorModel()
    var body: some View {
        VStack(alignment: .trailing) {
            Text(vm.tmpOutput).font(.largeTitle)
            Text(vm.tmpOutput2).font(.largeTitle)
            Text(vm.tmpOperator).font(.largeTitle)
            Text(vm.output).font(.largeTitle)
        }
        VStack {
            ForEach (vm.keyboard, id: \.self) {
                row in
                HStack (spacing: 10){
                    ForEach (row, id: \.self) {
                        button in
                        Button(buttonTitle: button.title,background: button.background,width: button.width, height:  button.height)
                        .onTapGesture { vm.calculatorStep(inputButton: button)
                        }
                    }
                }
                
            }
        }
    }
}
