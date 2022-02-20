import SwiftUI

struct ContentView: View {
    @State var vm = CalculaterModel()
    
    fileprivate func screen(number: String) -> some View {
        return Text(number)
            .font(.system(size: 70))
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .padding()
            .frame(minWidth: 0,  maxWidth: .infinity, alignment: .trailing)
    }
    
    var body: some View {
        VStack{
            Spacer()
            screen(number: vm.brain.output)
            
            ForEach (vm.keyboard,id:\.self){ row in
                HStack(spacing: 10){
                    ForEach (row,id:\.self){ button in
                        Button(
                            buttonTitle: button.title,
                            background: button.background,
                            width: button.width,
                            height: button.height
                        ).onTapGesture {
                            vm.applyButton(button: button)
                        }
                    }
                }
            }
        }
    }
}
