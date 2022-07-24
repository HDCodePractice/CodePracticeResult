import SwiftUI

struct AnimationModifier: View {
    @State var isAnimation: Bool = false
    var body: some View {
        VStack {
            Circle()
                .frame(width: isAnimation ? 50 : 100, height: isAnimation ? 50 : 100)
                .foregroundColor(isAnimation ? .red : .blue)
                .offset(x: isAnimation ? 150 : -150)
                .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5), value: isAnimation)
            Spacer()
            Text("Start Animation")
                .font(.largeTitle)
                .onTapGesture {
                    isAnimation.toggle()
                }
        }.padding(40)
    }
}

struct AnimationModifier_Previews: PreviewProvider {
    static var previews: some View {
        AnimationModifier()
    }
}
