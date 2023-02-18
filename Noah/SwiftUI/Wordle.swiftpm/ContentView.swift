import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        VStack (alignment: .center, spacing: 50) {
            VStack (spacing: 25){
                Text("Wordle")
                GridView()
            }
                .environmentObject(vm)
            KeyboardView()
                .environmentObject(vm)
        }
    }
}
