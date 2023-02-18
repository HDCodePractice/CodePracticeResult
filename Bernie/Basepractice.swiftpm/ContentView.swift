//import SwiftUI
//
//struct ContentView: View {
//    @State var num = 5
//    @State var isSwitch = true
//    
//    var body: some View {
//        VStack {
//            ZStack{
//                Color.clear
//                VStack{
//                    ForEach(1...num, id:\.self){ _ in
//                        Image(systemName: "globe")
//                            .imageScale(.large)
//                            .foregroundColor(.accentColor)
//                        Text("Hello, world!")
//                    }
//                }
//            }
//            HStack{
//                Button("+"){
//                    if num < 10 {
//                        num += 1 
//                    }
//                }
//                .buttonStyle(.borderedProminent)
//                .padding()
////                .opacity(num  > 9 ? 0 : 1)
//                .disabled(num>9 ? true : false)
//                Button("Switch"){Toggle(isOn: $isVertical, label: <#T##() -> _#>)
//                    
//                }
//                .buttonStyle(.borderedProminent)
//                .padding()
//                Button("-"){
//                    if num > 1{
//                        num -= 1
//                    }
//                }
//                .buttonStyle(.borderedProminent)
//                .padding()
////                .opacity(num  < 2 ? 0 : 1)
//                .disabled(num<2 ? true : false)
//            }
//        }
//    }
//}
