import SwiftUI
var d : [[Alignment]] = [[.center, .center, .center, .center, .center, .center], [.topLeading, .topLeading, .bottomTrailing, .bottomTrailing, .topLeading, .bottomTrailing], [.topLeading, .topLeading, .bottomTrailing, .bottomTrailing, .center, .center], [.topLeading, .topLeading, .bottomTrailing, .bottomTrailing, .topTrailing, .bottomLeading], [.topLeading, .topLeading, .center, .bottomTrailing, .topTrailing, .bottomLeading], [.topLeading, .topTrailing, .bottomTrailing, .bottomLeading, .leading, .trailing]]
struct MyView: View {
    @State var e = 0
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width: 200, height: 200)
                ForEach (0..<6){index in
                    ForEach (0..<6){index2 in
                        ZStack(alignment: d[e][index]){
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.clear)
                                .frame(width: 200, height: 200)
                            Circle()
                                .fill(.white)
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                    }
                }
            }
            HStack{
                Button("1"){
                    e = 0
                }
                Button("2"){
                    e = 1
                }
                Button("3"){
                    e = 2
                }
                Button("4"){
                    e = 3
                }
                Button("5"){
                    e = 4
                }
                Button("6"){
                    e = 5
                }
                Button("Random"){
                    e = Int.random(in: 0..<6)
                }
            }
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView()
    }
}
