import SwiftUI
struct MyVVStackSampleView: View {
    @State var alignmnt : HorizontalAlignment = .center
    var body: some View {
        VStack{
            VStack{
                RoundedRectangle(cornerRadius: 20
                ).fill(.purple) .frame(width: 50, height: 40)
                RoundedRectangle(cornerRadius: 20
                ).fill(.mint).frame(width: 200, height: 40)
                RoundedRectangle(cornerRadius: 20
                ).fill(.blue).frame(width: 90, height: 40)
                
            }
        }
        HStack{
            Button("Leading"){withAnimation {alignmnt = .leading}}
        }
    }
}

struct MyVVStackSampleViewiew_Previews: PreviewProvider {
    static var previews: some View {
        MyVVStackSampleView()
    }
}

