import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    @State private var chess = true
    var body: some View {
        VStack {
            ForEach(vm.chessboard,id:\.self){row in
                HStack {
                    ForEach(row){item in
                        if item.chess == "no" {
                            Image(item.name)
                                .resizable()
                                .scaledToFit()
                        } else {
                            Image(item.chess)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
            }
            
        }
    }
}

struct ViewModel {
    var chessboard: [[ChessBoard]] {
        [[ChessBoard(name:"topleft",chess:"no"), ChessBoard(name:"top",chess:"no") ,ChessBoard(name:"top",chess:"no"), ChessBoard(name:"topright",chess:"whitepiece")],
         [ChessBoard(name:"left",chess:"no"), ChessBoard(name:"center",chess:"no"), ChessBoard(name:"center",chess:"blackpiece"), ChessBoard(name:"right",chess:"no")],
         [ChessBoard(name:"left",chess:"blackpiece"), ChessBoard(name:"center",chess:"no"), ChessBoard(name:"center",chess:"whitepiece"), ChessBoard(name:"right",chess:"no")],
         [ChessBoard(name:"bottomleft",chess:"no"), ChessBoard(name:"bottom",chess:"whitepiece"), ChessBoard(name:"bottom",chess:"no"), ChessBoard(name:"bottomright",chess:"no")]
        ]
    }
}


struct ChessBoard:Identifiable,Hashable {
    let id:UUID = UUID()
    var name = "plus"
    var chess = "no"
}
