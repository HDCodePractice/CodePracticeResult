import SwiftUI

struct ContentView: View {
    @State var wordsCount = 10
    @State var words = ["could", "can", "hello", "and", "no","hi","so","yes","very","powerful"]
    @State var offsetsX : [CGFloat] = [-200,-150,-100,-50,0,50,100,150,250,300]
    @State var offsetsY : [CGFloat] = [-225,-225,-225,-225,-225,-225,-225,-225,-225,-225]
    
    func genPosition(){
        offsetsX = []
        offsetsY = []
        for _ in 0...wordsCount-1{
            offsetsX.append(Double.random(in: -150..<150))
            offsetsY.append(Double.random(in: -150..<150))
        }
    }
    init(){
        genPosition()
    }
    
    var body: some View {
        VStack{
            ForEach(0..<wordsCount, id:\.self){ word in
                Text(words[word])
                    .offset(x:offsetsX[word],y:offsetsY[word])
            }
            Button("Start Game"){
                genPosition()
                withAnimation(.easeOut(duration: 3)){
                    offsetsY = [225,225,225,225,225,225,225,225,225,225]
                }
            }
        }
    }
}
