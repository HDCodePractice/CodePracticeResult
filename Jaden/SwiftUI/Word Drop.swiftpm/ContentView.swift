import SwiftUI

struct ContentView: View {
    @State var words = ["call","way","do","hold","good"]
    @State var offsets : [Double] = [0,50,100,150,200]
    
    func genPosition(){
//        for _ in 0...words.count-1{
//            offsets.append(Double.random(in: -150..<150))
//        }
    }
    init(){
        genPosition()
    }
    
    var body: some View {
        VStack{
            ForEach(0..<words.count,id:\.self){ word in
                Text(words[word])
                    .offset(x:offsets[word])
            }
            Button("Start Game"){
                genPosition()
            }
        }
    }
}
