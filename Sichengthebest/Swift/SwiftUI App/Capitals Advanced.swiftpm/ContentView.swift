import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing:20) {
                PrimaryButton("Easy", background: .green)
                PrimaryButton("Normal")
                PrimaryButton("Hard")
                PrimaryButton("Extreme",background: .red)
            }
        }
    }
}
