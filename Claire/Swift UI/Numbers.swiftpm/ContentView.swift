import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View {
        //print(Hello, world)
        ZStack{
            LinearGradient(colors: [.yellow,.red], startPoint: .top, endPoint: .bottom)
            
            VStack{
                VStack{
                    ForEach(vm.grid, id:\.self){ row in
                        HStack{
                            ForEach(row){ item in
                                ZStack{
                                    Rectangle()
                                        .fill(Color.white)
                                        .padding()
                                    Text("\(item.caption), \(item.column), \(item.row)")
                                }
                            }
                        }
                    }
                    VStack{
                        ForEach(vm.keyPad, id:\.self){ row in
                            HStack{
                                ForEach(row){ button in
                                    Text("\(button.button.title)")
                                        .onTapGesture{
                                            vm.putNumber(button: button)
                                        }
                                    
                                }
                            }
                        }
                    }
                }
            }
            
        }
        .ignoresSafeArea()
    }
}
