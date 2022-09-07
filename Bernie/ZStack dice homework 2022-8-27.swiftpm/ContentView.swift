import SwiftUI

struct ContentView: View {
    @State var dice = 1
    
    var body: some View {
        
        let alignments:[[Alignment]] = [[.center,.center,.center,.center,.center,.center],[.topLeading,.topLeading,.topLeading,.bottomTrailing,.bottomTrailing,.bottomTrailing],[.topLeading,.topLeading,.center,.center,.bottomTrailing,.bottomTrailing],[.topLeading,.topTrailing,.topLeading,.bottomTrailing,.bottomLeading,.bottomTrailing],[.topLeading,.topTrailing,.center,.center,.bottomLeading,.bottomTrailing],[.topLeading,.topTrailing,.leading,.trailing,.bottomLeading,.bottomTrailing]]
        
        VStack(){
            
            ZStack{
                
                ZStack(alignment: alignments[dice-1][0]){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.red)
                        .frame(width:120,height:120)
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 30, height: 30)
                        .padding()
                }
                
                ZStack(alignment: alignments[dice-1][1]){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width:120,height:120)
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 30, height: 30)
                        .padding()
                }
                
                ZStack(alignment: alignments[dice-1][2]){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width:120,height:120)
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 30, height: 30)
                        .padding()
                }
                
                ZStack(alignment: alignments[dice-1][3]){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width:120,height:120)
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 30, height: 30)
                        .padding()
                }
                
                ZStack(alignment: alignments[dice-1][4]){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width:120,height:120)
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 30, height: 30)
                        .padding()
                }
                
                ZStack(alignment: alignments[dice-1][5]){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.clear)
                        .frame(width:120,height:120)
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 30, height: 30)
                        .padding()
                }
            }
            .padding()
            
            HStack(){
                ForEach (0..<6, id: \.self){i in
                    Button("\(i+1)")
                    {dice = i+1}
                        .buttonStyle(.borderedProminent)
                }
                Button("Random"){dice=Int.random(in: 1..<7)}
                    .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

