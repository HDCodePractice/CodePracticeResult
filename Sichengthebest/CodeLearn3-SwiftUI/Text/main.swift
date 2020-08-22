import Foundation
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        Text("Hello Idiotic Noobs!")
            // 设置字体和颜色
            .font(.system(.largeTitle, design: .default))
        .shadow(color: Color.green, radius: 3)
            .foregroundColor(.red)
    }
}

PlaygroundPage.current.setLiveView(ContentView())
