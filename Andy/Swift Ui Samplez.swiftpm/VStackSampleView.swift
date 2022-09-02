import SwiftUI

struct VStackSampleView: View {
    @State var alignment : HorizontalAlignment = .center
    var body: some View {
        VStack{
            VStack(alignment: alignment){
                RoundedRectangle(cornerRadius: 15).fill(.green)
                    .frame(width: 125, height: 45)
                RoundedRectangle(cornerRadius: 15).fill(.mint)
                    .frame(width: 300, height: 45)
                RoundedRectangle(cornerRadius: 15).fill(.red)
                    .frame(width: 30, height: 45)
            }
            HStack{
                Button("Leading"){
                    withAnimation{
                        alignment = .leading
                    }
                }
                Button("Center"){
                    withAnimation{
                        alignment = .center
                    }
                }
                Button("Trailing"){
                    withAnimation{
                        alignment = .trailing
                    }
                }
            }
        }
    }
}
struct VStackSampleView_Previews: PreviewProvider {
    static var previews: some View {
        VStackSampleView()
    }
}
