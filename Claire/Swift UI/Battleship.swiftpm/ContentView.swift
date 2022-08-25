//import SwiftUI
//
//struct ContentView: View {
//    @State var board : [[[String]]] = [
//        [["","0","0"],["","0","1"],["","0","2"]],
//        [["","1","0"],["","1","1"],["","1","2"]],
//        [["","2","0"],["","2","1"],["","2","2"]]
//    ]
//    
//    var body: some View {
//       
//        }
//    }
//}

// 2 red
// 3 orange
// 4 yellow
// 5 green
// 6 blue

import SwiftUI

struct ContentView: View {
    @State var board : [[String]] = [
        ["4","4","4","4","","","","2","2",""],
        ["","","","","","","","","","",],
        ["","5","","","3","3","3","","",""],
        ["","5","","","","","","","",""],
        ["","5","","","","","","","",""],
        ["","5","","","","","","","",""],
        ["","5","","6","6","6","6","6","6",""],
        ["","","","","","","","","",""],
        ["","","","","","","","","",""],
        ["","","","","","","","","",""]
    ]
    var body: some View {
        VStack {
            ForEach(board,id:\.self){ row in
                HStack{
                    ForEach(row,id:\.self){ grid in
                        Rectangle()
                            .onTapGesture {
                                    if grid[0] == "2"{
                                        Rectangle()
                                            .fill(.red)
                                    } else if grid[0] == "3"{
                                        Rectangle()
                                            .fill(.orange)
                                }
                            }
                    }
                }
            }
        }
        .padding()
    }
}
