
//import SwiftUI
//
//struct ContentView: View {
//    let keypad = [
//        ["1","2","3"],
//        ["4","5","6"],
//        ["7","8","9"],
//        ["+/-","0"],
//        ["Add","Clear"],
//    ]
//    
//    @State var inputNumber = 0
//    @State var toggle = true
//    
//    var body: some View {
//        VStack {
//            ZStack{
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(Color.accentColor)
//                Text("0")
//                    .font(.largeTitle)
//            }
//            .frame(width: 200, height: 200)
//            .padding()
//            .rotationEffect(.degrees(360))
//            Text("Number List:")
//                .font(.title2)
//            HStack{
//                Text("000")
//                Text("001")
//            }
//            .font(.title2)
//            HStack{
//                Button{
//                    
//                }label: {
//                    ZStack{
//                        RoundedRectangle(cornerRadius: 5)
//                        Text("Random")
//                            .foregroundColor(.primary)
//                    }
//                }
//                Button{
//                    
//                }label: {
//                    ZStack{
//                        RoundedRectangle(cornerRadius: 5)
//                        Text("Reset")
//                            .foregroundColor(.primary)
//                    }
//                }
//            }
//            Divider()
//            Text("Number:\(inputNumber)")
//                .font(.largeTitle)
//            ForEach(keypad,id:\.self){ row in
//                HStack{
//                    ForEach(row,id:\.self){ key in
//                        Button{
//                            if key=="Clear"{
//                                inputNumber = 0
//                            }else if key=="+/-"{
//                                inputNumber = inputNumber * -1
//                            }else if key=="Add"{
//                                
//                            }else if let intKey=Int(key), inputNumber < 100 && inputNumber > -100 {
//                                inputNumber = inputNumber*10+intKey
//                            }
//                        }label: {
//                            ZStack{
//                                RoundedRectangle(cornerRadius: 5)
//                                Text(key)
//                                    .foregroundColor(.primary)
//                            }
//                        }
//                    }
//                }
//            }
//        }
//        .padding(20)
//    }
//}
//
//
