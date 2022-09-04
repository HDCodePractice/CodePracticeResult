import SwiftUI

struct WithAnimationView: View {
    @State var isAnimation = false
    var body: some View {
        VStack(spacing: 100){
            HStack(spacing: 30){
                RoundedRectangle(cornerRadius: 20)
                    .fill(.green)
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(isAnimation ? 3*360 : 0))
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(isAnimation ? 0 : 360*3))
                    .offset(x: 0, y: isAnimation ? -200 : 0)
            }
            Button("Start Animation"){
                withAnimation(.easeInOut(duration: 1)){
                    isAnimation.toggle()
                }
            }.buttonStyle(.borderedProminent)
        }
    }
}

struct WithAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        WithAnimationView()
    }
}
