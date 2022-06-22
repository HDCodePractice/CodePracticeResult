import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        if vm.gameMode == .start{
            StartView()
                .environmentObject(vm)
        }else{
            VStack{
                Text("Wordle")
                GridView()
                    .environmentObject(vm)
                KeyboardView()
                    .environmentObject(vm)
            }
            
        }
    }
}
