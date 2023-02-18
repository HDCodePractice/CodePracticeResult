import SwiftUI

struct ContentView: View {
    @State var grid11 = 0
    @State var grid12 = 0
    @State var grid13 = 0
    @State var grid21 = 0
    @State var grid22 = 0
    @State var grid23 = 0
    @State var grid31 = 0
    @State var grid32 = 0
    @State var grid33 = 0
    
    @State var piece = 1
    
    @State var gameOver = 0
    
    func checkEnding(){
        if grid11==1 && grid12==1 && grid13==1{
            gameOver=1
        }
        if grid21==1 && grid22==1 && grid23==1{
            gameOver=1
        }
    }
    
    func placeAPiece()->Int{
        if piece==1 {
            piece = 2
            return 1
        }
        piece=1
        return 2
    }
    
    var body: some View {
        ZStack{
            VStack {
                HStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(.red)
                        if grid11 == 1 {
                            CirclePiece()
                        }else if grid11 == 2{
                            CrossPiece()
                        }
                    }
                    .onTapGesture {
                        if grid11==0{
                            grid11 = placeAPiece()
                            checkEnding()
                        }
                    }
                    ZStack{
                        Rectangle()
                            .foregroundColor(.red)
                        if grid12 == 1 {
                            CirclePiece()
                        }else if grid12 == 2{
                            CrossPiece()
                        }
                    }
                    .onTapGesture {
                        if grid12==0{
                            grid12 = placeAPiece()
                            checkEnding()
                        }
                    }
                    ZStack{
                        Rectangle()
                            .foregroundColor(.red)
                        if grid13 == 1 {
                            CirclePiece()
                        }else if grid13 == 2{
                            CrossPiece()
                        }
                    }
                    .onTapGesture {
                        if grid13==0{
                            grid13 = placeAPiece()
                            checkEnding()
                        }
                    }
                }
                HStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(.red)
                        if grid21 == 1 {
                            CirclePiece()
                        }else if grid21 == 2{
                            CrossPiece()
                        }
                    }
                    .onTapGesture {
                        if grid21==0{
                            grid21 = placeAPiece()
                            checkEnding()
                        }
                    }
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
                        if grid22==0{
                            grid22 = placeAPiece()
                            checkEnding()
                        }
                    }
                    ZStack{
                        Rectangle()
                            .foregroundColor(.red)
                        if grid23 == 1 {
                            CirclePiece()
                        }else if grid23 == 2{
                            CrossPiece()
                        }
                    }
                    .onTapGesture {
                        if grid23==0{
                            grid23 = placeAPiece()
                            checkEnding()
                        }
                    }
                }
                HStack{
                    ZStack{
                        Rectangle()
                            .foregroundColor(.red)
                        if grid31 == 1 {
                            CirclePiece()
                        }else if grid31 == 2{
                            CrossPiece()
                        }
                    }
                    .onTapGesture {
                        if grid31==0{
                            grid31 = placeAPiece()
                            checkEnding()
                        }
                    }
                    ZStack{
                        Rectangle()
                            .foregroundColor(.red)
                        if grid32 == 1 {
                            CirclePiece()
                        }else if grid32 == 2{
                            CrossPiece()
                        }
                    }
                    .onTapGesture {
                        if grid32==0{
                            grid32 = placeAPiece()
                            checkEnding()
                        }
                    }
                    ZStack{
                        Rectangle()
                            .foregroundColor(.red)
                        if grid33 == 1 {
                            CirclePiece()
                        }else if grid33 == 2{
                            CrossPiece()
                        }
                    }
                    .onTapGesture {
                        if grid33==0{
                            grid33=placeAPiece()
                            checkEnding()
                        }
                    }
                }
            }
            if gameOver==1{
                HStack{
                    CirclePiece()
                        .frame(width:200)
                    Text("Won")
                        .font(.largeTitle)
                }
                .padding()
            }
        }
    }
}
