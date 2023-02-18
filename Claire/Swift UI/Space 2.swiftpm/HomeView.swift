import SwiftUI

struct Home: View {
    var body: some View {
            ZStack{
                Color.black
                VStack{
                    Image("Rocket")
                    Image("Earth")
                        .resizable()
                        .frame(width: 500, height: 500)
                        .offset(y: 200)
                }
            }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
