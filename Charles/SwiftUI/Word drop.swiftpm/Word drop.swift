import SwiftUI
struct WordDrop: View {
    @State var a = -400.0
    @State var b = Double.random(in: 0...75)
    @State var c = Double.random(in: 0...75)
    @State var d = Double.random(in: 0...75)
    @State var e = Double.random(in: 0...75)
    @State var f = Double.random(in: 0...75)
    var g = ["A", "B", "C", "D", "E"]
    var h = [25.0, 45.0, 67.0, 12.0, 54.0]
    var i = Int.random(in: 0..<4)
    var body: some View {
        VStack{
            HStack(spacing:h[0]){
                ForEach(0..<g.count){index in
                    VStack{
                        Text("\(g[index])")
                            .font(.largeTitle)
                            .offset(x: h[i], y: a)
                    }
                }
            }
            Button("start Animation"){
                withAnimation(.easeIn(duration: 3)){
                    a = -a
                } 
            }.buttonStyle(.borderedProminent)
        }
    }
}
struct WordDrop_Previews: PreviewProvider {
    static var previews: some View {
        WordDrop()
    }
}
