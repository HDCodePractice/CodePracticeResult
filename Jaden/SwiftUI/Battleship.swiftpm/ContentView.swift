import SwiftUI

struct Grid : Identifiable, Hashable{
    var id = UUID()
    var x : Int
    var y : Int
    var shipPiece : Int // -1: clicked Nothing 0: not clicked 1/2/3/4/5/6/7/8/9/10 Column or Row N Ship Piece
    
    
}


struct ContentView: View {
    let width = 10
    let height = 10
    let shipsNumber = 5
    let shipColors : [Color] = [.red,.gray,.blue,.green,.cyan,.mint,.yellow,.indigo,.orange,.brown]
    
    @State var board : [[Grid]] = [
        [Grid(x: 0, y: 0, shipPiece: 0)],[Grid(x: 0, y: 1, shipPiece: 0)],
        [Grid(x: 1, y: 0, shipPiece: 0)],[Grid(x: 1, y: 1, shipPiece: 0)]
    ]
    
    init(){
        
    }
    
    func startGame(){
        
    }
    
    
    var body: some View {
        VStack{
            ForEach(board,id:\.self){ row in
                HStack{
                    ForEach(row){ grid in
                        Rectangle()
                    }
                }
            }
        }
        
    }
}
