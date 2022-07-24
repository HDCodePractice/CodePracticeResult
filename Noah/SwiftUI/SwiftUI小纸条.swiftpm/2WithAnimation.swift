import SwiftUI

struct WithAnimationView: View {
    @State var isAnimation: Bool = true
    @State var animationHeight: Int = 400
    @State var angle: Double = 0
    var body: some View {
        VStack {
            Text("Hello Animation")
                .font(.system(size: 25))
                .offset(y: isAnimation ? 300 : -200)
                .rotation3DEffect(.degrees(30), axis: (x:1,y:0,z:0))
            Spacer()
            Text("Start Animation")
                .font(.largeTitle)
                .onTapGesture {
                    withAnimation(.easeInOut(duration:3)) {
                        isAnimation.toggle()
                        angle += 45
                    }
                }
        }.padding(40)
    }
}

struct WithAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        WithAnimationView()
    }
}
