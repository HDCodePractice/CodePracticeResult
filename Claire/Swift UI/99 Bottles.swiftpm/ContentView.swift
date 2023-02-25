import SwiftUI

struct ContentView: View {
    @State var score = 0
    var body: some View {
        ZStack{
            Color.black
            VStack{
                
                // Circle thingy
                ZStack{
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 5))
                        .frame(width: 150, height: 150)
                    VStack{
                        Image(systemName: "arrow.up")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("BY LIQUID")
                            .bold()
                        Text("empty to full")
                    }
                    
                }
                
                
                Spacer()
                
                
                // Bottles
                
                HStack(alignment: .bottom, spacing: 20){
                    ZStack{
                        Rectangle()
                            .fill(.white)
                        VStack{
                            Rectangle()
                                .stroke()
                        }.padding()
                    }
                    .frame(width: 150, height: 250)
                    
                    ZStack{
                        Rectangle()
                            .fill(.white)
                        VStack{
                            
                        }
                    }
                    .frame(width: 150, height: 300)
                    
                    ZStack{
                        Rectangle()
                            .fill(.white)
                        VStack{
                            
                        }
                    }
                    .frame(width: 150, height: 200)
                }
                
            }
            .padding()
            
            
            
        }
        
        
        
        
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Score: ")
        }
    }
}
