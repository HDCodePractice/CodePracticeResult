import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            //                        1
            ZStack(alignment: .topLeading){
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width:200,height:200)
                
                Circle()
                    .fill(.white)
                    .frame(width: 50, height: 50)
                    .padding()
                
            }
            //            2
            ZStack(alignment: .bottomTrailing){
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.red)
                        .frame(width:200,height:200)
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 50, height: 50)
                        .padding()
                }
                
                Circle()
                    .fill(.white)
                    .frame(width: 50, height: 50)
                    .padding()
            }
            //            6
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width:200,height:200)
                
                let alignmentArray:[Alignment] = [.topTrailing,.topLeading,.leading,.trailing,.bottomLeading,.bottomTrailing]
                ForEach(0...5,id:\.self){i in
                    ZStack(alignment: alignmentArray[i]){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.clear)
                            .frame(width:200,height:200)
                        Circle()
                            .fill(.white)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                }
            }
        }
    }
}
