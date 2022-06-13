import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        VStack{
            Text("Wordle")
            GridView()
                .environmentObject(vm)
            KeyboardView()
                .environmentObject(vm)
        }
    }
}
