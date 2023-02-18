import SwiftUI

struct ContentView: View {
    @State var x = 0
    @State var y = 0
    @State var isReset = true
    
    var grid : some View{
        ForEach( 0..<10 , id: \.self) { _ in
            ZStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .offset(x: CGFloat(Int.random(in: -150 ..< 151 )), y: CGFloat(Int.random(in: -350 ..< 351)))
                
            }
        }
    }
    
    var resetGrid : some View{
        ForEach( 0..<10 , id: \.self) { _ in
            ZStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .offset(x: CGFloat(x), y: CGFloat(y))
            }
        }
    }
    
    var body: some View {
        VStack{
            ZStack{
                Color.clear
                
                if isReset{
                    resetGrid
                }else{
                    grid
                }
            }
        }
        HStack{
            Button("Start") { 
                withAnimation(.easeInOut(duration: 0.5)
                    .speed(1.00)
                    .delay(0.00)) { 
//                        1.
//                        isReset = false
//                        isReset = true
//                        isReset = false
//                        2.
//                        if isReset{
//                            isReset = false
//                        }else{
//                            isReset = true
//                        }
//                        3.
//                        isReset = isReset ? false : true
//                        4.
                        isReset.toggle()
                    }
            }.buttonStyle(.borderedProminent)
            Button("Reset") {
                withAnimation(.easeInOut(duration: 0.5)
                    .speed(1.00)
                    .delay(0.00)) { 
                        isReset = true
                    }
            }.buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

