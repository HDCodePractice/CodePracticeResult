import SwiftUI

struct ContentView: View {
    @State var vm = CaculatorModel()
    fileprivate func keypad() -> VStack<ForEach<[[CaculatorButtonItem]], [CaculatorButtonItem], HStack<ForEach<[CaculatorButtonItem], CaculatorButtonItem, Button>>>> {
        return VStack {
            ForEach(vm.keyboard,id:\.self){ row in
                HStack(spacing: 10){
                    ForEach (row,id:\.self) { button in
                        Button(buttonTitle: button.title, background: button.background, width: button.width, height: button.height)
                    }
                }
            }
        }
    }
    
    fileprivate func screen(number: String) -> some View {
        return Text("\(number)")
            .foregroundColor(.black)
            .font(.system(size: 60))
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .padding().frame(minWidth: 0, maxWidth: .infinity, alignment: (.trailing))
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


