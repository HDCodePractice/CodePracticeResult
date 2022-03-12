import SwiftUI

struct ContentView: View {
    @State var vm = KeyboardModel()
    var body: some View {
        VStack{
            Spacer()
            ForEach (vm.keyboard, id: \.self) {
                row in
                HStack (spacing: 5){
                    ForEach (row, id: \.self) {
                        keyItem in
                        if (keyItem.title).count == 2 {
                            Keyboard(keyboardTitle: keyItem.title,
                                     background: keyItem.color,
                                     width: keyItem.width, height: keyItem.height
                                )
                        }else {
                            FunctionKey(functionKeyTitle: keyItem.title[0],background: keyItem.color,
                                        width: keyItem.width, height: keyItem.height)
                        }
                    }
                }
            }
        }.padding()
    }
}
