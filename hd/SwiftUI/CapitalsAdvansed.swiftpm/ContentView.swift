import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            PrimaryButton("Easy")
            PrimaryButton("Normal")
            PrimaryButton("Hard")
            PrimaryButton("Extreme",background: .red)
        }
        .padding()
    }
}
