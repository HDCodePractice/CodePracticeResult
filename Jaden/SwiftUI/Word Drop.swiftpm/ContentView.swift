import SwiftUI

struct ContentView: View {
    @State var words = ["call","way","do","hold","good"]
    @State var offsetX : [Double] = [0,10,20,30,40]
    @State var offsetY : [Double] = [0,10,20,30,40]
    
    func genPosition(){
        for _ in 0..<words.count{
            offsetX.remove(at: 0)
            offsetX.append(Double.random(in: 0..<1300))
            offsetY.remove(at: 0)
            offsetY.append(Double.random(in: 0..<80))
        }
    }
    init(){
        genPosition()
    }
    
    var body: some View {
        VStack{
            ZStack(alignment: .topLeading){
                Color.clear
                ForEach(0..<words.count,id:\.self){ word in
                    Text(words[word])
                        .offset(x:offsetX[word], y:offsetY[word])
                    
                }
                
            }
            .onAppear{
                genPosition()
            }
            Button("Start Game"){
                genPosition()
                withAnimation{
                    for i in 0..<offsetY.count{
                        for j in 1...32{
                            withAnimation(.easeInOut(duration: 2.0)){
                                offsetY[i] += 50
                            }
                        }
                        //                        offsetY[i] += 50
                    }
                }
                withAnimation(.easeInOut(duration: 2.0).delay(2.0)){
                    
                }
                
                
                
            }
            
        }
        
    }
}

