import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Rectangle()
                        .stroke(lineWidth: 12)
                    Rectangle()
                        .stroke(lineWidth: 12)
                    Rectangle()
                        .stroke(lineWidth: 12)
                }
                HStack{
                    Rectangle()
                        .stroke(lineWidth: 12)
                    Rectangle()
                        .stroke(lineWidth: 12)
                    Rectangle()
                        .stroke(lineWidth: 12)
                }
                HStack{
                    Rectangle()
                        .stroke(lineWidth: 12)
                    Rectangle()
                        .stroke(lineWidth: 12)
                    Rectangle()
                        .stroke(lineWidth: 12)
                }
            }
            VStack{
                HStack{
                    Circle()
                        .stroke(lineWidth: 12)
                        .fill(.green)
                        
                    Rectangle()
                        .stroke(lineWidth: 12)
                        .fill(.red)
                    
                    Rectangle()
                        .stroke(lineWidth: 12)
                }
                HStack{
                    Rectangle()
                        .stroke(lineWidth: 12)
                        .fill(.red)
                    Circle()
                        .stroke(lineWidth: 12)
                        .fill(.green)
                    Circle()
                        .stroke(lineWidth: 12)
                        .fill(.green)
                }
                HStack{
                    Rectangle()
                        .stroke(lineWidth: 12)
                    Rectangle()
                        .stroke(lineWidth: 12)
                        .fill(.red)
                    Rectangle()
                        .stroke(lineWidth: 12)
                }
            }
        }
    }
}
