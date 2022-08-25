import SwiftUI

struct ContentView: View {
    @State var store : [[String]] = [["x","","o"],["o","x","x"],["","","o"]]
    var body: some View {
        VStack {
            ForEach(store,id:\.self){ row in
                HStack{
                    ForEach(row,id:\.self){ grid in
                        ZStack{
                            Rectangle()
                                .stroke(lineWidth: 5)
                            if grid == "o"{
                                Circle()
                                    .fill(.mint)
                                    .padding()
                            }else if grid == "x"{
                                Circle()
                                    .stroke(lineWidth: 20)
                                    .padding(20)
                            }
                        }
                    }
                }
            }
        }
    }
}
