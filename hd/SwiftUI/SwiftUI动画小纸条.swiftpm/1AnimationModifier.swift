import SwiftUI

struct AnimationModifierView: View {
    @State var isAnimation : Bool = false
    var body: some View {
        VStack{
            simpleAnimation
            Text("spring")
            Circle()
                .frame(width: isAnimation ? 100 : 50 , height: isAnimation ? 100 : 50 )
                .foregroundColor(isAnimation ? .red : .blue)
                .offset(x: isAnimation ? 150 : -150)
                .animation(.spring(response: 0.5, dampingFraction: 0.1, blendDuration: 2), value: isAnimation)
            Text("interpolating spring")
            Circle()
                .frame(width: isAnimation ? 100 : 50 , height: isAnimation ? 100 : 50 )
                .foregroundColor(isAnimation ? .red : .blue)
                .offset(x: isAnimation ? 150 : -150)
                .animation(.interpolatingSpring(mass: 0.5, stiffness: 0.5, damping: 0.5, initialVelocity: 0.5), value: isAnimation)
            Spacer()
            Text("Start Animation")
                .font(.largeTitle)
                .onTapGesture {
                    Task{
                        isAnimation.toggle()
                        try! await Task.sleep(nanoseconds: 1_000_000_000)
                        isAnimation.toggle()
                    }
                }
        }
        .padding()
    }
    
    var simpleAnimation: some View{
        return VStack{
            Text("easeInOut")
            Circle()
                .frame(width: isAnimation ? 100 : 50 , height: isAnimation ? 100 : 50 )
                .foregroundColor(isAnimation ? .red : .blue)
                .offset(x: isAnimation ? 150 : -150)
                .animation(.easeInOut(duration: 1), value: isAnimation)
            Text("easeIn")
            Circle()
                .frame(width: isAnimation ? 100 : 50 , height: isAnimation ? 100 : 50 )
                .foregroundColor(isAnimation ? .red : .blue)
                .offset(x: isAnimation ? 150 : -150)
                .animation(.easeIn(duration: 1), value: isAnimation)
            Text("easeOut")
            Circle()
                .frame(width: isAnimation ? 100 : 50 , height: isAnimation ? 100 : 50 )
                .foregroundColor(isAnimation ? .red : .blue)
                .offset(x: isAnimation ? 150 : -150)
                .animation(.easeOut(duration: 1), value: isAnimation)
            Text("linear")
            Circle()
                .frame(width: isAnimation ? 100 : 50 , height: isAnimation ? 100 : 50 )
                .foregroundColor(isAnimation ? .red : .blue)
                .offset(x: isAnimation ? 150 : -150)
                .animation(.linear(duration: 1), value: isAnimation)
        }
    }
    
}

struct AnimationModifierView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationModifierView()
    }
}
