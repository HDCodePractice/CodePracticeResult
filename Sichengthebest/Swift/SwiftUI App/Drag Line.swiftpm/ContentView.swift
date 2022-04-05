import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View {
        ZStack {
            Color.red
        }
        .gesture(vm.drag)
        .ignoresSafeArea()
    }
}
