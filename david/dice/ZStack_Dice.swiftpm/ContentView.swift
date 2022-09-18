import SwiftUI

struct ContentView: View {
    
    let site:[Alignment] =
    [.topLeading,.top,.topTrailing,
     .leading,.center,.trailing,
     .bottomLeading,.bottom,.bottomTrailing]
    
    let siteCode = [[4],[0,8],[0,4,8],[0,2,6,8],[0,2,4,6,8],[0,2,3,5,6,8]]
    @State var choice:Int = 3
    
    var body: some View {
        
        VStack{
            
            ZStack (alignment: .topLeading){
                
                ZStack (alignment: .bottomTrailing){
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.red)
                        .frame(width: 300, height: 300)
                }
                
                ForEach(0..<(siteCode[choice-1]).count,id:\.self){ i in
                    
                    ZStack (alignment:site[siteCode[choice-1][i]]){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.clear)
                            .frame(width: 300, height: 300)
                        
                        Circle()
                            .fill(.white)
                            .frame(width: 60, height: 60)
                            .padding(30)
                    }
                }
            }
            
            //Button
            
            HStack{
                
                ForEach(0...5,id:\.self){i in 
                    Button
                    {
                        withAnimation{
                            choice = i+1
                        }
                    }label:{
                        Text("\(i+1)")
                            .font(.body)
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                Button("Random"){                
                    withAnimation{                    
                        choice = (1...6).randomElement()!
                    }          
                }
                .buttonStyle(.borderedProminent)
                
                
                //                Button{ 
                //                    withAnimation{
                //                        choice = (1...6).randomElement()!
                //                        
                //                    }
                //                    //                    let abc = [1,2,3,4,5,6].shuffled()
                //                    //                    choice = abc[0]
                //                    
                //                }label:{
                //                    Text("Random")
                //                        .font(.body)
                //                }
                //                .buttonStyle(.borderedProminent)
                
            }
            
            
            
            
        }
    }
}
