import SwiftUI
struct asd: View {
    @State var a = -600.0
    let b = Double.random(in: -150...150)
    let c = Double.random(in: -150...150)
    let d = Double.random(in: -150...150)
    let e = Double.random(in: -150...150)
    let f = Double.random(in: -150...150)
    var g = ["A", "B", "C", "D", "E"]
    @State var i = -610.0
    @State var j = -620.0
    @State var k = -630.0
    @State var l = -640.0
    var body: some View {
        let h = [b, c, d, e, f]
        let n = [i, j, k, l, a]
        VStack{
            HStack{
                ForEach(0..<g.count){index in
                    Text("\(g[index])")
                        .offset(x: h[index], y: n[index])
                    
                }
            }
            Button("start Animation"){
                withAnimation(.easeIn(duration: 3)){
                    a = -a
                    i = -i-30
                    j = -j-50
                    k = -k-70
                    l = -l-90
                } 
            }.buttonStyle(.borderedProminent)
                .offset(x: 0, y: 300)
            Rectangle()
                .fill(.white)
                .frame(width: 420, height: 120)
                .offset(x: 0, y: 400)
        }
    }
}
struct asd_Previews: PreviewProvider {
    static var previews: some View {
        asd()
    }
}
