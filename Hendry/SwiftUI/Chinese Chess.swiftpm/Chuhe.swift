import SwiftUI

struct chuhe: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.clear)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text("楚河")
                        .font(.largeTitle)
                    Spacer()
                    Text("汉界")
                        .font(.largeTitle)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct chuhe_Previews: PreviewProvider {
    static var previews: some View {
        chuhe()
    }
}
