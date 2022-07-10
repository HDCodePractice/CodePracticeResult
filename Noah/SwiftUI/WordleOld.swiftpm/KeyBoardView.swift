import SwiftUI

struct KeyboardView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        Text("Hello, world!")
//        VStack {
//            ForEach(vm.fkeyboard, id: \.self) { row in
//                HStack {
//                    ForEach(row, id: \.self) { key in
//                        Text(key.letter == "" ? (key.letter == .delete ? "delete" : "enter") : key.letter)
//                            .foregroundColor(.primary)
//                            .padding()
//                            .background(key.color.background)
//                            .cornerRadius(10)
//                    }
//                }
//            }
//        }
    }
}
