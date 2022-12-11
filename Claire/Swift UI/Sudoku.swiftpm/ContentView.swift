import SwiftUI

struct ContentView: View {
    @State var secondaryColor : Color = .white
    @State var changeColor = false
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
                                            Rectangle()
                                                .fill(secondaryColor)
                                            Text("r1:\(row1) c1:\(column1) r2:\(row2) c2:\(column2)")
                                                .foregroundColor(.accentColor)
                                        }
                                        .onTapGesture{
                                            if changeColor{
                                                secondaryColor = .blue
                                                changeColor.toggle()
                                            } else {
                                                secondaryColor = .white
                                                changeColor.toggle()
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
