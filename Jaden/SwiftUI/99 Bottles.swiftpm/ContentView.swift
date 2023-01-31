import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    @State var a = 1
    var body: some View {
        VStack{ 
            HStack{
                Text("Score: ")
                    .font(.largeTitle)  
                Spacer() 
                ZStack{
                    Circle() 
                    VStack{
                        Text(vm.targetSymbol)  
                        Text("By \(vm.typeString)")
                    }
                    .font(.largeTitle) 
                    .foregroundColor(.accentColor)
                } 
                .frame(height: 200) 
                Spacer()
                Button("Restart"){
                    vm.newGame()
                }
            }
            
         
            HStack { 
                ForEach(vm.bottles, id: \.self){ bottle in
                    BottleView(height: Int(CGFloat(bottle.height)), liquid: Int(CGFloat(bottle.liquid)), cap: bottle.cap)
                        .onTapGesture {
                            if a == 1{
                                if vm.typeString == "Liquid"{
                                    if vm.targetSymbol == "⬆️"{
                                        if vm.bottles[0].liquid == 2{
                                            
                                        }
                                    }else if vm.targetSymbol == "⬇️"{
                                        if vm.bottles[0].liquid == 6{
                                            
                                        }
                                    }
                                }else if vm.typeString == "Height"{
                                    if vm.targetSymbol == "⬆️"{
                                        if vm.bottles[0].height == 1{
                                            
                                        }
                                    }else if vm.targetSymbol == "⬇️"{
                                        if vm.bottles[0].height == 3{
                                            
                                        }
                                    }
                                }else if vm.typeString == "Cap"{
                                    if vm.targetSymbol == "⬆️"{
                                        if vm.bottles[0].cap == 1{
                                            
                                        }
                                    }else if vm.targetSymbol == "⬇️"{
                                        if vm.bottles[0].cap == 3{
                                            
                                        }
                                    }
                                }
                                a = 2
                            }else if a == 2{
                                if vm.typeString == "Liquid"{
                                    if vm.bottles[0].liquid == 4{
                                        
                                    }
                                }else if vm.typeString == "Height"{
                                    if vm.bottles[0].height == 2{
                                        
                                    }
                                }else if vm.typeString == "Cap"{
                                    if vm.bottles[0].cap == 2{
                                        
                                    }
                                }
                                a = 3
                            }else if a == 3{
                                if vm.typeString == "Liquid"{
                                    if vm.targetSymbol == "⬆️"{
                                        if vm.bottles[0].liquid == 3{
                                            
                                        }
                                    }else if vm.targetSymbol == "⬇️"{
                                        if vm.bottles[0].liquid == 1{
                                            
                                        }
                                    }
                                }else if vm.typeString == "Height"{
                                    if vm.targetSymbol == "⬆️"{
                                        if vm.bottles[0].height == 3{
                                            
                                        }
                                    }else if vm.targetSymbol == "⬇️"{
                                        if vm.bottles[0].height == 1{
                                            
                                        }
                                    }
                                }else if vm.typeString == "Cap"{
                                    if vm.targetSymbol == "⬆️"{
                                        if vm.bottles[0].height == 3{
                                            
                                        }
                                    }else if vm.targetSymbol == "⬇️"{
                                        if vm.bottles[0].height == 1{
                                            
                                        }
                                    }
                                }
                                a = 1
                            }
                            
                            
                        }
                }
         
            } 
        } 
        .padding()
       
    }
}
