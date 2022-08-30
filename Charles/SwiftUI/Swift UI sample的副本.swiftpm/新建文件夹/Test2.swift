import SwiftUI
var b : [[Alignment]] = [[.center, .center, .center, .center, .center, .center], [.topLeading, .topLeading, .bottomTrailing, .bottomTrailing, .topLeading, .bottomTrailing], [.topLeading, .topLeading, .bottomTrailing, .bottomTrailing, .center, .center], [.topLeading, .topLeading, .bottomTrailing, .bottomTrailing, .topTrailing, .bottomLeading], [.topLeading, .topLeading, .center, .bottomTrailing, .topLeading, .bottomLeading], [.topLeading, .topTrailing, .bottomTrailing, .bottomLeading, .leading, .trailing]]
struct a: View {
    var body: some View {
        VStack{
            ForEach (0..<6){index in
                ForEach (0..<6){index2 in
                    ZStack(alignment: b[index][index2]){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.red)
                            .frame(width: 200, height: 200)
                        Circle()
                            .fill(.blue)
                            .frame(width: 50, height: 50)
                            .padding()
                    }
                }
            }
        }
    }
}

struct a_Previews: PreviewProvider {
    static var previews: some View {
        a()
    }
}
