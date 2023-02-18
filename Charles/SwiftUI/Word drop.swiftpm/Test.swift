import SwiftUI
struct Test: View {
    @State var a = -600.0
    let b = Double.random(in: -150...150)
    let c = Double.random(in: -150...150)
    let d = Double.random(in: -150...150)
    let e = Double.random(in: -150...150)
    let f = Double.random(in: -150...150)
    var g = ["A", "B", "C", "D", "E"]
    var body: some View {
        let c = [b, c, d, e, f]
        VStack{
            HStack{
                ForEach(0..<g.count){index in
                    Text("\(g[index])")
                        .offset(x: c[index], y: a)
                }
            }
            Button("start Animation"){
                withAnimation(.easeIn(duration: 3)){
                    a = -a
                } 
            }.buttonStyle(.borderedProminent)
                .offset(x: 0, y: 300)
        }
    }
}
struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
