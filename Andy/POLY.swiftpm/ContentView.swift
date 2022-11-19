import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(1...11,id\.self){ _ in
                Rectangle()
            }
        }
    }
