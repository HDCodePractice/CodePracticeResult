import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("one:")
            Text("two:")
            ForEach(grid) { i in
                HStack {
                    ForEach(i){ j in
                        Text("\(j)")
                    }
                }
            }
        }
    }
}
