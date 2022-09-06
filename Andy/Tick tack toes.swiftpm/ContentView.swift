


import SwiftUI
var playerTurn = 0
struct ContentView: View {
    
    
    @State var board : [[[String]]] = [[["","0","0"],["","0","1"],["","0","2"]]
    ,[["","1","0"],["","1","1"],["", "1","2"]]
    ,[["","2","0"],["","2","1"],["","2","2"]]]
    @State var color : [[Color]] = [[.clear,.clear,.clear],[.clear,.clear,.clear],[.clear,.clear,.clear]]
    
    var body: some View {
        VStack(spacing:0){
            ForEach(board,id:\.self){
                row in HStack(spacing:0){
                    ForEach(row,id:\.self){
                        grid in 
                        ZStack{
                            Rectangle()
                            Rectangle()
                            Circle()
                                .fill(color[grid[0]][grid[1]])
                            
                                    
                                                                           
                                                
                                                                           
                                                                           

        }
    }
}
                }
            }
        }
    }


