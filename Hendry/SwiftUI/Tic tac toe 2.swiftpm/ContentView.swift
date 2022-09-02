
import SwiftUI

struct ContentView: View {
    @State var store : [[String]] = [["","",""],["","",""],["","",""]]
    @State var turns = "o"
    var body: some View {
        VStack {
            ForEach(0 ..< store.count){i in 
                HStack{
                    ForEach(0 ..< store.count){ j in
                        ZStack{
                            Rectangle()
                                .stroke(lineWidth: 5)
                            VStack{
                                Rectangle()
                                    .fill(.white)
                            }
                            if store[i][j] == "o"{
                                Circle()
                                    .fill(.mint)
                                    .padding()
                            }else if store[i][j] == "x"{
                                Text("X")
                                    .font(.system(size: 100))
                                    .foregroundColor(.purple)
                            }
                        }.onTapGesture {
                            if store[i][j] == ""{
                                if turns == "o"{
                                    withAnimation(.easeOut(duration:1)){
                                        store[i][j] = "o"
                                    }
                                    turns = "x"
                                }else {
                                    withAnimation(.easeOut(duration:1)){
                                        store[i][j] = "x"
                                    }
                                    turns = "o"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
