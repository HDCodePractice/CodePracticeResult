import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View {
        //print(Hello, world)
        ZStack{
            LinearGradient(colors: [.yellow,.red], startPoint: .top, endPoint: .bottom)
            
            VStack{
                Spacer()
                VStack{
                    ForEach(vm.grid, id:\.self){ row in
                        HStack{
                            ForEach(row){ item in
                                ZStack{
                                    Rectangle()
                                        .fill(item.status.color)
                                        .cornerRadius(15)
                                        .shadow(radius: 5)
                                        .padding()
                                        
                                    Text("\(item.caption), \(item.column), \(item.row)")
                                }
                            }
                        }
                    }
                    Spacer()
                    VStack{
                        ForEach(vm.keyPad, id:\.self){ row in
                            HStack{
                                ForEach(row){ button in
                                    ZStack{
                                        Rectangle()
                                            .fill(Color.white)
                                            .cornerRadius(15)
                                            .shadow(radius: 5)
                                            .padding()
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
            Spacer()
            
        }
        .ignoresSafeArea()
    }
}
