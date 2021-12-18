import SwiftUI

// 如何建立一个Project
// 如何在一个模拟器里运行Project
// 如何将APP安装到手机/Pad里
// 如何在iPhone/iPad里设置信任开发者
// 你的APP就可以在手机/Pad里运行了
// APP里使用 @main 找到 APP 的struct启动App
// 在 App struct里的WindowGroup指定了启动的View
// 如何修改启动App的文件名、App的struct Name
// 如何修改第一个View的名字
// 向APP里增加icon
// 向APP里增加图片,并修改图片名称
// 在View里使用 HStack、VStack、Image、Text 这些 View
// 为View增加 modifiers 来去改变 View 的样式

struct FirstAppContentView: View {
    var body: some View {
        HStack{
            VStack{
                Image("MyFace")
                    .resizable()
                    .frame(width: 100.0, height: 100.0)
                    .scaledToFit()
                Text("Hello, HD!")
                    .font(.title)
                    .foregroundColor(Color.green)
                    
            }
            Text("Hello, World!")
                .font(.largeTitle)
                .foregroundColor(Color.red)
        }.padding()
    }
}
