import SwiftUI

struct ContentView: View {
    @State var grid22 = 0
    var body: some View {
        VStack {
            HStack{
                Rectangle()
                    .foregroundColor(.red)
                Rectangle()
                    .foregroundColor(.red)
                Rectangle()
                    .foregroundColor(.red)
            }
            HStack{
                Rectangle()
                    .foregroundColor(.red)
                ZStack{
                    Rectangle()
                        .foregroundColor(.red)
                    if grid22 == 1 {
                        CirclePiece()
                    }else if grid22 == 2{
                        CrossPiece()
                    }
                }
                .onTapGesture {
                    if grid22 == 0{
                        grid22=1
                    }else if grid22==1{
                        grid22=2
                    }else{
                        grid22=0
                    }
                }
                Rectangle()
                    .foregroundColor(.red)
            }
            HStack{
                Rectangle()
                    .foregroundColor(.red)
                Rectangle()
                    .foregroundColor(.red)
                Rectangle()
                    .foregroundColor(.red)
            }
        }
    }
}
