import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View {
        VStack{ 
            HStack{
                Text("Score: \(vm.score)")
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
                ForEach(0..<vm.bottles.count, id: \.self){ index in
                    BottleView(height: Int(CGFloat(vm.bottles[index].height)), liquid: Int(CGFloat(vm.bottles[index].liquid)), cap: vm.bottles[index].cap)
                        .onTapGesture {
                           vm.tapBottleByIndex(index: index) 
                            
                        }
                }
         
            } 
        } 
        .padding()
       
    }
}
