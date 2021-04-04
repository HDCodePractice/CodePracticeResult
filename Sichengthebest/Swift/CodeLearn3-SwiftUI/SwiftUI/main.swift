// import用来导入一个模块Foundation为swift提供了最为基础的功能库
import Foundation

// SwiftUI提供了绘制图形界面的Swift库
import SwiftUI

// PlaygroundSupport提供了在Playground中进行操作的支持
import PlaygroundSupport

// 创建一个View
struct ContentView: View {
    // body是一个View的最初框架
    var body: some View {
        // 显示一个组件Text
        Text("Hello idiotic abomination to this stupid world!")
    }
}

// 将View设置到Playground的LiveView中去
PlaygroundPage.current.setLiveView(ContentView())
