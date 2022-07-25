import SwiftUI

struct ContentView: View {
    @State var grid22 = 0
    var body: some View {
        VStack {
            HStack{
                    Rectangle()
                        .foregroundColor(.teal)
                Rectangle()
                    .foregroundColor(.teal)
                Rectangle()
                    .foregroundColor(.teal)
            }
            
            HStack{
                Rectangle()
                    .foregroundColor(.teal)
                ZStack{
                    Rectangle()
                        .foregroundColor(.teal)
                    if grid22 == 1 {
                        CirclePiece()
                    }else if grid22 == 2{
                        CrossPiece()
                    }
                    
                    
                }
                Rectangle()
                    .foregroundColor(.teal)
                
            }
            .onTapGesture {
                if grid22 == 0{
                    grid22=1
                }else if grid22==1{
                    grid22=2
                }else {
                    grid22=0
                }
            }
            HStack{
                Rectangle()
                    .foregroundColor(.teal)
                Rectangle()
                    .foregroundColor(.teal)
                Rectangle()
                    .foregroundColor(.teal)
            }
        }
    }
}
