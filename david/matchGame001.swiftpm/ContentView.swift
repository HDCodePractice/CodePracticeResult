import SwiftUI

struct ContentView: View {
    @State var game = Game()
    
    var body: some View {
        VStack {
            ForEach((0...game.width),id:\.self){row in 
                Rectangle()
            }
            HStack{
                ForEach((0...game.hight),id:\.self){grid in 
                    Rectangle()
                }
            }
            
        }
    }
}

