import SwiftUI

struct WithAimationView: View {
    @State var isAnimation = false
    @State var angle: Double = 0
    var body: some View {
        ZStack{
            Color.black
            VStack{
                Spacer()
                Text("Hello Animation")
                    .font(.system(size: 40))
                    .foregroundColor(.yellow)
                    .offset(y: isAnimation ? -200 : 200)
                    .rotation3DEffect(.degrees(30), axis: (x: 1, y: 0 , z: 0))
                //                .rotationEffect(.degrees(angle))
                //            Text("Hello Animation")
                //                .font(.system(size: 50))
                //                .foregroundColor(.blue)
                //                .rotation3DEffect(.degrees(20), axis: (x: 1, y: 0 , z: 0))
                //                .offset(x: isAnimation ? 70 : -70)
                //                .rotationEffect(.degrees(angle))
                Spacer()
                Text("Start Animation")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .onTapGesture {
                        withAnimation(.linear(duration: 10)) {
                            isAnimation.toggle()
                            angle += 45
                        }
                    }
            }
            .padding()
        }
    }
}

struct WithAimationView_Previews: PreviewProvider {
    static var previews: some View {
        WithAimationView()
    }
}
