import SwiftUI

struct chuhe: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.clear)
            VStack{
                Spacer()
                HStack{
                    Rectangle()
                        .fill(.clear)
                        .frame(width:8,height:65)
                    Rectangle()
                        .fill(.black)
                        .frame(width:10,height:65)
                        
                    Spacer()
                    Text("楚河")
                        .font(.largeTitle)
                    Spacer()
                    Text("汉界")
                        .font(.largeTitle)
                    Spacer()
                    Rectangle()
                        .frame(width:10,height:65)
                    Rectangle()
                        .fill(.clear)
                        .frame(width:8,height:65)
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
