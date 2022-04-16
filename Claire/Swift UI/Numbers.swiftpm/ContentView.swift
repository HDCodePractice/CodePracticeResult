import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View {
        LinearGradient(colors: [.yellow,.red], startPoint: .top, endPoint: .bottom)
        ForEach(vm.gridHeight, id:\.self){ height in
            ForEach(vm.gridWidth, id:\.self){ width in
                Rectangle()
                    .frame(width: 20, height: 20)
                    .fill(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 5)
            }
        }
    }
}
