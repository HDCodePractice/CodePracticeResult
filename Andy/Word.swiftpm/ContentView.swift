import SwiftUI
func moveWords()->[Int]{
    var a : [Int] = []
    for _ in 1 ... 5{
        a.append(Int.random(in: -350...350))
    }
    return a
}
struct ContentView: View {
    @State var height = -500
    @State var x : [Int] = moveWords()
    @State var word : [String] = ["Hello","Word","Swift","anticonstitutionellement","lol"]
    var body: some View {
        VStack {
            ForEach(0...4,id:\.self){ I in
                Text(word[I])
                    .offset(x: CGFloat(x[I]), y: CGFloat(height))
            }
            
        }
        Spacer()
        Button("fall"){
            height = -500
            x = moveWords()
            withAnimation(.linear(duration: 5)){
                height = 1000
            }
        }
    }
}
