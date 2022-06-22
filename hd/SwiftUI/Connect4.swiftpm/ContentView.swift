import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(1...7,id:\.self){ _ in
                VStack{
                    ForEach(10...15,id:\.self){ _ in
                        PiceView(color: .red, connected: true)
                    }
                }
            }
        }
        .padding()
        .background(.blue)
        .cornerRadius(10)
        .padding()
    }
}
