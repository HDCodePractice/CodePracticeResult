import SwiftUI

struct ContentView: View {
    @State var board = [
        [1,2,3,4,5,6,7,8,9],
        [2,2,3,4,5,6,7,8,9],
        [3,2,3,4,5,6,7,8,9],
        [4,2,3,4,5,6,7,8,9],
        [5,2,3,4,5,6,7,8,9],
        [6,2,3,4,5,6,7,8,9],
        [7,2,3,4,5,6,7,8,9],
        [8,2,3,4,5,6,7,8,9],
        [9,2,3,4,5,6,7,8,9],
    ]
    @State var seconda : [Int] = []
    
    var body: some View {
        VStack(spacing: 4){
            ForEach(0..<3,id:\.self){row1 in
                HStack(spacing: 4){
                    ForEach(0..<3,id:\.self){column1 in
                        VStack(spacing: 2){
                            ForEach(0..<3,id:\.self){row2 in
                                HStack(spacing: 2){
                                    ForEach(0..<3,id:\.self){column2 in
                                        ZStack{
                                            if sconda.contains(column2){
                                            Rectangle()
                                                .onTapGesture(){
                                                    .fill(.cyan)
                                                    seconda.append()
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}
