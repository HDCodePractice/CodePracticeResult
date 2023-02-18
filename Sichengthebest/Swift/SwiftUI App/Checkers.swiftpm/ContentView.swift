import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    @State private var chess = true
    var body: some View {
        VStack {
            ForEach(vm.chessboard,id:\.self){row in
                HStack {
                    ForEach(row){item in
                        ImageView(item:item)
                    }
                }
            }
            
        }
    }
}

struct ImageView: View {
    @State var item: ChessBoard
    
    var body: some View {
        if item.chess == "no" {
            Image(item.name)
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    item.chess = "whitepiece"
                }
        } else {
            if item.chess == "whitepiece" {
                Image(systemName: "circle.fill")
                    .foregroundColor(.white)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        item.chess = "blackpiece"
                    }
            } else if item.chess == "blackpiece" {
                Image(systemName: "circle.fill")
                    .foregroundColor(.black)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        item.chess = "whitequeen"
                    }
            } else if item.chess == "whitequeen" {
                Image(systemName: "crown.fill")
                    .foregroundColor(.white)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        item.chess = "blackqueen"
                    }
            } else if item.chess == "blackqueen" {
                Image(systemName: "crown.fill")
                    .foregroundColor(.black)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        item.chess = "no"
                    }
            }
        }
    }
}

struct ViewModel {
    var chessboard: [[ChessBoard]] = [
        [ChessBoard(name:"topleft",chess:"no"), ChessBoard(name:"top",chess:"no") ,ChessBoard(name:"top",chess:"no"), ChessBoard(name:"topright",chess:"whitepiece")],
        [ChessBoard(name:"left",chess:"no"), ChessBoard(name:"center",chess:"no"), ChessBoard(name:"center",chess:"blackpiece"), ChessBoard(name:"right",chess:"no")],
        [ChessBoard(name:"left",chess:"blackpiece"), ChessBoard(name:"center",chess:"no"), ChessBoard(name:"center",chess:"whitepiece"), ChessBoard(name:"right",chess:"no")],
        [ChessBoard(name:"bottomleft",chess:"no"), ChessBoard(name:"bottom",chess:"whitepiece"), ChessBoard(name:"bottom",chess:"no"), ChessBoard(name:"bottomright",chess:"no")]
    ]
    
    mutating func change(){
        chessboard[0][1] = ChessBoard(name:"top",chess:"whitepiece")
    }
    mutating func change2(){
        chessboard[0][1] = ChessBoard(name:"top",chess:"no")
    }
}


struct ChessBoard:Identifiable,Hashable {
    let id:UUID = UUID()
    var name = "plus"
    var chess = "no"
}
