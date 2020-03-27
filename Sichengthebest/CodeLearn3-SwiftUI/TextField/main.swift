import Foundation
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    // @State代表这是一个SwiftUI的会进行变更和变化后更新显示的变量
    @State var name: String = "Death"
    @State var age: String = "69"
    @State var passsword: String = "3272837"
    @State var ooh: String = "The most stupid person that has ever walked on the face of the earth"
    @State var aah: String = "Transgender"
    
    var body: some View {
        // 加入15的间距
        VStack(spacing: 15){
            HStack{
                Text("\(self.name)'s information:")
            }
            HStack{
                Text("昵称：")
                // $name 是传入引用，在函数里可以改变这个变量
                TextField("请输入昵称", text: self.$ooh)
            }
            .frame(width: 200)
            HStack{
                Text("密码：")
                SecureField("请输入密码",text: self.$passsword)
            }
            .frame(width: 200)
            HStack{
                Text("年龄：")
                TextField("请输入年龄", text: self.$age)
            }
            .frame(width: 200)
            HStack{
                Text("性别：")
                TextField("请输入性别", text: self.$aah)
            }
            .frame(width: 200)
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
