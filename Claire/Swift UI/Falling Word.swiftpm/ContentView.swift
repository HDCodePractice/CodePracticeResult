import SwiftUI

struct ContentView: View {
    @State var words = ["call","way","do","hold","good"]
    @State var offsets : [Int] = []
    
    func genPosition(){
        for _ in 0...words.count-1{
            offsets.append(Int.random(in: -150..<150))
        }
    }
    init(){
        genPosition()
    }
    
    var body: some View {
        VStack{
            ForEach(words, id:\.self){ word in
                Text(word)
                    .offset(x:100)
            }
            Button("Start Game"){
                genPosition()
            }
        }
    }
}
